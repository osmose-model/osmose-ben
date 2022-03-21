# OSMOSE-BEN MAIN CONFIGURATION FILE
# Benguela Upwelling Ecosystem - South Africa
# OSMOSE version 4.3.2

# Setting the model -------------------------------------------------------

simulation.nresource = 4
simulation.nspecies = 10
simulation.nfisheries = 9
fisheries.enabled = TRUE
fisheries.check.enabled = FALSE

species.name.sp0 = euphausiids
species.name.sp1 = anchovy
species.name.sp2 = sardine
species.name.sp3 = redeye
species.name.sp4 = horsemackerel
species.name.sp5 = mesopelagic
species.name.sp6 = silverkob
species.name.sp7 = snoek
species.name.sp8 = shallowwaterhake
species.name.sp9 = deepwaterhake
species.name.sp300 = sphy
species.name.sp301 = lphy
species.name.sp302 = szoo
species.name.sp303 = lzoo

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
species.type.sp300 = resource
species.type.sp301 = resource
species.type.sp302 = resource
species.type.sp303 = resource

fisheries.name.fsh1 = fishery.anchovy
fisheries.name.fsh2 = fishery.sardine
fisheries.name.fsh3 = fishery.redeye
fisheries.name.fsh4 = fishery.horsemackerel
fisheries.name.fsh5 = fishery.mesopelagic
fisheries.name.fsh6 = fishery.silverkob
fisheries.name.fsh7 = fishery.snoek
fisheries.name.fsh8 = fishery.shallowwaterhake
fisheries.name.fsh9 = fishery.deepwaterhake

simulation.ncpu = 1
simulation.nsimulation = 1
simulation.time.ndtperyear = 24
simulation.time.nyear = 10

simulation.nschool.sp0 = 100
simulation.nschool.sp1 = 24
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

species.file.sp300 = input/roms_climatological-sphy_benguela_15days_2000_2009.nc
species.file.sp301 = input/roms_climatological-lphy_benguela_15days_2000_2009.nc
species.file.sp302 = input/roms_climatological-szoo_benguela_15days_2000_2009.nc
species.file.sp303 = input/roms_climatological-lzoo_benguela_15days_2000_2009.nc

species.biomass.nsteps.year.sp300 = 24
species.biomass.nsteps.year.sp301 = 24
species.biomass.nsteps.year.sp302 = 24
species.biomass.nsteps.year.sp303 = 24

species.accessibility2fish.sp300 = 0.026894718
species.accessibility2fish.sp301 = 0.002977831
species.accessibility2fish.sp302 = 0.014176891
species.accessibility2fish.sp303 = 0.185446482

# Resource sizes
species.size.min.sp300 = 2e-04
species.size.min.sp301 = 0.002
species.size.min.sp302 = 0.002
species.size.min.sp303 = 0.02
species.size.max.sp300 = 0.002
species.size.max.sp301 = 0.02
species.size.max.sp302 = 0.02
species.size.max.sp303 = 0.3

# Resource Trophic Level
species.TL.sp300 = 1
species.TL.sp301 = 1
species.TL.sp302 = 2
species.TL.sp303 = 2.5

# Species configuration ---------------------------------------------------

# Growth: von Bertalanffy growth model
species.linf.sp0 = 1.84
species.linf.sp1 = 14.8
species.linf.sp2 = 26
species.linf.sp3 = 30.1
species.linf.sp4 = 54.5
species.linf.sp5 = 7
species.linf.sp6 = 116
species.linf.sp7 = 115.3
species.linf.sp8 = 270.6
species.linf.sp9 = 219.4

species.k.sp0 = 1.682
species.k.sp1 = 1.37
species.k.sp2 = 0.26
species.k.sp3 = 0.71
species.k.sp4 = 0.183
species.k.sp5 = 1.66
species.k.sp6 = 0.12
species.k.sp7 = 0.294
species.k.sp8 = 0.039
species.k.sp9 = 0.049

species.t0.sp0 = -0.198
species.t0.sp1 = -0.03
species.t0.sp2 = -1.5
species.t0.sp3 = 0.28
species.t0.sp4 = -0.65
species.t0.sp5 = 0.06
species.t0.sp6 = -1.47
species.t0.sp7 = -0.1
species.t0.sp8 = -0.73
species.t0.sp9 = -0.914

