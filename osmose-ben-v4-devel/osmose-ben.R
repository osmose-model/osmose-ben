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
species.name.sp10 = sphy
species.name.sp11 = lphy
species.name.sp12 = szoo
species.name.sp13 = lzoo

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

# Resource configuration --------------------------------------------------

species.file.sp10 = input/roms_climatological-sphy_benguela_15days_2000_2009.nc
species.file.sp11 = input/roms_climatological-lphy_benguela_15days_2000_2009.nc
species.file.sp12 = input/roms_climatological-szoo_benguela_15days_2000_2009.nc
species.file.sp13 = input/roms_climatological-lzoo_benguela_15days_2000_2009.nc

species.biomass.nsteps.year = 24

species.accessibility2fish.sp10 = 0.026894718
species.accessibility2fish.sp11 = 0.002977831
species.accessibility2fish.sp12 = 0.014176891
species.accessibility2fish.sp13 = 0.185446482

# Resource sizes
species.size.min.sp10 = 2e-04
species.size.min.sp11 = 0.002
species.size.min.sp12 = 0.002
species.size.min.sp13 = 0.02
species.size.max.sp10 = 0.002
species.size.max.sp11 = 0.02
species.size.max.sp12 = 0.02
species.size.max.sp13 = 0.3

# Resource Trophic Level
species.TL.sp10 = 1
species.TL.sp11 = 1
species.TL.sp12 = 2
species.TL.sp13 = 2.5

# Resource Multiplier
species.multiplier.sp10 = 1
species.multiplier.sp11 = 1
species.multiplier.sp12 = 1
species.multiplier.sp13 = 1

# Species configuration ---------------------------------------------------

# Growth: von Bertalanffy growth model
species.linf.sp0 = 14.8
species.linf.sp1 = 1.84
species.linf.sp2 = 270.6
species.linf.sp3 = 219.4
species.linf.sp4 = 54.5
species.linf.sp5 = 7
species.linf.sp6 = 30.1
species.linf.sp7 = 26
species.linf.sp8 = 116
species.linf.sp9 = 115.3

species.k.sp0 = 1.37
species.k.sp1 = 1.682
species.k.sp2 = 0.039
species.k.sp3 = 0.049
species.k.sp4 = 0.183
species.k.sp5 = 1.66
species.k.sp6 = 0.71
species.k.sp7 = 0.26
species.k.sp8 = 0.12
species.k.sp9 = 0.294

species.t0.sp0 = -0.03
species.t0.sp1 = -0.198
species.t0.sp2 = -0.73
species.t0.sp3 = -0.914
species.t0.sp4 = -0.65
species.t0.sp5 = 0.06
species.t0.sp6 = 0.28
species.t0.sp7 = -1.5
species.t0.sp8 = -1.47
species.t0.sp9 = -0.1

species.vonbertalanffy.threshold.age.sp0 = 1
species.vonbertalanffy.threshold.age.sp1 = 0.17
species.vonbertalanffy.threshold.age.sp2 = 1
species.vonbertalanffy.threshold.age.sp3 = 1
species.vonbertalanffy.threshold.age.sp4 = 1
species.vonbertalanffy.threshold.age.sp5 = 1
species.vonbertalanffy.threshold.age.sp6 = 1
species.vonbertalanffy.threshold.age.sp7 = 1
species.vonbertalanffy.threshold.age.sp8 = 1
species.vonbertalanffy.threshold.age.sp9 = 1

species.length2weight.condition.factor.sp0 = 0.007
species.length2weight.condition.factor.sp1 = 0.00738
species.length2weight.condition.factor.sp2 = 0.00654
species.length2weight.condition.factor.sp3 = 0.00785
species.length2weight.condition.factor.sp4 = 0.009
species.length2weight.condition.factor.sp5 = 0.008
species.length2weight.condition.factor.sp6 = 0.009
species.length2weight.condition.factor.sp7 = 0.009
species.length2weight.condition.factor.sp8 = 0.007
species.length2weight.condition.factor.sp9 = 0.018

species.length2weight.allometric.power.sp0 = 3
species.length2weight.allometric.power.sp1 = 3.16
species.length2weight.allometric.power.sp2 = 3.0425
species.length2weight.allometric.power.sp3 = 2.9759
species.length2weight.allometric.power.sp4 = 3
species.length2weight.allometric.power.sp5 = 3
species.length2weight.allometric.power.sp6 = 3
species.length2weight.allometric.power.sp7 = 3
species.length2weight.allometric.power.sp8 = 3
species.length2weight.allometric.power.sp9 = 3

species.lifespan.sp0 = 5
species.lifespan.sp1 = 1
species.lifespan.sp2 = 15
species.lifespan.sp3 = 15
species.lifespan.sp4 = 8
species.lifespan.sp5 = 2
species.lifespan.sp6 = 6
species.lifespan.sp7 = 10
species.lifespan.sp8 = 25
species.lifespan.sp9 = 10

