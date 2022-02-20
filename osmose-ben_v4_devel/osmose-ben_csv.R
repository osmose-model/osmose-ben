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
simulation.nsimulation = 1
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

species.biomass.nsteps.year.sp10 = 24
species.biomass.nsteps.year.sp11 = 24
species.biomass.nsteps.year.sp12 = 24
species.biomass.nsteps.year.sp13 = 24

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
predation.accessibility.file = input/predation-accessibility-25mars2015.csv

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

movement.checks.enabled = FALSE
movement.netcdf.enabled = TRUE

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

movement.species.map0 = anchovy
movement.variable.map0 = stage0
movement.nsteps.year.map0 = 24
movement.initialAge.map0 = 0
movement.lastAge.map0 = 1
movement.file.map0 = input/maps/anchovy.nc

movement.species.map1 = anchovy
movement.variable.map1 = stage1
movement.nsteps.year.map1 = 24
movement.initialAge.map1 = 1
movement.lastAge.map1 = 2
movement.file.map1 = input/maps/anchovy.nc

movement.species.map2 = anchovy
movement.variable.map2 = stage2
movement.nsteps.year.map2 = 24
movement.initialAge.map2 = 2
movement.lastAge.map2 = 6
movement.file.map2 = input/maps/anchovy.nc

movement.species.map3 = euphausiids
movement.variable.map3 = stage0
movement.nsteps.year.map3 = 24
movement.initialAge.map3 = 0
movement.lastAge.map3 = 1
movement.file.map3 = input/maps/euphausiids.nc

movement.species.map4 = shallowwaterhake
movement.variable.map4 = stage0
movement.nsteps.year.map4 = 24
movement.initialAge.map4 = 0
movement.lastAge.map4 = 1
movement.file.map4 = input/maps/shallowwaterhake.nc

movement.species.map5 = shallowwaterhake
movement.variable.map5 = stage1
movement.nsteps.year.map5 = 24
movement.initialAge.map5 = 1
movement.lastAge.map5 = 3
movement.file.map5 = input/maps/shallowwaterhake.nc

movement.species.map6 = shallowwaterhake
movement.variable.map6 = stage2
movement.nsteps.year.map6 = 24
movement.initialAge.map6 = 3
movement.lastAge.map6 = 6
movement.file.map6 = input/maps/shallowwaterhake.nc

movement.species.map7 = shallowwaterhake
movement.variable.map7 = stage3
movement.nsteps.year.map7 = 24
movement.initialAge.map7 = 6
movement.lastAge.map7 = 16
movement.file.map7 = input/maps/shallowwaterhake.nc

movement.species.map8 = deepwaterhake
movement.variable.map8 = stage0
movement.nsteps.year.map8 = 24
movement.initialAge.map8 = 0
movement.lastAge.map8 = 2
movement.file.map8 = input/maps/deepwaterhake.nc

movement.species.map9 = deepwaterhake
movement.variable.map9 = stage1
movement.nsteps.year.map9 = 24
movement.initialAge.map9 = 2
movement.lastAge.map9 = 16
movement.file.map9 = input/maps/deepwaterhake.nc

movement.species.map10 = horsemackerel
movement.variable.map10 = stage0
movement.nsteps.year.map10 = 24
movement.initialAge.map10 = 0
movement.lastAge.map10 = 1
movement.file.map10 = input/maps/horsemackerel.nc

movement.species.map11 = horsemackerel
movement.variable.map11 = stage1
movement.nsteps.year.map11 = 24
movement.initialAge.map11 = 1
movement.lastAge.map11 = 2
movement.file.map11 = input/maps/horsemackerel.nc

movement.species.map12 = horsemackerel
movement.variable.map12 = stage2
movement.nsteps.year.map12 = 24
movement.initialAge.map12 = 2
movement.lastAge.map12 = 3
movement.file.map12 = input/maps/horsemackerel.nc

