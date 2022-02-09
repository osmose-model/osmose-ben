library("osmose")
library("osmose.extras")
library("stringr")
library("r4ss.selectivity")
library("mgcv")

configDir4  = "osmose-ben_v4_devel"

jarFile4.3.2   = file.path(configDir4, "osmose_4.3.2-jar-with-dependencies.jar")
jarFile4.3.3   = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies.jar")

# osmose 4.3.3 ------------------------------------------------------------

configFile4a = file.path(configDir4, "osmose4.3.3_ben_ini.R")
outputDir4a  = file.path(configDir4, "output4.3.3")

conf = .readConfiguration(configFile4a)
anch = .getPar(conf, sp=1)

inifile = file.path(configDir4, "input", "initial_conditions_1992.R")
ini2 = initialize_osmose(input=configFile4a, output=inifile)

run_osmose(input = configFile4a, output = outputDir4a, osmose = jarFile4.3.3)

ben4.3.3 = read_osmose(path = outputDir4a, version = "4.3.2")
plot(ben4.3.3, initialYear=1992)
plot(ben4.3.3, what = "yield", initialYear=1992)