# Reproduction
species.relativefecundity.sp0 = 8000
species.relativefecundity.sp1 = 42254
species.relativefecundity.sp2 = 500
species.relativefecundity.sp3 = 500
species.relativefecundity.sp4 = 250
species.relativefecundity.sp5 = 646
species.relativefecundity.sp6 = 750
species.relativefecundity.sp7 = 2400
species.relativefecundity.sp8 = 150
species.relativefecundity.sp9 = 130

reproduction.season.file.sp0 = input/reproduction/reproduction-seasonality-sp0.csv
reproduction.season.file.sp1 = input/reproduction/reproduction-seasonality-sp1.csv
reproduction.season.file.sp2 = input/reproduction/reproduction-seasonality-sp2.csv
reproduction.season.file.sp3 = input/reproduction/reproduction-seasonality-sp3.csv
reproduction.season.file.sp4 = input/reproduction/reproduction-seasonality-sp4.csv
reproduction.season.file.sp5 = input/reproduction/reproduction-seasonality-sp5.csv
reproduction.season.file.sp6 = input/reproduction/reproduction-seasonality-sp6.csv
reproduction.season.file.sp7 = input/reproduction/reproduction-seasonality-sp7.csv
reproduction.season.file.sp8 = input/reproduction/reproduction-seasonality-sp8.csv
reproduction.season.file.sp9 = input/reproduction/reproduction-seasonality-sp9.csv

species.egg.size.sp0 = 0.1
species.egg.size.sp1 = 0.1
species.egg.size.sp2 = 0.1
species.egg.size.sp3 = 0.1
species.egg.size.sp4 = 0.1
species.egg.size.sp5 = 0.1
species.egg.size.sp6 = 0.1
species.egg.size.sp7 = 0.1
species.egg.size.sp8 = 0.1
species.egg.size.sp9 = 0.1

species.egg.weight.sp0 = 0.000539
species.egg.weight.sp1 = 0.000539
species.egg.weight.sp2 = 0.000539
species.egg.weight.sp3 = 0.000539
species.egg.weight.sp4 = 0.000539
species.egg.weight.sp5 = 0.000539
species.egg.weight.sp6 = 0.000539
species.egg.weight.sp7 = 0.000539
species.egg.weight.sp8 = 0.000539
species.egg.weight.sp9 = 0.000539

species.sexratio.sp0 = 0.5
species.sexratio.sp1 = 0.5
species.sexratio.sp2 = 0.5
species.sexratio.sp3 = 0.5
species.sexratio.sp4 = 0.5
species.sexratio.sp5 = 0.5
species.sexratio.sp6 = 0.5
species.sexratio.sp7 = 0.5
species.sexratio.sp8 = 0.5
species.sexratio.sp9 = 0.5

species.maturity.size.sp0 = 11.2
species.maturity.size.sp1 = 1.05
species.maturity.size.sp2 = 52
species.maturity.size.sp3 = 42.1
species.maturity.size.sp4 = 26.6
species.maturity.size.sp5 = 3.7
species.maturity.size.sp6 = 12
species.maturity.size.sp7 = 18
species.maturity.size.sp8 = 39.5
species.maturity.size.sp9 = 73

# Survival
mortality.subdt = 10

mortality.additional.rate.sp0 = 0.403
mortality.additional.rate.sp1 = 0.1
mortality.additional.rate.sp2 = 0.228
mortality.additional.rate.sp3 = 0.174
mortality.additional.rate.sp4 = 0.314
mortality.additional.rate.sp5 = 0.226
mortality.additional.rate.sp6 = 0.208
mortality.additional.rate.sp7 = 0.365
mortality.additional.rate.sp8 = 0.228
mortality.additional.rate.sp9 = 0.132

mortality.additional.larva.rate.sp0 = 5.790887
mortality.additional.larva.rate.sp1 = 5.004677
mortality.additional.larva.rate.sp2 = 3.068959
mortality.additional.larva.rate.sp3 = 3.903988
mortality.additional.larva.rate.sp4 = 3.847284
mortality.additional.larva.rate.sp5 = 4.358056
mortality.additional.larva.rate.sp6 = 5.206346
mortality.additional.larva.rate.sp7 = 2.719504
mortality.additional.larva.rate.sp8 = 6.674349
mortality.additional.larva.rate.sp9 = 9.55594

mortality.starvation.rate.max.sp0 = 3
mortality.starvation.rate.max.sp1 = 3
mortality.starvation.rate.max.sp2 = 3
mortality.starvation.rate.max.sp3 = 3
mortality.starvation.rate.max.sp4 = 3
mortality.starvation.rate.max.sp5 = 3
mortality.starvation.rate.max.sp6 = 3
mortality.starvation.rate.max.sp7 = 3
mortality.starvation.rate.max.sp8 = 3
mortality.starvation.rate.max.sp9 = 3

