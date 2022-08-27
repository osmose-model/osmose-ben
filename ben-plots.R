library(kali)
library(nctools)
# library(raster)
# makeTransparent = kali:::makeTransparent

# 0 = knife edge. 1 = Sigmoid 2 = Gaussian 3 = logNormal

eez = shapefile(x="S:/spatial/EEZ_land_union_v3_202003/EEZ_Land_v3_202030.shp")

nc = nc_open("osmose-ben_v4.x_develop/input/grid-mask.nc")
mask = ncvar_get(nc, "mask")
lat = ncvar_get(nc, "latitude")
lon = ncvar_get(nc, "longitude")

ewe = read.csv("data/ewe_domain.csv", header=FALSE, skip = 1)
names(ewe) = c("lon", "lat")

image.map(lon, lat, mask, col="lightblue1", hires=TRUE,
          land.col = makeTransparent("black", 0.4))

plot.map(xlim=c(-35, 80), ylim=c(-60, 40), hires=FALSE)
map(database = "mapdata::worldHires", regions="South Africa", col="darkgreen", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Namibia", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Mozambique", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
text(x=28, y=-28, labels = "RSA", col="black", cex=0.8, font=2)
plot(LME[LME@data$LME_NAME=="Benguela Current", ], add=TRUE, col="skyblue3", border=NA)
text(x=-5, y=-20, labels = "Benguela Current", col="skyblue3", cex=0.75)
plot(LME[LME@data$LME_NAME=="Agulhas Current", ], add=TRUE, col="midnightblue", border=NA)
text(x=42, y=-35, labels = "Agulhas Current", col="midnightblue", cex=0.75)

new.agrif = list(lon=c(4, 40), lat=c(-45, -17))

# RSA + Namibia
plot.domain(xlim=c(8, 33), ylim=c(-37.5, -17), lwd=3, col="blue")
# All RSA grid
plot.domain(xlim=c(15, 33), ylim=range(lat), lwd=2, col="green")
# Current grid
plot.domain(xlim = range(lon), ylim=range(lat), lwd=3)
# ASAP AGRIF grid
ASAP.agrif = list(lon=c(4, 40), lat=c(-45, -27))
plot.domain(xlim = ASAP.agrif$lon, ylim=ASAP.agrif$lat, lwd=3, col="blue")
plot.domain(xlim = new.agrif$lon, ylim=new.agrif$lat, lwd=3, col="black")
lines(x=ewe$lon, y=ewe$lat, col="white", lwd=2)
# ASAP and ASAP2
ASAP1 = list(lon=c(-27, 69), lat=c(-49, +7))
ASAP2 = list(lon=c(-27, 72), lat=c(-57, +7))
plot.domain(xlim = ASAP1$lon, ylim=ASAP1$lat, lwd=3, col="grey90")
plot.domain(xlim = ASAP2$lon, ylim=ASAP2$lat, lwd=3, col="grey50")

# model domain comparison

plot.map(xlim=c(-20, 65), ylim=c(-40, 2), hires=FALSE, asp=1)
map(database = "mapdata::worldHires", regions="South Africa", col="darkgreen", fill = TRUE, border=NA, add=TRUE, lwd=2)
# map(database = "mapdata::worldHires", regions="Namibia", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
# map(database = "mapdata::worldHires", regions="Mozambique", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Lesotho", col="darkolivegreen4", fill = TRUE, border=NA, add=TRUE, lwd=2)
# text(x=28, y=-28, labels = "RSA", col="black", cex=0.8, font=2)
plot(LME[LME@data$LME_NAME=="Benguela Current", ], add=TRUE, col="skyblue3", border=NA)
text(x=-5, y=-20, labels = "Benguela Current", col="skyblue3")
# plot(LME[LME@data$LME_NAME=="Agulhas Current", ], add=TRUE, col="midnightblue", border=NA)
# text(x=42, y=-35, labels = "Agulhas Current", col="midnightblue")
# plot.domain(xlim = range(lon), ylim=range(lat), lwd=3)
plot.domain(xlim = c(14, 28), ylim=c(-37.5, -28.5), lwd=3)
# plot.domain(xlim = range(ewe$lon), ylim=range(ewe$lat), lwd=3, col="blue")
# lines(x=ewe$lon, y=ewe$lat, col="white", lwd=2)


# New domain --------------------------------------------------------------


plot.map(xlim = range(lon) + c(-5, +13), ylim=range(lat) + c(-1, +3), hires=FALSE, asp=1)
plot(eez[eez@data$UNION=="South Africa", ], add=TRUE, col="skyblue2", border=NA)
abline(v=c(18.4, 20.5, 23.9), lty=3)
segments(x0=25, x1=50, y0=-32, lty=3)
segments(x0=-25, x1=20, y0=-28.63, lty=3)
map(database = "mapdata::worldHires", col="darkolivegreen4", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="South Africa", col="darkgreen", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Lesotho", col="darkolivegreen4", fill = TRUE, border=NA, add=TRUE, lwd=2)
text(x=15.5, y=-33, labels="W")
text(x=19.5, y=-35.5, labels="SW")
text(x=22, y=-35, labels="S")
text(x=26.5, y=-35.5, labels="SE")
text(x=33, y=-30, labels="E")

lines(x=ewe$lon, y=ewe$lat, col="black", lwd=2)
# plot.domain(xlim=range(lon), ylim=range(lat), lwd=2)
# plot.domain(xlim=range(ewe$lon), ylim=range(ewe$lat), col="blue", lwd=2)
# plot.domain(xlim=c(13.25, 29), ylim=c(-38.5, -28), col="blue", lwd=2)
plot.domain(xlim=c(14.25, 28), ylim=c(-37.25, -28.5), col="blue", lwd=2)

(28°30'S, 14°30'E) to (37°S, 28°E).

# EAST: -32S
# WEST: 18.4E
# South-West: 20.5E
# South: 23.9E

rename simulation.mortality.subdt
redundant fisheries.rate.bySeason

# fishing.area by fishery?
# fishery.checks within output folder.

nc = nc_open("osmose-ben_v4.x_develop/output/reference/ben_yieldByFishery_Simu0.nc")
