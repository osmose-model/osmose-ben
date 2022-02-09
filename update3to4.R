library(osmose)
library(osmose.extras)
library(stringr)

output = file.path("osmose-ben-v4-devel", "osmose-ben.R")

.readConfiguration = osmose.extras:::.readConfiguration
.getPar = osmose.extras:::.getPar

ben = .readConfiguration("osmose-ben-v3.2-Florance/BEN_all-parameters-v3.2.csv")
bio = .getPar(ben, par="species.")

.getPar(bio, sp=0)

cat("# OSMOSE-BEN MAIN CONFIGURATION FILE\n", file=output)
cat("# Benguela Upwelling Ecosystem - South Africa\n", file=output, append = TRUE)
cat("# OSMOSE version 4.3.2\n\n", file=output, append = TRUE)

cat("# Setting the model -------------------------------------------------------\n", file=output, append = TRUE)

plk = .getPar(ben, "plankton.name")
spp = .getPar(ben, "species.name")
fsh =  .getPar(ben, "mortality.fishing.rate.sp")

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

out1[["grid.java.classname"]] = "fr.ird.osmose.grid.NcGrid"
out1[["grid.netcdf.file"]]    = "input/gridMask_benguela.nc"
out1[["grid.var.lat"]]        = "latitude"
out1[["grid.var.lon"]]        = "longitude"
out1[["grid.var.mask"]]       = "mask"

write_osmose(as.matrix(out1), file=output, append=TRUE, col.names = FALSE, sep=" = ")


