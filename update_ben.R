library(osmose)
library(osmose.extras)
library(stringr)
library(r4ss.selectivity)
library(mgcv)
library(nctools)

# user inputs

base     = "osmose-ben_v4.3_Florance"
cfg      = "osmose-ben_v3.2_Florance/BEN_all-parameters-v3.2.csv"
ltl_new  = "roms_climatological-%s_benguela_15days_2000_2009.nc" # regex
model    = "ben"

plk_start = 300
plk_rename = c(Dinoflagellates="sphy", Diatoms="lphy", Ciliates="szoo", Copepods="lzoo")
sp_reorder = c(sp0 = "euphausiids", sp1 = "anchovy", sp2 = "sardine", sp3 = "redeye",
               sp4 = "horsemackerel", sp5 = "mesopelagic", sp6 = "silverkob",
               sp7 = "snoek", sp8 = "shallowwaterhake", sp9 = "deepwaterhake")


source("utils/update3to4.R")

configDir4  = base
jarFile     = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies.jar")
outputDir   = file.path(configDir4, "output") # main output directory

# Benguela configuration --------------------------------------------------

configFile4  = file.path(configDir4, "osmose-ben.R")
outputDir4   = file.path(outputDir, "reference")

configFile4s = file.path(configDir4, "osmose-ben_seeding.R")
outputDir4s  = file.path(outputDir, "seeding")

# to be updated with exported version
conf = .readConfiguration(configFile4)
inifile = .getPar(conf, "osmose.configuration.initialization")
inifile = file.path(attr(inifile, "path"), inifile)
run = !dir.exists(file.path(outputDir4s, "restart"))

# add the 'do not edit by hand'
initialize_osmose(input=configFile4s, file=inifile, output=outputDir4s,
                  type = "ncdf", run=run, osmose = jarFile, version = "4.3.3",
                  append=FALSE)

run_osmose(input = configFile4, output = outputDir4, osmose = jarFile, version = "4.3.3")
ben = read_osmose(path = outputDir4, version = "4.3.3")

plot(ben, initialYear=2000, freq=12)
plot(ben, what = "yield", initialYear=2000)