movement.species.map13 = horsemackerel
movement.variable.map13 = stage3
movement.nsteps.year.map13 = 24
movement.initialAge.map13 = 3
movement.lastAge.map13 = 4
movement.file.map13 = input/maps/horsemackerel.nc

movement.species.map14 = horsemackerel
movement.variable.map14 = stage4
movement.nsteps.year.map14 = 24
movement.initialAge.map14 = 4
movement.lastAge.map14 = 9
movement.file.map14 = input/maps/horsemackerel.nc

movement.species.map15 = mesopelagic
movement.variable.map15 = stage0
movement.nsteps.year.map15 = 24
movement.initialAge.map15 = 0
movement.lastAge.map15 = 1
movement.file.map15 = input/maps/mesopelagic.nc

movement.species.map16 = mesopelagic
movement.variable.map16 = stage1
movement.nsteps.year.map16 = 24
movement.initialAge.map16 = 1
movement.lastAge.map16 = 3
movement.file.map16 = input/maps/mesopelagic.nc

movement.species.map17 = redeye
movement.variable.map17 = stage0
movement.nsteps.year.map17 = 24
movement.initialAge.map17 = 0
movement.lastAge.map17 = 1
movement.file.map17 = input/maps/redeye.nc

movement.species.map18 = redeye
movement.variable.map18 = stage1
movement.nsteps.year.map18 = 24
movement.initialAge.map18 = 1
movement.lastAge.map18 = 3
movement.file.map18 = input/maps/redeye.nc

movement.species.map19 = redeye
movement.variable.map19 = stage2
movement.nsteps.year.map19 = 24
movement.initialAge.map19 = 3
movement.lastAge.map19 = 7
movement.file.map19 = input/maps/redeye.nc

movement.species.map20 = sardine
movement.variable.map20 = stage0
movement.nsteps.year.map20 = 24
movement.initialAge.map20 = 0
movement.lastAge.map20 = 1
movement.file.map20 = input/maps/sardine.nc

movement.species.map21 = sardine
movement.variable.map21 = stage1
movement.nsteps.year.map21 = 24
movement.initialAge.map21 = 1
movement.lastAge.map21 = 3
movement.file.map21 = input/maps/sardine.nc

movement.species.map22 = sardine
movement.variable.map22 = stage2
movement.nsteps.year.map22 = 24
movement.initialAge.map22 = 3
movement.lastAge.map22 = 11
movement.file.map22 = input/maps/sardine.nc

movement.species.map23 = silverkob
movement.variable.map23 = stage0
movement.nsteps.year.map23 = 24
movement.initialAge.map23 = 0
movement.lastAge.map23 = 26
movement.file.map23 = input/maps/silverkob.nc

movement.species.map24 = snoek
movement.variable.map24 = stage0
movement.nsteps.year.map24 = 24
movement.initialAge.map24 = 0
movement.lastAge.map24 = 1
movement.file.map24 = input/maps/snoek.nc

movement.species.map25 = snoek
movement.variable.map25 = stage1
movement.nsteps.year.map25 = 24
movement.initialAge.map25 = 1
movement.lastAge.map25 = 3
movement.file.map25 = input/maps/snoek.nc

movement.species.map26 = snoek
movement.variable.map26 = stage2
movement.nsteps.year.map26 = 24
movement.initialAge.map26 = 3
movement.lastAge.map26 = 11
movement.file.map26 = input/maps/snoek.nc

# Fisheries configuration -------------------------------------------------

fisheries.movement.netcdf.enabled = FALSE

fisheries.catchability.file = input/fisheries/catchability.csv
fisheries.discards.file = input/fisheries/discards.csv

# Fishery 0 (anchovy)
fisheries.rate.base.log.enabled.fsh0 = FALSE
fisheries.rate.base.fsh0 = 0.1419102
fisheries.period.number.fsh0 = 1
fisheries.period.start.fsh0 = 0
fisheries.rate.byperiod.fsh0 = 1
fisheries.seasonality.file.fsh0 = input/fisheries/fishing-seasonality-anchovy.csv
fisheries.selectivity.type.fsh0 = 0
fisheries.selectivity.l50.fsh0 = 8.7
fisheries.selectivity.l75.fsh0 = 8.8

