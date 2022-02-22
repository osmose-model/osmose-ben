library("osmose")
library("osmose.extras")
library("stringr")
library("r4ss.selectivity")
library("mgcv")

configDir4  = "osmose-ben_v4_devel"
jarFile   = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies.jar")
outputDir = file.path(configDir4, "output") # main output directory

# Benguela configuration --------------------------------------------------

configFile4 = file.path(configDir4, "osmose-ben_reference.R")

outputDir4  = file.path(outputDir, "reference")

run_osmose(input = configFile4, output = outputDir4, osmose = jarFile, version = "4.3.3")

ben = read_osmose(path = outputDir4, version = "4.3.3")

plot(ben, initialYear=2000, freq=12)
plot(ben, what = "yield", initialYear=2000)

