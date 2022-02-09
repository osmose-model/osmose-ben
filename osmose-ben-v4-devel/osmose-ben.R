# OSMOSE-BEN MAIN CONFIGURATION FILE
# Benguela Upwelling Ecosystem - South Africa
# OSMOSE version 4.3.2

# Setting the model -------------------------------------------------------

simulation.nresource = 4
simulation.nspecies = 10
simulation.nfisheries = 9
fisheries.enabled = TRUE
fisheries.check.enabled = TRUE

species.name.sp0 = anchovy
species.name.sp1 = euphausiids
species.name.sp2 = shallowwaterhake
species.name.sp3 = deepwaterhake
species.name.sp4 = horsemackerel
species.name.sp5 = mesopelagic
species.name.sp6 = redeye
species.name.sp7 = sardine
species.name.sp8 = silverkob
species.name.sp9 = snoek
species.name.sp10 = dinoflagellates
species.name.sp11 = diatoms
species.name.sp12 = ciliates
species.name.sp13 = copepods

species.type.sp0 = focal
species.type.sp1 = focal
species.type.sp2 = focal
species.type.sp3 = focal
species.type.sp4 = focal
species.type.sp5 = focal
species.type.sp6 = focal
species.type.sp7 = focal
species.type.sp8 = focal
species.type.sp9 = focal
species.type.sp10 = resource
species.type.sp11 = resource
species.type.sp12 = resource
species.type.sp13 = resource

fisheries.name.fsh0 = fishery.anchovy
fisheries.name.fsh2 = fishery.shallowwaterhake
fisheries.name.fsh3 = fishery.deepwaterhake
fisheries.name.fsh4 = fishery.horsemackerel
fisheries.name.fsh5 = fishery.mesopelagic
fisheries.name.fsh6 = fishery.redeye
fisheries.name.fsh7 = fishery.sardine
fisheries.name.fsh8 = fishery.silverkob
fisheries.name.fsh9 = fishery.snoek

simulation.ncpu = 1
simulation.nsimulation = 5
simulation.time.ndtperyear = 24
simulation.time.nyear = 100

simulation.nschool.sp0 = 24
simulation.nschool.sp1 = 100
simulation.nschool.sp2 = 24
simulation.nschool.sp3 = 24
simulation.nschool.sp4 = 24
simulation.nschool.sp5 = 100
simulation.nschool.sp6 = 24
simulation.nschool.sp7 = 24
simulation.nschool.sp8 = 24
simulation.nschool.sp9 = 24

grid.java.classname = fr.ird.osmose.grid.NcGrid
grid.netcdf.file = input/grid-mask.nc
grid.var.lat = latitude
grid.var.lon = longitude
grid.var.mask = mask