fisheries.movement.fishery.map0 = fishery.anchovy
fisheries.movement.season.map0 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map0 = 0
fisheries.movement.year.max.map0 = 100
fisheries.movement.file.map0 = input/fisheries/mapFleets.csv

# Fishery 2 (shallowwaterhake)
fisheries.rate.base.log.enabled.fsh2 = FALSE
fisheries.rate.base.fsh2 = 0.3339702
fisheries.period.number.fsh2 = 1
fisheries.period.start.fsh2 = 0
fisheries.rate.byperiod.fsh2 = 1
fisheries.seasonality.file.fsh2 = input/fisheries/fishing-seasonality-shallow-water-hake.csv
fisheries.selectivity.type.fsh2 = 0
fisheries.selectivity.l50.fsh2 = 32
fisheries.selectivity.l75.fsh2 = 32.3

fisheries.movement.fishery.map2 = fishery.shallowwaterhake
fisheries.movement.season.map2 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map2 = 0
fisheries.movement.year.max.map2 = 100
fisheries.movement.file.map2 = input/fisheries/mapFleets.csv

# Fishery 3 (deepwaterhake)
fisheries.rate.base.log.enabled.fsh3 = FALSE
fisheries.rate.base.fsh3 = 0.3566318
fisheries.period.number.fsh3 = 1
fisheries.period.start.fsh3 = 0
fisheries.rate.byperiod.fsh3 = 1
fisheries.seasonality.file.fsh3 = input/fisheries/fishing-seasonality-deep-water-hake.csv
fisheries.selectivity.type.fsh3 = 0
fisheries.selectivity.l50.fsh3 = 28.3
fisheries.selectivity.l75.fsh3 = 28.6

fisheries.movement.fishery.map3 = fishery.deepwaterhake
fisheries.movement.season.map3 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map3 = 0
fisheries.movement.year.max.map3 = 100
fisheries.movement.file.map3 = input/fisheries/mapFleets.csv

# Fishery 4 (horsemackerel)
fisheries.rate.base.log.enabled.fsh4 = FALSE
fisheries.rate.base.fsh4 = 0.05028479
fisheries.period.number.fsh4 = 1
fisheries.period.start.fsh4 = 0
fisheries.rate.byperiod.fsh4 = 1
fisheries.seasonality.file.fsh4 = input/fisheries/fishing-seasonality-horse-mackerel.csv
fisheries.selectivity.type.fsh4 = 0
fisheries.selectivity.l50.fsh4 = 20.9
fisheries.selectivity.l75.fsh4 = 21.1

fisheries.movement.fishery.map4 = fishery.horsemackerel
fisheries.movement.season.map4 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map4 = 0
fisheries.movement.year.max.map4 = 100
fisheries.movement.file.map4 = input/fisheries/mapFleets.csv

# Fishery 5 (mesopelagic)
fisheries.rate.base.log.enabled.fsh5 = FALSE
fisheries.rate.base.fsh5 = 0.000923734
fisheries.period.number.fsh5 = 1
fisheries.period.start.fsh5 = 0
fisheries.rate.byperiod.fsh5 = 1
fisheries.seasonality.file.fsh5 = input/fisheries/fishing-seasonality-mesopelagic.csv
fisheries.selectivity.type.fsh5 = 0
fisheries.selectivity.l50.fsh5 = 5.5
fisheries.selectivity.l75.fsh5 = 5.6

fisheries.movement.fishery.map5 = fishery.mesopelagic
fisheries.movement.season.map5 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map5 = 0
fisheries.movement.year.max.map5 = 100
fisheries.movement.file.map5 = input/fisheries/mapFleets.csv