species.vonbertalanffy.threshold.age.sp0 = 0.17
species.vonbertalanffy.threshold.age.sp1 = 1
species.vonbertalanffy.threshold.age.sp2 = 1
species.vonbertalanffy.threshold.age.sp3 = 1
species.vonbertalanffy.threshold.age.sp4 = 1
species.vonbertalanffy.threshold.age.sp5 = 1
species.vonbertalanffy.threshold.age.sp6 = 1
species.vonbertalanffy.threshold.age.sp7 = 1
species.vonbertalanffy.threshold.age.sp8 = 1
species.vonbertalanffy.threshold.age.sp9 = 1

species.length2weight.condition.factor.sp0 = 0.00738
species.length2weight.condition.factor.sp1 = 0.007
species.length2weight.condition.factor.sp2 = 0.009
species.length2weight.condition.factor.sp3 = 0.009
species.length2weight.condition.factor.sp4 = 0.009
species.length2weight.condition.factor.sp5 = 0.008
species.length2weight.condition.factor.sp6 = 0.007
species.length2weight.condition.factor.sp7 = 0.018
species.length2weight.condition.factor.sp8 = 0.00654
species.length2weight.condition.factor.sp9 = 0.00785

species.length2weight.allometric.power.sp0 = 3.16
species.length2weight.allometric.power.sp1 = 3
species.length2weight.allometric.power.sp2 = 3
species.length2weight.allometric.power.sp3 = 3
species.length2weight.allometric.power.sp4 = 3
species.length2weight.allometric.power.sp5 = 3
species.length2weight.allometric.power.sp6 = 3
species.length2weight.allometric.power.sp7 = 3
species.length2weight.allometric.power.sp8 = 3.0425
species.length2weight.allometric.power.sp9 = 2.9759

species.lifespan.sp0 = 1
species.lifespan.sp1 = 5
species.lifespan.sp2 = 10
species.lifespan.sp3 = 6
species.lifespan.sp4 = 8
species.lifespan.sp5 = 2
species.lifespan.sp6 = 25
species.lifespan.sp7 = 10
species.lifespan.sp8 = 15
species.lifespan.sp9 = 15

# Reproduction
species.relativefecundity.sp0 = 42254
species.relativefecundity.sp1 = 8000
species.relativefecundity.sp2 = 2400
species.relativefecundity.sp3 = 750
species.relativefecundity.sp4 = 250
species.relativefecundity.sp5 = 646
species.relativefecundity.sp6 = 150
species.relativefecundity.sp7 = 130
species.relativefecundity.sp8 = 500
species.relativefecundity.sp9 = 500

reproduction.season.file.sp0 = input/reproduction/reproduction-seasonality-sp1.csv
reproduction.season.file.sp1 = input/reproduction/reproduction-seasonality-sp0.csv
reproduction.season.file.sp2 = input/reproduction/reproduction-seasonality-sp7.csv
reproduction.season.file.sp3 = input/reproduction/reproduction-seasonality-sp6.csv
reproduction.season.file.sp4 = input/reproduction/reproduction-seasonality-sp4.csv
reproduction.season.file.sp5 = input/reproduction/reproduction-seasonality-sp5.csv
reproduction.season.file.sp6 = input/reproduction/reproduction-seasonality-sp8.csv
reproduction.season.file.sp7 = input/reproduction/reproduction-seasonality-sp9.csv
reproduction.season.file.sp8 = input/reproduction/reproduction-seasonality-sp2.csv
reproduction.season.file.sp9 = input/reproduction/reproduction-seasonality-sp3.csv

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

species.maturity.size.sp0 = 1.05
species.maturity.size.sp1 = 11.2
species.maturity.size.sp2 = 18
species.maturity.size.sp3 = 12
species.maturity.size.sp4 = 26.6
species.maturity.size.sp5 = 3.7
species.maturity.size.sp6 = 39.5
species.maturity.size.sp7 = 73
species.maturity.size.sp8 = 52
species.maturity.size.sp9 = 42.1

# Survival
mortality.subdt = 10

