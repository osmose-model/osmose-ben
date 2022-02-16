library("osmose")
library("osmose.extras")
library("stringr")
library("r4ss.selectivity")
library("mgcv")

configDir4  = "osmose-ben_v4_devel"
jarFile   = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies.jar")

# Benguela configuration --------------------------------------------------


configFile4 = file.path(configDir4, "osmose-ben.R")
outputDir4  = file.path(configDir4, "output")

run_osmose(input = configFile4, output = outputDir4, osmose = jarFile, version = "4.3.3")

ben = read_osmose(path = outputDir4, version = "4.3.3")
plot(ben, initialYear=2000)
plot(ben, initialYear=2000, xlim=c(2080, 2100))
plot(ben, what = "yield", initialYear=1992)