# Fishery 6 (redeye)
fisheries.rate.base.log.enabled.fsh6 = FALSE
fisheries.rate.base.fsh6 = 0.05010653
fisheries.period.number.fsh6 = 1
fisheries.period.start.fsh6 = 0
fisheries.rate.byperiod.fsh6 = 1
fisheries.seasonality.file.fsh6 = input/fisheries/fishing-seasonality-redeye.csv
fisheries.selectivity.type.fsh6 = 0
fisheries.selectivity.l50.fsh6 = 12
fisheries.selectivity.l75.fsh6 = 12.1

fisheries.movement.fishery.map6 = fishery.redeye
fisheries.movement.season.map6 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map6 = 0
fisheries.movement.year.max.map6 = 100
fisheries.movement.file.map6 = input/fisheries/mapFleets.csv

# Fishery 7 (sardine)
fisheries.rate.base.log.enabled.fsh7 = FALSE
fisheries.rate.base.fsh7 = 0.190335
fisheries.period.number.fsh7 = 1
fisheries.period.start.fsh7 = 0
fisheries.rate.byperiod.fsh7 = 1
fisheries.seasonality.file.fsh7 = input/fisheries/fishing-seasonality-sardine.csv
fisheries.selectivity.type.fsh7 = 0
fisheries.selectivity.l50.fsh7 = 12.4
fisheries.selectivity.l75.fsh7 = 12.5

fisheries.movement.fishery.map7 = fishery.sardine
fisheries.movement.season.map7 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map7 = 0
fisheries.movement.year.max.map7 = 100
fisheries.movement.file.map7 = input/fisheries/mapFleets.csv

# Fishery 8 (silverkob)
fisheries.rate.base.log.enabled.fsh8 = FALSE
fisheries.rate.base.fsh8 = 0.1381662
fisheries.period.number.fsh8 = 1
fisheries.period.start.fsh8 = 0
fisheries.rate.byperiod.fsh8 = 1
fisheries.seasonality.file.fsh8 = input/fisheries/fishing-seasonality-silver-kob.csv
fisheries.selectivity.type.fsh8 = 0
fisheries.selectivity.l50.fsh8 = 29.8
fisheries.selectivity.l75.fsh8 = 30.1

fisheries.movement.fishery.map8 = fishery.silverkob
fisheries.movement.season.map8 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map8 = 0
fisheries.movement.year.max.map8 = 100
fisheries.movement.file.map8 = input/fisheries/mapFleets.csv

# Fishery 9 (snoek)
fisheries.rate.base.log.enabled.fsh9 = FALSE
fisheries.rate.base.fsh9 = 0.2289438
fisheries.period.number.fsh9 = 1
fisheries.period.start.fsh9 = 0
fisheries.rate.byperiod.fsh9 = 1
fisheries.seasonality.file.fsh9 = input/fisheries/fishing-seasonality-snoek.csv
fisheries.selectivity.type.fsh9 = 0
fisheries.selectivity.l50.fsh9 = 69
fisheries.selectivity.l75.fsh9 = 69.7

fisheries.movement.fishery.map9 = fishery.snoek
fisheries.movement.season.map9 = 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23
fisheries.movement.year.min.map9 = 0
fisheries.movement.year.max.map9 = 100
fisheries.movement.file.map9 = input/fisheries/mapFleets.csv

# Output configuration ----------------------------------------------------

output.start.year = 0
output.restart.enabled = FALSE
output.file.prefix  = ben
output.step0.include = FALSE
output.recordfrequency.ndt = 2
output.cutoff.enabled = FALSE
output.fishery.enabled = TRUE

output.yield.biomass.enabled = TRUE
output.yield.biomass.bySize.enabled = FALSE
output.yield.biomass.byAge.enabled = FALSE
output.yield.abundance.enabled = FALSE
output.yield.abundance.bySize.enabled = FALSE
output.yield.abundance.byAge.enabled = FALSE