mortality.additional.rate.sp0 = 0.1
mortality.additional.rate.sp1 = 0.403
mortality.additional.rate.sp2 = 0.365
mortality.additional.rate.sp3 = 0.208
mortality.additional.rate.sp4 = 0.314
mortality.additional.rate.sp5 = 0.226
mortality.additional.rate.sp6 = 0.228
mortality.additional.rate.sp7 = 0.132
mortality.additional.rate.sp8 = 0.228
mortality.additional.rate.sp9 = 0.174

mortality.additional.larva.rate.sp0 = 5.004677
mortality.additional.larva.rate.sp1 = 5.790887
mortality.additional.larva.rate.sp2 = 2.719504
mortality.additional.larva.rate.sp3 = 5.206346
mortality.additional.larva.rate.sp4 = 3.847284
mortality.additional.larva.rate.sp5 = 4.358056
mortality.additional.larva.rate.sp6 = 6.674349
mortality.additional.larva.rate.sp7 = 9.55594
mortality.additional.larva.rate.sp8 = 3.068959
mortality.additional.larva.rate.sp9 = 3.903988

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
predation.ingestion.rate.max.sp2 = 3.5
predation.ingestion.rate.max.sp3 = 3.5
predation.ingestion.rate.max.sp4 = 3.5
predation.ingestion.rate.max.sp5 = 3.5
predation.ingestion.rate.max.sp6 = 2.7
predation.ingestion.rate.max.sp7 = 3.15
predation.ingestion.rate.max.sp8 = 3.22
predation.ingestion.rate.max.sp9 = 3.15

predation.predprey.sizeratio.max.sp0 = 15, 5
predation.predprey.sizeratio.min.sp0 = 300, 100

predation.predprey.sizeratio.max.sp1 = 10, 5
predation.predprey.sizeratio.min.sp1 = 100, 500

predation.predprey.sizeratio.max.sp2 = 100, 200
predation.predprey.sizeratio.min.sp2 = 200, 4000

predation.predprey.sizeratio.max.sp3 = 10
predation.predprey.sizeratio.min.sp3 = 100

predation.predprey.sizeratio.max.sp4 = 10, 5
predation.predprey.sizeratio.min.sp4 = 100, 100

predation.predprey.sizeratio.max.sp5 = 2.5
predation.predprey.sizeratio.min.sp5 = 100

predation.predprey.sizeratio.max.sp6 = 3.5
predation.predprey.sizeratio.min.sp6 = 70

predation.predprey.sizeratio.max.sp7 = 3.5
predation.predprey.sizeratio.min.sp7 = 70

predation.predprey.sizeratio.max.sp8 = 3.5, 1.8
predation.predprey.sizeratio.min.sp8 = 50, 50

predation.predprey.sizeratio.max.sp9 = 3.5, 1.8
predation.predprey.sizeratio.min.sp9 = 50, 50

predation.predprey.stage.structure = size
predation.predprey.stage.threshold.sp0 = 0.6
predation.predprey.stage.threshold.sp1 = 8
predation.predprey.stage.threshold.sp2 = 10
predation.predprey.stage.threshold.sp3 = NULL
predation.predprey.stage.threshold.sp4 = 10
predation.predprey.stage.threshold.sp5 = NULL
predation.predprey.stage.threshold.sp6 = NULL
predation.predprey.stage.threshold.sp7 = NULL
predation.predprey.stage.threshold.sp8 = 27
predation.predprey.stage.threshold.sp9 = 29

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

simulation.fishing.mortality.enabled = TRUE
fisheries.movement.netcdf.enabled = TRUE

fisheries.catchability.file = input/fisheries/catchability.csv
fisheries.discards.file = input/fisheries/discards.csv

# Fishery 1 (anchovy)
fisheries.rate.base.log.enabled.fsh1 = FALSE
fisheries.rate.base.fsh1 = 0.1419102
fisheries.period.number.fsh1 = 1
fisheries.period.start.fsh1 = 0
fisheries.rate.byperiod.fsh1 = 1
fisheries.seasonality.file.fsh1 = input/fisheries/fishing-seasonality-anchovy.csv
fisheries.selectivity.type.fsh1 = 0
fisheries.selectivity.l50.fsh1 = 8.7
fisheries.selectivity.l75.fsh1 = 8.8

