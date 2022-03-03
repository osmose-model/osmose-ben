library(osmose)
library(osmose.extras)
library(stringr)
library(ncdf4)
library(nctools)
library(kali)

# manual inputs
base     = "osmose-ben_v4.3_Florance"
cfg      = "osmose-ben_v3.2_Florance/BEN_all-parameters-v3.2.csv"
ltl_new  = "roms_climatological-%s_benguela_15days_2000_2009.nc" # regex
model    = "ben"

plk_start = 300
plk_rename = c(Dinoflagellates="sphy", Diatoms="lphy", Ciliates="szoo", Copepods="lzoo")
sp_reorder = c(sp0 = "euphausiids", sp1 = "anchovy", sp2 = "sardine", sp3 = "redeye",
               sp4 = "horsemackerel", sp5 = "mesopelagic", sp6 = "silverkob",
               sp7 = "snoek", sp8 = "shallowwaterhake", sp9 = "deepwaterhake")


# Start of the updating code ----------------------------------------------

for(seeding in c(TRUE, FALSE)) {

out_file = sprintf(ifelse(seeding, "osmose-%s_seeding.R", "osmose-%s.R"), model)

output = file.path(base, out_file)

ben = .readConfiguration(cfg)
ben = .getPar(ben, par="osmose.configuration", invert = TRUE)

bio = .getPar(ben, par="species.")

cat(sprintf("# OSMOSE-%s MAIN CONFIGURATION FILE\n", toupper(model)), file=output)
cat("# Benguela Upwelling Ecosystem - South Africa\n", file=output, append = TRUE)
cat("# OSMOSE version 4.3.2\n\n", file=output, append = TRUE)


# Setting the model -------------------------------------------------------


cat("# Setting the model -------------------------------------------------------\n", file=output, append = TRUE)

plk = .getPar(ben, "plankton.name")
spp = .getPar(ben, "species.name")

# reordering species
ind = match(spp, sp_reorder)
if(any(is.na(ind))) {
  xsp = paste(unlist(spp)[is.na(ind)], collapse=", ")
  message(sprintf("Incorrect species names for reordering (missing: %s)", xsp))
}

rep = sprintf(".__xxsp%d", ind - 1)
nm = names(ben)
for(i in seq_along(spp)-1) {
  nm = gsub(x=nm, pattern=sprintf("\\.sp%d$", i), replacement = rep[i+1])
}

names(ben) = gsub(x=nm, pattern = "__xx", replacement = "")
ben = ben[order(names(ben))]
# end of reordering

spp = .getPar(ben, "species.name")

fsh =  .getPar(ben, "mortality.fishing.rate.sp")

if(exists("plk_rename")) {
  plk = lapply(plk, function(x) setNames(plk_rename[x], NULL))
}

nspp = .getPar(ben, "nspecies")
nplk = length(plk)
nfsh = sum(fsh>0)


out1 = list()

out1[["simulation.nresource"]] = nplk
out1[["simulation.nspecies"]] = nspp
out1[["simulation.nfisheries"]] = nfsh
out1[["fisheries.enabled"]] = TRUE
out1[["fisheries.check.enabled"]] = FALSE

write_osmose(x=as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

all_sp = as.list(tolower(c(spp, plk)))
ind = c(seq_len(nspp) - 1, plk_start + seq_len(nplk) - 1)
names(all_sp) = sprintf("species.name.sp%d", ind)
write_osmose(as.matrix(all_sp), file=output, append=TRUE, col.names = FALSE, sep=" = ")

all_type = as.list(c(rep("focal", nspp), rep("resource", nplk)))
names(all_type) = sprintf("species.type.sp%d", ind)
write_osmose(as.matrix(all_type), file=output, append=TRUE, col.names = FALSE, sep=" = ")

fsh_name = paste("fishery.", spp, sep="")
names(fsh_name) = sprintf("fisheries.name.fsh%d", seq_along(fsh) - 1)
fsh_name = fsh_name[fsh>0]
write_osmose(as.matrix(fsh_name), file=output, append=TRUE, col.names = FALSE, sep=" = ")

sim = .getPar(ben, "simulation")
sim0 = .getPar(sim, "nschool", invert=TRUE)
sim0 = .getPar(sim0, "nspecies", invert=TRUE)
sim0 = .getPar(sim0, "nplankton", invert=TRUE)
sim0[["simulation.nsimulation"]] = 1
sim0[["simulation.time.nyear"]] = ifelse(seeding, 5*.getPar(ben, "population.seeding.year.max"), 10)

sim1 = .getPar(sim, "nschool")

write_osmose(as.matrix(sim0), file=output, append=TRUE, col.names = FALSE, sep=" = ")
write_osmose(as.matrix(sim1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

ndt = .getPar(ben, "simulation.time.ndtperyear")
# convert grid to ncdf

suppressWarnings(dir.create(file.path(base, "input"), recursive = TRUE, showWarnings = FALSE))

grid_file = .getPar(ben, "grid.mask.file")
csvgrid = as.matrix(read.csv(file.path(attr(grid_file, "path"), grid_file), sep=";", dec=".", header = FALSE)) # non ISO format!
grid = rotate(csvgrid)
grid[grid==-99] = NA
grid = 0 + !grid

grid_file = file.path("input", gsub(grid_file, pattern=".csv$", replacement = ".nc"))

theGrid = osmose_grid(ben)

vars = list(mask = grid, area=theGrid$area,
            latitude=theGrid$LAT, longitude=theGrid$LON)
dims = list(x=seq_len(nrow(grid)), y=seq_len(ncol(grid)))

write_ncdf(vars, filename = file.path(base, grid_file), dim = dims)

out1 = list()
out1[["grid.java.classname"]] = "fr.ird.osmose.grid.NcGrid"
out1[["grid.netcdf.file"]]    = grid_file
out1[["grid.var.lat"]]        = "latitude"
out1[["grid.var.lon"]]        = "longitude"
out1[["grid.var.mask"]]       = "mask"

write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


# Resource configuration --------------------------------------------------


cat("\n# Resource configuration --------------------------------------------------\n", file=output, append = TRUE)

ltl_file = .getPar(ben, "ltl.netcdf.file")
ltl_file = file.path(attr(ltl_file, "path"), ltl_file)

plknames = unlist(all_sp)[unlist(all_type)=="resource"]

for(i in seq_len(nplk)) {
  iplk = plknames[i]
  nc_subset(ltl_file, varid="ltl_biomass", newvarid = iplk, drop=TRUE,
            output=file.path(base, "input", sprintf(ltl_new, iplk)), ltl=i)
}

plkfiles = file.path("input", sprintf(ltl_new, plknames))
names(plkfiles) = gsub(names(plknames), pattern="name", replacement="file")
plkfiles = as.list(plkfiles)

write_osmose(as.matrix(plkfiles), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = rep(.getPar(ben, "ltl.nstep"), length(plk))
names(out1) = gsub(names(plknames), pattern="species.name", replacement="species.biomass.nsteps.year")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = .getPar(ben, "plankton.accessibility2fish")
names(out1) = gsub(names(plknames), pattern="name", replacement="accessibility2fish")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Resource sizes", file=output, append = TRUE)

out1 = .getPar(ben, "plankton.size.min")
names(out1) = gsub(names(plknames), pattern="name", replacement="size.min")
out2 = .getPar(ben, "plankton.size.max")
names(out2) = gsub(names(plknames), pattern="name", replacement="size.max")
out1 = c(out1, out2)
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Resource Trophic Level", file=output, append = TRUE)

out1 = .getPar(ben, "plankton.tl")
names(out1) = gsub(names(plknames), pattern="name", replacement="TL")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


# Species configuration ---------------------------------------------------

cat("\n# Species configuration ---------------------------------------------------\n", file=output, append = TRUE)

cat("\n# Growth: von Bertalanffy growth model", file=output, append = TRUE)

pars = c("species.lInf", "species.K", "species.t0", "species.vonbertalanffy.threshold.age",
         "species.length2weight.condition.factor", "species.length2weight.allometric.power",
         "species.lifespan")

for(ipar in pars) {
  write_osmose(as.matrix(.getPar(ben, ipar)), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

cat("\n# Reproduction", file=output, append = TRUE)

write_osmose(as.matrix(.getPar(ben, "species.relativefecundity")), file=output, append=TRUE, col.names = FALSE, sep=" = ")

rep_files = .getPar(ben, "reproduction.season.file")
rep_files = sapply(rep_files, function(x) file.path(attr(x, "path"), x))

suppressWarnings(dir.create(file.path(base, "input", "reproduction"), recursive = TRUE))
file.copy(rep_files, to=file.path(base, "input", "reproduction"))

rep_files = .getPar(ben, "reproduction.season.file")
rep_files = lapply(rep_files, function(x) file.path("input/reproduction", x))

write_osmose(as.matrix(rep_files), file=output, append=TRUE, col.names = FALSE, sep=" = ")

# update maturity length

mat_age = .getPar(ben, "species.maturity.age")
if(!is.null(mat_age)) {

  mat = spp
  names(mat) = gsub(names(mat), pattern="name", replacement = "maturity.size")

  for(i in seq_len(nspp) - 1) {
    this = .getPar(ben, sp=i)
    len = .getPar(this, "species.maturity.size")
    if(!is.null(len)) {
      mat[[i+1]] = len
    } else {
      age = .getPar(this, "species.maturity.age")
      mat[[i+1]] = round(osmose.extras:::VB(age, this), 1)
    }
  }
}

pars = c("species.egg.size", "species.egg.weight", "species.sexratio")

for(ipar in pars) {
  write_osmose(as.matrix(.getPar(ben, ipar)), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

write_osmose(as.matrix(mat), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Survival", file=output, append = TRUE)

out1 = list(mortality.subdt = .getPar(ben, "mortality.subdt"))
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = .getPar(ben, "mortality.natural.rate")
names(out1) = gsub(names(out1), pattern="natural", replacement = "additional")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = .getPar(ben, "mortality.natural.larva.rate")
names(out1) = gsub(names(out1), pattern="natural", replacement = "additional")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = .getPar(ben, "mortality.starvation.rate")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


# Predation configuration -------------------------------------------------

cat("\n# Predation configuration -------------------------------------------------\n", file=output, append = TRUE)

acc_file = .getPar(ben, "predation.accessibility.file")
acc_file = file.path(attr(acc_file, "path"), acc_file)

acc = read.csv2(acc_file, check.names = FALSE)

names(acc) = gsub(names(acc), pattern="year$", replacement = "")
acc[, 1] = gsub(acc[, 1], pattern="year$", replacement = "")

names(acc) = gsub(names(acc), pattern="-", replacement = "")
acc[, 1] = gsub(acc[, 1], pattern="-", replacement = "")

names(acc) = gsub(names(acc), pattern=">.*", replacement = "")
acc[, 1] = gsub(acc[, 1], pattern=">.*", replacement = "")

if(exists("plk_rename")) {
  new = plk_rename[acc[,1]]
  acc[!is.na(new), 1] = new[!is.na(new)]
}

write.csv(acc, file=file.path(base, "input", basename(acc_file)), quote = FALSE, row.names = FALSE)

out1 = list()
out1[["predation.accessibility.stage.structure"]] = .getPar(ben, "predation.accessibility.stage.structure")
out1[["predation.accessibility.file"]] = file.path("input", basename(acc_file))
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


pars = c("predation.efficiency.critical", "predation.ingestion.rate.max")

for(ipar in pars) {
  write_osmose(as.matrix(.getPar(ben, ipar)), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

pp = "predation.predPrey.sizeRatio"
for(i in seq_len(nspp)-1) {
  ipar = .getPar(ben, sp=i)
  xx = .getPar(ipar, pp)
  xx = lapply(xx, FUN=paste, collapse=", ")
  write_osmose(as.matrix(xx), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

out1 = .getPar(ben, "predation.predPrey.stage")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


# Movement configuration --------------------------------------------------

cat("\n# Movement configuration --------------------------------------------------\n", file=output, append = TRUE)

suppressWarnings(dir.create(file.path(base, "input", "maps"), recursive = TRUE))

out1 = list()
out1[["movement.checks.enabled"]] = FALSE
out1[["movement.netcdf.enabled"]] = TRUE
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

pars = c("movement.distribution.method", "movement.randomwalk.range")

for(ipar in pars) {
  write_osmose(as.matrix(.getPar(ben, ipar)), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

out1 = update_maps(input=cfg, output=file.path(base, "input", "maps"), conf=output, sep = ";")

for(i in seq_along(out1)) {
  write_osmose(as.matrix(out1[[i]]), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}


# Fisheries configuration -------------------------------------------------


cat("\n# Fisheries configuration -------------------------------------------------\n", file=output, append = TRUE)

out1 = list()
out1[["simulation.fishing.mortality.enabled"]] = TRUE
out1[["fisheries.movement.netcdf.enabled"]] = TRUE
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

fsh.dir = file.path(base, "input", "fisheries")
suppressWarnings(dir.create(fsh.dir))
# create generic map (identical to mask)
fleetMap = array(dim=c(dim(grid), .getPar(ben, "simulation.time.ndt")))
fleetMap[] = as.numeric(grid)
fleetMap[fleetMap<0] = NA
dim = setNames(lapply(base::dim(fleetMap), seq_len), nm=c("x", "y", "time"))
file = file.path(fsh.dir, "mapFleets.nc")
write_ncdf(fleetMap, filename = file, varid = "area",
           dim=dim, missval = -99, unlim="time")

fshgrid = csvgrid
fshgrid[fshgrid==0] = 1
write.table(fshgrid, file=file.path(fsh.dir, "mapFleets.csv"), row.names = FALSE,
          col.names = FALSE, sep = ",", dec=".")

# update recruitment length
rec_age = .getPar(ben, "mortality.fishing.recruitment.age")
if(!is.null(rec_age)) {

  rec = spp
  names(rec) = gsub(names(rec), pattern="species.name", replacement = "mortality.fishing.recruitment.size")

  for(i in seq_len(nspp) - 1) {
    this = .getPar(ben, sp=i)
    len = .getPar(this, "mortality.fishing.recruitment.size")
    if(!is.null(len)) {
      rec[[i+1]] = len
    } else {
      age = .getPar(this, "mortality.fishing.recruitment.age")
      rec[[i+1]] = round(osmose.extras:::VB(age, this), 1)
    }
  }
}

# create catchabiilty and discards file

form = matrix(0, nrow=nspp, ncol=nspp)
diag(form) = 1
rownames(form) = unlist(spp)
colnames(form) = paste("fishery", unlist(spp), sep=".")
form = form[, fsh>0]
access = form
discards = 0*form

write_osmose(form, file=file.path(base, "input","fisheries", "catchability.csv"))
write_osmose(0*form, file=file.path(base, "input","fisheries", "discards.csv"))

out1 = list()
out1[["fisheries.catchability.file"]] = file.path("input","fisheries", "catchability.csv")
out1[["fisheries.discards.file"]] = file.path("input","fisheries", "discards.csv")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

# write each fishery (knife-edge)

for(i in seq_along(fsh)) {

  psp = .getPar(ben, sp=i-1)
  Frate = .getPar(psp, "mortality.fishing.rate.sp")
  if(Frate==0) next
  Fseason = .getPar(psp, "mortality.fishing.season.distrib.file")
  file.copy(file.path(attr(Fseason, "path"), Fseason), to=file.path(base, "input", "fisheries"))
  Fseason = file.path("input", "fisheries", basename(Fseason))

  cat("\n# Fishery", i-1, sprintf("(%s)", spp[[i]]), file=output, append = TRUE)
  out1 = list()
  out1[[sprintf("fisheries.rate.base.log.enabled.fsh%d", i-1)]] = FALSE
  out1[[sprintf("fisheries.rate.base.fsh%d", i-1)]] = Frate
  out1[[sprintf("fisheries.period.number.fsh%d", i-1)]] = 1
  out1[[sprintf("fisheries.period.start.fsh%d", i-1)]] = 0
  out1[[sprintf("fisheries.rate.byperiod.fsh%d", i-1)]] = 1
  out1[[sprintf("fisheries.seasonality.file.fsh%d", i-1)]] = Fseason
  out1[[sprintf("fisheries.selectivity.type.fsh%d", i-1)]] = 0
  out1[[sprintf("fisheries.selectivity.l50.fsh%d", i-1)]] = .getPar(rec, sp=i-1)
  out1[[sprintf("fisheries.selectivity.l75.fsh%d", i-1)]] = round(1.01*.getPar(rec, sp=i-1), 1)
  write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

  if(TRUE) {
    out1 = list()
    out1[[sprintf("fisheries.movement.fishery.map%d", i-1)]]  = paste("fishery", spp[[i]], sep=".")
    out1[[sprintf("fisheries.movement.variable.map%d", i-1)]] = "area"
    out1[[sprintf("fisheries.movement.nsteps.year.map%d", i-1)]] = 24
    out1[[sprintf("fisheries.movement.file.map%d", i-1)]] = file.path("input", "fisheries", "mapFleets.nc")
    write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")
  } else {
    out1 = list()
    out1[[sprintf("fisheries.movement.fishery.map%d", i-1)]]  = paste("fishery", spp[[i]], sep=".")
    out1[[sprintf("fisheries.movement.season.map%d", i-1)]] = paste(seq_len(ndt)-1, collapse=",")
    out1[[sprintf("fisheries.movement.year.min.map%d", i-1)]] = 0
    out1[[sprintf("fisheries.movement.year.max.map%d", i-1)]] = .getPar(ben, "simulation.time.nyear")
    out1[[sprintf("fisheries.movement.file.map%d", i-1)]] = file.path("input", "fisheries", "mapFleets.csv")
    write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")
  }

}


# Output configuration ----------------------------------------------------


cat("\n# Output configuration ----------------------------------------------------\n", file=output, append = TRUE)

# keep main ones
out1 = list()
out1[["output.start.year"]] = ifelse(seeding, 2*.getPar(ben, "population.seeding.year.max"), 0)
out1[["output.restart.enabled"]] = seeding
out1[["output.file.prefix "]] = tolower(model)
out1[["output.step0.include"]] = FALSE
out1[["output.recordfrequency.ndt"]] = .getPar(ben, "simulation.time.ndt")/12 # monthly
out1[["output.cutoff.enabled"]] = FALSE
out1[["output.fishery.enabled"]] = TRUE
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.yield.biomass.enabled"]] = TRUE
out[["output.yield.biomass.bySize.enabled"]] = FALSE
out[["output.yield.biomass.byAge.enabled"]] = FALSE
out[["output.yield.abundance.enabled"]] = FALSE
out[["output.yield.abundance.bySize.enabled"]] = FALSE
out[["output.yield.abundance.byAge.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")
out = list()
out[["output.yield.biomass.netcdf.enabled"]] = FALSE
out[["output.yield.biomass.bySize.netcdf.enabled"]] = FALSE
out[["output.yield.biomass.byage.netcdf.enabled"]] = FALSE
out[["output.yield.abundance.netcdf.enabled"]] = FALSE
out[["output.yield.abundance.bySize.netcdf.enabled"]] = FALSE
out[["output.yield.abundance.byage.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.biomass.enabled"]] = TRUE
out[["output.biomass.bysize.enabled"]] = FALSE
out[["output.biomass.byage.enabled"]] = FALSE
out[["output.biomass.bytl.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.biomass.netcdf.enabled"]] = FALSE
out[["output.biomass.bysize.netcdf.enabled"]] = FALSE
out[["output.biomass.byage.netcdf.enabled"]] = FALSE
out[["output.biomass.bytl.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.abundance.enabled"]] = FALSE
out[["output.abundance.age1.enabled"]] = FALSE
out[["output.abundance.bysize.enabled"]] = FALSE
out[["output.abundance.byage.enabled"]] = FALSE
out[["output.abundance.bytl.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.abundance.netcdf.enabled"]] = FALSE
out[["output.abundance.bysize.netcdf.enabled"]] = FALSE
out[["output.abundance.byage.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.meanSize.byAge.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.diet.pressure.netcdf.enabled"]] = FALSE
out[["output.diet.composition.netcdf.enabled"]] = FALSE
out[["output.diet.composition.byage.netcdf.enabled"]] = FALSE
out[["output.diet.composition.bysize.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.spatial.enabled"]] = FALSE
out[["output.spatial.ltl.enabled"]] = FALSE
out[["output.spatialabundance.enabled"]] = FALSE
out[["output.spatialbiomass.enabled"]] = FALSE
out[["output.spatialsize.enabled"]] = FALSE
out[["output.spatialtl.enabled"]] = FALSE
out[["output.spatialsizespecies.enabled"]] = FALSE
out[["output.spatialagespecies.enabled"]] = FALSE
out[["output.spatial.yield.biomass.enabled"]] = FALSE
out[["output.spatial.yield.abundance.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.mortality.enabled"]] = FALSE
out[["output.mortality.perSpecies.byage.enabled"]] = FALSE
out[["output.mortality.perSpecies.bysize.enabled"]] = FALSE
out[["output.mortality.additional.bySize.enabled"]] = FALSE
out[["output.mortality.additional.byAge.enabled"]] = FALSE
out[["output.mortality.additional.byAge.enabled"]] = FALSE
out[["output.mortality.additionalN.bySize.enabled"]] = FALSE
out[["output.mortality.additionalN.byAge.enabled"]] = FALSE
out[["output.mortality.perSpecies.byage.netcdf.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.size.enabled"]] = FALSE
out[["output.size.catch.enabled"]] = FALSE
out[["output.tl.enabled"]] = FALSE
out[["output.tl.catch.enabled"]] = FALSE
out[["output.meanTL.bySize.enabled"]] = FALSE
out[["output.meanTL.byAge.enabled"]] = FALSE
out[["output.weight.enabled"]] = FALSE
out[["output.meanSize.byAge.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.diet.composition.enabled"]] = FALSE
out[["output.diet.composition.byage.enabled"]] = FALSE
out[["output.diet.composition.bysize.enabled"]] = FALSE
out[["output.diet.pressure.enabled"]] = FALSE
out[["output.diet.pressure.enabled"]] = FALSE
out[["output.diet.pressure.byage.enabled"]] = FALSE
out[["output.diet.pressure.bysize.enabled"]] = FALSE
out[["output.diet.success.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["output.spatialenet.enabled"]] = FALSE
out[["output.spatialenetlarvae.enabled"]] = FALSE
out[["output.spatialenetjuv.enabled"]] = FALSE
out[["output.spatialdg.enabled"]] = FALSE
out[["output.spatialegg.enabled"]] = FALSE
out[["output.spatialMstarv.enabled"]] = FALSE
out[["output.spatialMpred.enabled"]] = FALSE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Output distribution configuration", file=output, append = TRUE)

.getDistributionConfig = function(conf, sp, type, n) {

  .getIncrement = function(n, x) {
    int = c(0.1, 0.02, 0.025, 0.05, 0.1, 0.2, 0.25, 0.5, 1, 2, 5, 10, 20, 25, 50, 100, 200, 250, 500, 1000)
    out = x/int
    out = int[which.min(abs(out-n))]
    return(out)
  }

  type = tolower(type)

  x = switch(type,
             "size" = ceiling(1.2*.getPar(.getPar(ben, sp=sp), "linf")),
             "age"  = ceiling(.getPar(.getPar(ben, sp=sp), "lifespan")),
             "tl"   = 5)

  if(missing(n)) {
    n = switch(type,
               "size" = 50,
               "age"  = 10,
               "tl"   = 20)
  }

  incr = .getIncrement(x=x, n=n)

  if(type=="age") incr = min(incr, 1) # less than one year only

  patt = c("output.distrib.by%s.min.sp%d", "output.distrib.by%s.max.sp%d", "output.distrib.by%s.incr.sp%d")
  out = setNames(list(0, x, incr), nm = sprintf(patt, type, sp))
  return(out)

}

for(sp in seq_along(spp)-1) {

  out1 = .getDistributionConfig(conf=ben, sp=sp, type="size")
  write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

  out1 = .getDistributionConfig(conf=ben, sp=sp, type="age")
  write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

  out1 = .getDistributionConfig(conf=ben, sp=sp, type="TL")
  write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

}


# Model initialization ----------------------------------------------------

cat("\n# Model initialization ----------------------------------------------------\n", file=output, append = TRUE)

inifile = file.path("input", "initial_conditions.osm")
if(seeding) inifile = NULL

out = list()
out[["population.seeding.year.max"]] = ifelse(seeding, .getPar(ben, "population.seeding.year.max"), 0)
out[["population.initialization.relativebiomass.enabled"]] = FALSE
out[["osmose.configuration.initialization"]] = inifile
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = .getPar(ben, "population.seeding.biomass")
if(!seeding) out1 = t(as.data.frame(out1))*0
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

if(seeding) message("You must run:\n\tinitialize_osmose(..., type='ncdf')\nto complete the setup.")

# Advanced parameters -----------------------------------------------------


cat("\n# Advanced parameters -----------------------------------------------------\n", file=output, append = TRUE)

out = list()
out[["osmose.version"]] = "4.3.3"
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Simulation restart parameters", file=output, append = TRUE)
out = list()
out[["simulation.restart.recordfrequency.ndt"]] = 24
out[["output.restart.spinup"]] = 3*.getPar(ben, "population.seeding.year.max")
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["ltl.java.classname"]] = "fr.ird.osmose.ltl.LTLFastForcing"
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# EV-OSMOSE activation", file=output, append = TRUE)
out = list()
out[["simulation.bioen.enabled"]] = FALSE
out[["simulation.genetic.enabled"]] = FALSE
out[["simulation.incoming.flux.enabled"]] = TRUE
write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out = list()
out[["movement.randomseed.fixed"]] = FALSE
out[["reproduction.randomseed.fixed"]] = FALSE
out[["stochastic.mortality.seed"]] = 10

write_osmose(as.matrix(out), file=output, append=TRUE, col.names = FALSE, sep=" = ")

}

cat("Update complete.")