output.yield.biomass.netcdf.enabled = FALSE
output.yield.biomass.bySize.netcdf.enabled = FALSE
output.yield.biomass.byage.netcdf.enabled = FALSE
output.yield.abundance.netcdf.enabled = FALSE
output.yield.abundance.bySize.netcdf.enabled = FALSE
output.yield.abundance.byage.netcdf.enabled = FALSE

output.biomass.enabled = TRUE
output.biomass.bysize.enabled = FALSE
output.biomass.byage.enabled = FALSE
output.biomass.bytl.enabled = FALSE

output.biomass.netcdf.enabled = FALSE
output.biomass.bysize.netcdf.enabled = FALSE
output.biomass.byage.netcdf.enabled = FALSE
output.biomass.bytl.netcdf.enabled = FALSE

output.abundance.enabled = FALSE
output.abundance.age1.enabled = FALSE
output.abundance.bysize.enabled = FALSE
output.abundance.byage.enabled = FALSE
output.abundance.bytl.enabled = FALSE

output.abundance.netcdf.enabled = FALSE
output.abundance.bysize.netcdf.enabled = FALSE
output.abundance.byage.netcdf.enabled = FALSE

output.meanSize.byAge.netcdf.enabled = FALSE

output.diet.pressure.netcdf.enabled = FALSE
output.diet.composition.netcdf.enabled = FALSE
output.diet.composition.byage.netcdf.enabled = FALSE
output.diet.composition.bysize.netcdf.enabled = FALSE

output.spatial.enabled = FALSE
output.spatial.ltl.enabled = FALSE
output.spatialabundance.enabled = FALSE
output.spatialbiomass.enabled = FALSE
output.spatialsize.enabled = FALSE
output.spatialtl.enabled = FALSE
output.spatialsizespecies.enabled = FALSE
output.spatialagespecies.enabled = FALSE
output.spatial.yield.biomass.enabled = FALSE
output.spatial.yield.abundance.enabled = FALSE

output.mortality.enabled = FALSE
output.mortality.perSpecies.byage.enabled = FALSE
output.mortality.perSpecies.bysize.enabled = FALSE
output.mortality.additional.bySize.enabled = FALSE
output.mortality.additional.byAge.enabled = FALSE
output.mortality.additionalN.bySize.enabled = FALSE
output.mortality.additionalN.byAge.enabled = FALSE
output.mortality.perSpecies.byage.netcdf.enabled = FALSE

output.size.enabled = FALSE
output.size.catch.enabled = FALSE
output.tl.enabled = FALSE
output.tl.catch.enabled = FALSE
output.meanTL.bySize.enabled = FALSE
output.meanTL.byAge.enabled = FALSE
output.weight.enabled = FALSE
output.meanSize.byAge.enabled = FALSE

output.diet.composition.enabled = FALSE
output.diet.composition.byage.enabled = FALSE
output.diet.composition.bysize.enabled = FALSE
output.diet.pressure.enabled = FALSE
output.diet.pressure.byage.enabled = FALSE
output.diet.pressure.bysize.enabled = FALSE
output.diet.success.enabled = FALSE

output.spatialenet.enabled = FALSE
output.spatialenetlarvae.enabled = FALSE
output.spatialenetjuv.enabled = FALSE
output.spatialdg.enabled = FALSE
output.spatialegg.enabled = FALSE
output.spatialMstarv.enabled = FALSE
output.spatialMpred.enabled = FALSE

# Advanced parameters -----------------------------------------------------

osmose.version = 4.3.3

# Simulation restart parameters
simulation.restart.recordfrequency.ndt = 24
population.seeding.year.max = 30

ltl.java.classname = fr.ird.osmose.ltl.LTLFastForcing

# EV-OSMOSE activation
simulation.bioen.enabled = FALSE
simulation.genetic.enabled = FALSE
simulation.incoming.flux.enabled = TRUE
