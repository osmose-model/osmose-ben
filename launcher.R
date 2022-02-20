library("osmose")
library("osmose.extras")
library("stringr")
library("r4ss.selectivity")
library("mgcv")

configDir4  = "osmose-ben_v4_devel"
jarFile   = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies.jar")
jarFilel   = file.path(configDir4, "osmose_4.3.3-jar-with-dependencies_last.jar")
outputDir = file.path(configDir4, "output")

# Benguela configuration --------------------------------------------------

configFile4 = file.path(configDir4, "osmose-ben.R")
configFile4o = file.path(configDir4, "osmose-ben_csv.R")
configFile40 = file.path(configDir4, "osmose-ben0.R")
configFile40f = file.path(configDir4, "osmose-ben0f.R")
configFile4t = file.path(configDir4, "osmose-ben_test.R")

outputDir4  = file.path(outputDir, "output")
outputDir4l  = file.path(outputDir, "output_last")
outputDir4nc  = file.path(outputDir, "output_last_nc")
outputDir40  = file.path(outputDir, "output_last_0")
outputDir40f  = file.path(outputDir, "output_last_0f")
outputDir4t  = file.path(outputDir, "output_last_test")

run_osmose(input = configFile4o, output = outputDir4, osmose = jarFile, version = "4.3.3")
run_osmose(input = configFile4o, output = outputDir4l, osmose = jarFilel, version = "4.3.3")
run_osmose(input = configFile4, output = outputDir4nc, osmose = jarFilel, version = "4.3.3")
run_osmose(input = configFile40, output = outputDir40, osmose = jarFilel, version = "4.3.3")
run_osmose(input = configFile40f, output = outputDir40f, osmose = jarFilel, version = "4.3.3")
run_osmose(input = configFile4t, output = outputDir4t, osmose = jarFilel, version = "4.3.3")

ben = read_osmose(path = outputDir4, version = "4.3.3")
benl = read_osmose(path = outputDir4l, version = "4.3.3")
bennc = read_osmose(path = outputDir4nc, version = "4.3.3")
bennc0 = read_osmose(path = outputDir40, version = "4.3.3")
bennc0f = read_osmose(path = outputDir40f, version = "4.3.3")
bent = read_osmose(path = outputDir4t, version = "4.3.3")

for(sp in 1) {
  par(mfrow=c(2,3), mar=c(3,3,1,1), oma=c(1,1,1,1))
  x = get_var(ben, what="biomass")[, sp+1, ]
  y = get_var(bennc0f, what="biomass")[, sp+1, ]
  ylim = 1e-3*c(0, 1.25)*range(x,y)
  plot(ben, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1402", 1, line=-2.5, adj=0.95, col="black", cex=0.75)
  plot(benl, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1802 + csv", 3, line=-2.5, adj=0.95, col="black", cex=0.75)
  plot(bennc, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1802 + ncdf", 3, line=-2.5, adj=0.95, col="black", cex=0.75)
  plot(bennc0, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1802 + 0rw sp1", 3, line=-2.5, adj=0.95, col="black", cex=0.75)
  plot(bennc0f, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1802 + 0rw all", 3, line=-2.5, adj=0.95, col="black", cex=0.75)
  plot(bent, initialYear=2000, species=sp, ylim=ylim)
  mtext("develop-1802 + test", 3, line=-2.5, adj=0.95, col="black", cex=0.75)
}

plot(ben, initialYear=2000, xlim=c(2080, 2100))
plot(ben, what = "yield", initialYear=1992)