fisheries.movement.fishery.map1 = fishery.anchovy
fisheries.movement.variable.map1 = area
fisheries.movement.nsteps.year.map1 = 24
fisheries.movement.file.map1 = input/fisheries/mapFleets.nc

# Fishery 2 (sardine)
fisheries.rate.base.log.enabled.fsh2 = FALSE
fisheries.rate.base.fsh2 = 0.190335
fisheries.period.number.fsh2 = 1
fisheries.period.start.fsh2 = 0
fisheries.rate.byperiod.fsh2 = 1
fisheries.seasonality.file.fsh2 = input/fisheries/fishing-seasonality-sardine.csv
fisheries.selectivity.type.fsh2 = 0
fisheries.selectivity.l50.fsh2 = 12.4
fisheries.selectivity.l75.fsh2 = 12.5

fisheries.movement.fishery.map2 = fishery.sardine
fisheries.movement.variable.map2 = area
fisheries.movement.nsteps.year.map2 = 24
fisheries.movement.file.map2 = input/fisheries/mapFleets.nc

# Fishery 3 (redeye)
fisheries.rate.base.log.enabled.fsh3 = FALSE
fisheries.rate.base.fsh3 = 0.05010653
fisheries.period.number.fsh3 = 1
fisheries.period.start.fsh3 = 0
fisheries.rate.byperiod.fsh3 = 1
fisheries.seasonality.file.fsh3 = input/fisheries/fishing-seasonality-redeye.csv
fisheries.selectivity.type.fsh3 = 0
fisheries.selectivity.l50.fsh3 = 12
fisheries.selectivity.l75.fsh3 = 12.1

fisheries.movement.fishery.map3 = fishery.redeye
fisheries.movement.variable.map3 = area
fisheries.movement.nsteps.year.map3 = 24
fisheries.movement.file.map3 = input/fisheries/mapFleets.nc

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
fisheries.movement.variable.map4 = area
fisheries.movement.nsteps.year.map4 = 24
fisheries.movement.file.map4 = input/fisheries/mapFleets.nc

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
fisheries.movement.variable.map5 = area
fisheries.movement.nsteps.year.map5 = 24
fisheries.movement.file.map5 = input/fisheries/mapFleets.nc

# Fishery 6 (silverkob)
fisheries.rate.base.log.enabled.fsh6 = FALSE
fisheries.rate.base.fsh6 = 0.1381662
fisheries.period.number.fsh6 = 1
fisheries.period.start.fsh6 = 0
fisheries.rate.byperiod.fsh6 = 1
fisheries.seasonality.file.fsh6 = input/fisheries/fishing-seasonality-silver-kob.csv
fisheries.selectivity.type.fsh6 = 0
fisheries.selectivity.l50.fsh6 = 29.8
fisheries.selectivity.l75.fsh6 = 30.1

fisheries.movement.fishery.map6 = fishery.silverkob
fisheries.movement.variable.map6 = area
fisheries.movement.nsteps.year.map6 = 24
fisheries.movement.file.map6 = input/fisheries/mapFleets.nc

# Fishery 7 (snoek)
fisheries.rate.base.log.enabled.fsh7 = FALSE
fisheries.rate.base.fsh7 = 0.2289438
fisheries.period.number.fsh7 = 1
fisheries.period.start.fsh7 = 0
fisheries.rate.byperiod.fsh7 = 1
fisheries.seasonality.file.fsh7 = input/fisheries/fishing-seasonality-snoek.csv
fisheries.selectivity.type.fsh7 = 0
fisheries.selectivity.l50.fsh7 = 69
fisheries.selectivity.l75.fsh7 = 69.7

fisheries.movement.fishery.map7 = fishery.snoek
fisheries.movement.variable.map7 = area
fisheries.movement.nsteps.year.map7 = 24
fisheries.movement.file.map7 = input/fisheries/mapFleets.nc

# Fishery 8 (shallowwaterhake)
fisheries.rate.base.log.enabled.fsh8 = FALSE
fisheries.rate.base.fsh8 = 0.3339702
fisheries.period.number.fsh8 = 1
fisheries.period.start.fsh8 = 0
fisheries.rate.byperiod.fsh8 = 1
fisheries.seasonality.file.fsh8 = input/fisheries/fishing-seasonality-shallow-water-hake.csv
fisheries.selectivity.type.fsh8 = 0
fisheries.selectivity.l50.fsh8 = 32
fisheries.selectivity.l75.fsh8 = 32.3

