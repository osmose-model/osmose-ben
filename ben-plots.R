library(kali)
library(nctools)

# 0 = knife edge. 1 = Sigmoid 2 = Gaussian 3 = logNormal

nc = nc_open("osmose-ben_v4.x_develop/input/grid-mask.nc")
mask = ncvar_get(nc, "mask")
lat = ncvar_get(nc, "latitude")
lon = ncvar_get(nc, "longitude")

image.map(lon, lat, mask, col="lightblue1", hires=TRUE,
          land.col = makeTransparent("black", 0.4))

plot.map(xlim=c(-25, 55), ylim=c(-40, 40), hires=FALSE)
map(database = "mapdata::worldHires", regions="South Africa", col="darkgreen", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Namibia", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Mozambique", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
text(x=28, y=-28, labels = "RSA", col="black", cex=0.8, font=2)
plot(LME[LME@data$LME_NAME=="Benguela Current", ], add=TRUE, col="skyblue3", border=NA)
text(x=-5, y=-20, labels = "Benguela Current", col="skyblue3")
plot(LME[LME@data$LME_NAME=="Agulhas Current", ], add=TRUE, col="midnightblue", border=NA)
text(x=42, y=-35, labels = "Agulhas Current", col="midnightblue")
plot.domain(xlim = range(lon), ylim=range(lat), lwd=3)


# All RSA grid
plot.domain(xlim=c(15, 33), ylim=range(lat), lwd=3, col="black")
# RSA + Namibia
plot.domain(xlim=c(8, 33), ylim=c(-37.5, -17), lwd=3, col="blue")

# model domain comparison

plot.map(xlim=c(8, 33), ylim=c(-40, -16), hires=FALSE)
map(database = "mapdata::worldHires", regions="South Africa", col="darkgreen", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Namibia", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Mozambique", col="darkolivegreen3", fill = TRUE, border=NA, add=TRUE, lwd=2)
map(database = "mapdata::worldHires", regions="Lesotho", col="darkolivegreen4", fill = TRUE, border=NA, add=TRUE, lwd=2)
text(x=28, y=-28, labels = "RSA", col="black", cex=0.8, font=2)
plot(LME[LME@data$LME_NAME=="Benguela Current", ], add=TRUE, col="skyblue3", border=NA)
text(x=-5, y=-20, labels = "Benguela Current", col="skyblue3")
plot(LME[LME@data$LME_NAME=="Agulhas Current", ], add=TRUE, col="midnightblue", border=NA)
text(x=42, y=-35, labels = "Agulhas Current", col="midnightblue")
plot.domain(xlim = range(lon), ylim=range(lat), lwd=3)

ewe = read.csv("data/ewe_domain.csv", header=FALSE, skip = 1)
names(ewe) = c("lon", "lat")
lines(x=ewe$lon, y=ewe$lat, col="white", lwd=2)

plot.map(xlim = range(lon), ylim=range(lat), hires=TRUE)

rename simulation.mortality.subdt
redundant fisheries.rate.bySeason

# fishing.area by fishery?
# fishery.checks within output folder.

nc = nc_open("osmose-ben_v4.x_develop/output/reference/ben_yieldByFishery_Simu0.nc")
