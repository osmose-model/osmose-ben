library(osmose)
library(osmose.extras)
library(stringr)
library(ncdf4)
library(nctools)
library(kali)

# manual inputs
base    = "osmose-ben-v4-devel"
cfg     = "osmose-ben-v3.2-Florance/BEN_all-parameters-v3.2.csv"
ltl_new = "roms_climatological-%s_benguela_15days_2000_2009.nc" # regex

plk_rename = c(Dinoflagellates="sphy", Diatoms="lphy", Ciliates="szoo", Copepods="lzoo")

# start
output = file.path(base, "osmose-ben.R")

.readConfiguration = osmose.extras:::.readConfiguration
.getPar = osmose.extras:::.getPar

ben = .readConfiguration(cfg)
bio = .getPar(ben, par="species.")

.getPar(bio, sp=0)

cat("# OSMOSE-BEN MAIN CONFIGURATION FILE\n", file=output)
cat("# Benguela Upwelling Ecosystem - South Africa\n", file=output, append = TRUE)
cat("# OSMOSE version 4.3.2\n\n", file=output, append = TRUE)

cat("# Setting the model -------------------------------------------------------\n", file=output, append = TRUE)

plk = .getPar(ben, "plankton.name")
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
out1[["fisheries.check.enabled"]] = TRUE

write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

all_sp = as.list(tolower(c(spp, plk)))
names(all_sp) = sprintf("species.name.sp%d", seq_len(nspp + nplk) - 1)
write_osmose(as.matrix(all_sp), file=output, append=TRUE, col.names = FALSE, sep=" = ")

all_type = as.list(c(rep("focal", nspp), rep("resource", nplk)))
names(all_type) = sprintf("species.type.sp%d", seq_len(nspp + nplk) - 1)
write_osmose(as.matrix(all_type), file=output, append=TRUE, col.names = FALSE, sep=" = ")

fsh_name = paste("fishery.", spp, sep="")
names(fsh_name) = sprintf("fisheries.name.fsh%d", seq_along(fsh) - 1)
fsh_name = fsh_name[fsh>0]
write_osmose(as.matrix(fsh_name), file=output, append=TRUE, col.names = FALSE, sep=" = ")

sim = .getPar(ben, "simulation")
sim0 = .getPar(sim, "nschool", invert=TRUE)
sim0 = .getPar(sim0, "nspecies", invert=TRUE)
sim0 = .getPar(sim0, "nplankton", invert=TRUE)

sim1 = .getPar(sim, "nschool")

write_osmose(as.matrix(sim0), file=output, append=TRUE, col.names = FALSE, sep=" = ")
write_osmose(as.matrix(sim1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

# convert grid to ncdf

dir.create(file.path(base, "input"), recursive = TRUE, showWarnings = FALSE)

grid_file = .getPar(ben, "grid.mask.file")
grid = as.matrix(read.csv(file.path(attr(grid_file, "path"), grid_file), sep=";", dec=".", header = FALSE)) # non ISO format!
grid = rotate(grid)
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

out1 = list(species.biomass.nsteps.year=.getPar(ben, "ltl.nstep"))
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

cat("\n# Resource Multiplier", file=output, append = TRUE)

out1 = rep(1, nplk)
names(out1) = gsub(names(plknames), pattern="name", replacement="multiplier")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

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

dir.create(file.path(base, "input", "reproduction"), recursive = TRUE)
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

out1 = .getPar(ben, "population.seeding.biomass")
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

out1 = list(population.seeding.year=.getPar(ben, "population.seeding.year"))
write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")

cat("\n# Predation configuration -------------------------------------------------\n", file=output, append = TRUE)

acc_file = .getPar(ben, "predation.accessibility.file")
acc_file = file.path(attr(acc_file, "path"), acc_file)

acc = read.csv2(acc_file, check.names = FALSE)

if(exists("plk_rename")) {
  new = plk_rename[acc[,1]]
  acc[!is.na(new), 1] = new[!is.na(new)]
}

write.csv(acc, file=file.path(base, "input", basename(acc_file)), quote = FALSE, row.names = FALSE)

out1 = .getPar(ben, "predation.accessibility.stage")
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

cat("\n# Movement configuration --------------------------------------------------\n", file=output, append = TRUE)

pars = c("movement.distribution.method", "movement.randomwalk.range")

for(ipar in pars) {
  write_osmose(as.matrix(.getPar(ben, ipar)), file=output, append=TRUE, col.names = FALSE, sep=" = ")
}

### ADD MAPS CONFIGURATION

#####

cat("\n# Fisheries configuration -------------------------------------------------\n", file=output, append = TRUE)

# copy grid as fishing area (check is one map per fishery, run humboldt)
# create catchabiilty and discards file
# write each fishery (knife-edge)

cat("\n# Output configuration ----------------------------------------------------\n", file=output, append = TRUE)

# keep main ones
# copy my own (create list, all FALSE)

cat("\n# Advanced parameters -----------------------------------------------------\n", file=output, append = TRUE)