population.seeding.biomass.sp0 = 3888750
population.seeding.biomass.sp1 = 3129213
population.seeding.biomass.sp2 = 575361
population.seeding.biomass.sp3 = 591907
population.seeding.biomass.sp4 = 1138339
population.seeding.biomass.sp5 = 1439984
population.seeding.biomass.sp6 = 1286364
population.seeding.biomass.sp7 = 3029155
population.seeding.biomass.sp8 = 198865
population.seeding.biomass.sp9 = 81054

population.seeding.year = 30

# Predation configuration -------------------------------------------------

predation.accessibility.stage.structure = age
predation.accessibility.stage.threshold.sp0 = NULL
predation.accessibility.stage.threshold.sp1 = NULL
predation.accessibility.stage.threshold.sp2 = 1
predation.accessibility.stage.threshold.sp3 = 1
predation.accessibility.stage.threshold.sp4 = NULL
predation.accessibility.stage.threshold.sp5 = NULL
predation.accessibility.stage.threshold.sp6 = NULL
predation.accessibility.stage.threshold.sp7 = NULL
predation.accessibility.stage.threshold.sp8 = NULL
predation.accessibility.stage.threshold.sp9 = NULL

predation.efficiency.critical.sp0 = 0.57
predation.efficiency.critical.sp1 = 0.57
predation.efficiency.critical.sp2 = 0.57
predation.efficiency.critical.sp3 = 0.57
predation.efficiency.critical.sp4 = 0.57
predation.efficiency.critical.sp5 = 0.57
predation.efficiency.critical.sp6 = 0.57
predation.efficiency.critical.sp7 = 0.57
predation.efficiency.critical.sp8 = 0.57
predation.efficiency.critical.sp9 = 0.57

predation.ingestion.rate.max.sp0 = 3.5
predation.ingestion.rate.max.sp1 = 3.5
predation.ingestion.rate.max.sp2 = 3.22
predation.ingestion.rate.max.sp3 = 3.15
predation.ingestion.rate.max.sp4 = 3.5
predation.ingestion.rate.max.sp5 = 3.5
predation.ingestion.rate.max.sp6 = 3.5
predation.ingestion.rate.max.sp7 = 3.5
predation.ingestion.rate.max.sp8 = 2.7
predation.ingestion.rate.max.sp9 = 3.15

predation.predprey.sizeratio.max.sp0 = 10, 5
predation.predprey.sizeratio.min.sp0 = 100, 500

predation.predprey.sizeratio.max.sp1 = 15, 5
predation.predprey.sizeratio.min.sp1 = 300, 100

predation.predprey.sizeratio.max.sp2 = 3.5, 1.8
predation.predprey.sizeratio.min.sp2 = 50, 50

predation.predprey.sizeratio.max.sp3 = 3.5, 1.8
predation.predprey.sizeratio.min.sp3 = 50, 50

predation.predprey.sizeratio.max.sp4 = 10, 5
predation.predprey.sizeratio.min.sp4 = 100, 100

predation.predprey.sizeratio.max.sp5 = 2.5
predation.predprey.sizeratio.min.sp5 = 100

predation.predprey.sizeratio.max.sp6 = 10
predation.predprey.sizeratio.min.sp6 = 100

predation.predprey.sizeratio.max.sp7 = 100, 200
predation.predprey.sizeratio.min.sp7 = 200, 4000

predation.predprey.sizeratio.max.sp8 = 3.5
predation.predprey.sizeratio.min.sp8 = 70

predation.predprey.sizeratio.max.sp9 = 3.5
predation.predprey.sizeratio.min.sp9 = 70

predation.predprey.stage.structure = size
predation.predprey.stage.threshold.sp0 = 8
predation.predprey.stage.threshold.sp1 = 0.6
predation.predprey.stage.threshold.sp2 = 27
predation.predprey.stage.threshold.sp3 = 29
predation.predprey.stage.threshold.sp4 = 10
predation.predprey.stage.threshold.sp5 = NULL
predation.predprey.stage.threshold.sp6 = NULL
predation.predprey.stage.threshold.sp7 = 10
predation.predprey.stage.threshold.sp8 = NULL
predation.predprey.stage.threshold.sp9 = NULL

# Movement configuration --------------------------------------------------

movement.distribution.method.sp0 = maps
movement.distribution.method.sp1 = maps
movement.distribution.method.sp2 = maps
movement.distribution.method.sp3 = maps
movement.distribution.method.sp4 = maps
movement.distribution.method.sp5 = maps
movement.distribution.method.sp6 = maps
movement.distribution.method.sp7 = maps
movement.distribution.method.sp8 = maps
movement.distribution.method.sp9 = maps

movement.randomwalk.range.sp0 = 1
movement.randomwalk.range.sp1 = 1
movement.randomwalk.range.sp2 = 1
movement.randomwalk.range.sp3 = 1
movement.randomwalk.range.sp4 = 1
movement.randomwalk.range.sp5 = 1
movement.randomwalk.range.sp6 = 1
movement.randomwalk.range.sp7 = 1
movement.randomwalk.range.sp8 = 1
movement.randomwalk.range.sp9 = 1
