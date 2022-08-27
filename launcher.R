library(osmose)
library(stringr)
library(empirical.selectivity)
library(mgcv)
library(nctools)

javaPath   = "R:/sync/Github/osmose-private-develop/inst/java"
configDir4  = "osmose-ben_v4.x_develop"
jarFile   = file.path(javaPath, "osmose_4.3.3-jar-with-dependencies.jar")
outputDir = file.path(configDir4, "output") # main output directory

# Benguela configuration --------------------------------------------------

configFile4  = file.path(configDir4, "osmose-ben.R")
outputDir4   = file.path(outputDir, "reference")

outputDir4s  = file.path("osmose-ben_v4.3_Florance", "output", "seeding")
configFile4s  = file.path("osmose-ben_v4.3_Florance", "osmose-ben_seeding.R")

run_osmose(input = configFile4, output = outputDir4, osmose = jarFile, version = "4.3.3")
ben = read_osmose(path = outputDir4, version = "4.3.3")

plot(ben, initialYear=2000, freq=12)
plot(ben, what = "yield", initialYear=2000)

# to be updated with exported version
conf = .readConfiguration(configFile4)
inifile = .getPar(conf, "osmose.configuration.initialization")
inifile = file.path(attr(inifile, "path"), inifile)
run = !dir.exists(file.path(outputDir4s, "restart"))

initialize_osmose(input=configFile4s, file=inifile, output=outputDir4s,
                  type = "climatology", run=TRUE, osmose = jarFile, version = "4.3.3",
                  append=FALSE)

initialize_osmose(input=configFile4s, file=inifile, output=outputDir4s,
                  type = "ncdf", run=run, osmose = jarFile, version = "4.3.3",
                  append=FALSE)

run_osmose(input = configFile4, output = outputDir4, osmose = jarFile, version = "4.3.3")
ben = read_osmose(path = outputDir4, version = "4.3.3")
plot(ben, initialYear=2000, freq=12)
plot(ben, what = "yield", initialYear=2000)
plot(ben, what="biomass.acousticSurvey")
plot(ben, what="biomass.SouthRegion")
plot(ben, what="yield.SouthRegion")
plot(ben, what="yield.fishery.anchovy", col="red", lwd=2)
plot(ben, what="yield.fishery.sardine", col="red", lwd=2)
plot(ben, what="yield.fishery.horsemackerel", col="red", lwd=2)

plot(ben)

bio = get_var(ben, what="biomass", how="list")
eup = bio$euphausiids

yields = get_var(ben, what="yield.fishery.anchovy", how="list")
eup = yields$euphausiids