fisheries.movement.fishery.map8 = fishery.shallowwaterhake
fisheries.movement.variable.map8 = area
fisheries.movement.nsteps.year.map8 = 24
fisheries.movement.file.map8 = input/fisheries/mapFleets.nc

# Fishery 9 (deepwaterhake)
fisheries.rate.base.log.enabled.fsh9 = FALSE
fisheries.rate.base.fsh9 = 0.3566318
fisheries.period.number.fsh9 = 1
fisheries.period.start.fsh9 = 0
fisheries.rate.byperiod.fsh9 = 1
fisheries.seasonality.file.fsh9 = input/fisheries/fishing-seasonality-deep-water-hake.csv
fisheries.selectivity.type.fsh9 = 0
fisheries.selectivity.l50.fsh9 = 28.3
fisheries.selectivity.l75.fsh9 = 28.6

fisheries.movement.fishery.map9 = fishery.deepwaterhake
fisheries.movement.variable.map9 = area
fisheries.movement.nsteps.year.map9 = 24
fisheries.movement.file.map9 = input/fisheries/mapFleets.nc

# Survey configuration ----------------------------------------------------

surveys.movement.netcdf.enabled = TRUE

surveys.enabled.sr1 = TRUE
surveys.name.sr1 = acousticSurvey
surveys.selectivity.type.sr1 = 1
surveys.selectivity.l50.sr1  = 4.5
surveys.selectivity.l75.sr1  = 5
surveys.selectivity.tiny.sr1 = 1e-3

surveys.movement.survey.map1      = acousticSurvey
surveys.movement.variable.map1    = area
surveys.movement.nsteps.year.map1 = 24
surveys.movement.file.map1        = input/fisheries/mapFleets.nc


# Output configuration ----------------------------------------------------

output.start.year = 0
output.restart.enabled = FALSE
output.file.prefix  = ben
output.step0.include = FALSE
output.recordfrequency.ndt = 2
output.cutoff.enabled = FALSE
output.fishery.enabled = TRUE

output.biomass.enabled = TRUE
output.biomass.bysize.enabled = FALSE
output.biomass.byage.enabled = FALSE
output.biomass.bytl.enabled = FALSE

output.biomass.netcdf.enabled = TRUE
output.biomass.bysize.netcdf.enabled = TRUE
output.biomass.byage.netcdf.enabled = FALSE
output.biomass.bytl.netcdf.enabled = FALSE

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

# Output distribution configuration
output.distrib.bysize.min.sp0 = 0
output.distrib.bysize.max.sp0 = 3
output.distrib.bysize.incr.sp0 = 0.05

output.distrib.byage.min.sp0 = 0
output.distrib.byage.max.sp0 = 1
output.distrib.byage.incr.sp0 = 0.1

output.distrib.bytl.min.sp0 = 0
output.distrib.bytl.max.sp0 = 5
output.distrib.bytl.incr.sp0 = 0.25

output.distrib.bysize.min.sp1 = 0
output.distrib.bysize.max.sp1 = 18
output.distrib.bysize.incr.sp1 = 0.5

output.distrib.byage.min.sp1 = 0
output.distrib.byage.max.sp1 = 5
output.distrib.byage.incr.sp1 = 0.5

output.distrib.bytl.min.sp1 = 0
output.distrib.bytl.max.sp1 = 5
output.distrib.bytl.incr.sp1 = 0.25

output.distrib.bysize.min.sp2 = 0
output.distrib.bysize.max.sp2 = 32
output.distrib.bysize.incr.sp2 = 0.5

output.distrib.byage.min.sp2 = 0
output.distrib.byage.max.sp2 = 10
output.distrib.byage.incr.sp2 = 1

output.distrib.bytl.min.sp2 = 0
output.distrib.bytl.max.sp2 = 5
output.distrib.bytl.incr.sp2 = 0.25

output.distrib.bysize.min.sp3 = 0
output.distrib.bysize.max.sp3 = 37
output.distrib.bysize.incr.sp3 = 1

output.distrib.byage.min.sp3 = 0
output.distrib.byage.max.sp3 = 6
output.distrib.byage.incr.sp3 = 0.5

output.distrib.bytl.min.sp3 = 0
output.distrib.bytl.max.sp3 = 5
output.distrib.bytl.incr.sp3 = 0.25

output.distrib.bysize.min.sp4 = 0
output.distrib.bysize.max.sp4 = 66
output.distrib.bysize.incr.sp4 = 1

output.distrib.byage.min.sp4 = 0
output.distrib.byage.max.sp4 = 8
output.distrib.byage.incr.sp4 = 1

output.distrib.bytl.min.sp4 = 0
output.distrib.bytl.max.sp4 = 5
output.distrib.bytl.incr.sp4 = 0.25

output.distrib.bysize.min.sp5 = 0
output.distrib.bysize.max.sp5 = 9
output.distrib.bysize.incr.sp5 = 0.2

output.distrib.byage.min.sp5 = 0
output.distrib.byage.max.sp5 = 2
output.distrib.byage.incr.sp5 = 0.2

output.distrib.bytl.min.sp5 = 0
output.distrib.bytl.max.sp5 = 5
output.distrib.bytl.incr.sp5 = 0.25

output.distrib.bysize.min.sp6 = 0
output.distrib.bysize.max.sp6 = 140
output.distrib.bysize.incr.sp6 = 2

output.distrib.byage.min.sp6 = 0
output.distrib.byage.max.sp6 = 25
output.distrib.byage.incr.sp6 = 1

output.distrib.bytl.min.sp6 = 0
output.distrib.bytl.max.sp6 = 5
output.distrib.bytl.incr.sp6 = 0.25

output.distrib.bysize.min.sp7 = 0
output.distrib.bysize.max.sp7 = 139
output.distrib.bysize.incr.sp7 = 2

output.distrib.byage.min.sp7 = 0
output.distrib.byage.max.sp7 = 10
output.distrib.byage.incr.sp7 = 1

output.distrib.bytl.min.sp7 = 0
output.distrib.bytl.max.sp7 = 5
output.distrib.bytl.incr.sp7 = 0.25

output.distrib.bysize.min.sp8 = 0
output.distrib.bysize.max.sp8 = 325
output.distrib.bysize.incr.sp8 = 5

output.distrib.byage.min.sp8 = 0
output.distrib.byage.max.sp8 = 15
output.distrib.byage.incr.sp8 = 1

output.distrib.bytl.min.sp8 = 0
output.distrib.bytl.max.sp8 = 5
output.distrib.bytl.incr.sp8 = 0.25

output.distrib.bysize.min.sp9 = 0
output.distrib.bysize.max.sp9 = 264
output.distrib.bysize.incr.sp9 = 5

output.distrib.byage.min.sp9 = 0
output.distrib.byage.max.sp9 = 15
output.distrib.byage.incr.sp9 = 1

output.distrib.bytl.min.sp9 = 0
output.distrib.bytl.max.sp9 = 5
output.distrib.bytl.incr.sp9 = 0.25

# Model initialization ----------------------------------------------------

population.seeding.year.max = 0
population.initialization.relativebiomass.enabled = TRUE
osmose.configuration.initialization = input/initial_conditions.osm

population.seeding.biomass.sp0 = 0
population.seeding.biomass.sp1 = 0
population.seeding.biomass.sp2 = 0
population.seeding.biomass.sp3 = 0
population.seeding.biomass.sp4 = 0
population.seeding.biomass.sp5 = 0
population.seeding.biomass.sp6 = 0
population.seeding.biomass.sp7 = 0
population.seeding.biomass.sp8 = 0
population.seeding.biomass.sp9 = 0

# Advanced parameters -----------------------------------------------------

osmose.version = 4.3.3

# Simulation restart parameters
simulation.restart.recordfrequency.ndt = 24
output.restart.spinup = 90

ltl.java.classname = fr.ird.osmose.ltl.LTLFastForcing

# EV-OSMOSE activation
simulation.bioen.enabled = FALSE
simulation.genetic.enabled = FALSE
simulation.incoming.flux.enabled = TRUE

movement.randomseed.fixed = FALSE
reproduction.randomseed.fixed = FALSE
stochastic.mortality.seed = 10
