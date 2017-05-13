####
#### Data from a 1974 Motor Trend report on 32 cars. There are 32 variables.
####

library(scatterplot3d)
attach(mtcars)

n <- nrow(mtcars)
str(mtcars)

##
## 3D scatterplots.
##

## The 'scatterplot3d' function is one option. It returns an 'xyz.convert' function that 
## can be used to convert 3D coordinates into 2D coordinates, which makes it easy to add 
## lines / points / text.
pdf("figures/mtcars_sc3d.pdf", height = 5)
scatterplot3d(wt, disp, mpg)
dev.off()

pdf("figures/mtcars_sc3d_colors.pdf", height = 5)
sc <- scatterplot3d(wt, disp, mpg)
ii_4 <- (1:n)[mtcars$cyl == 4]
ii_6 <- (1:n)[mtcars$cyl == 6]
ii_8 <- (1:n)[mtcars$cyl == 8]

points(sc$xyz.convert(mtcars[ii_4, c("wt", "disp", "mpg")]), pch = 20, col = "green")
points(sc$xyz.convert(mtcars[ii_6, c("wt", "disp", "mpg")]), pch = 20, col = "blue")
points(sc$xyz.convert(mtcars[ii_8, c("wt", "disp", "mpg")]), pch = 20, col = "red")
dev.off()

## The 'rgl' package also offers 'plot3d', which creates 3D scatters that can be spun 
## around.
library(rgl)

plot3d(wt, disp, mpg, size = 3)

##
## Stars plot.
##

pdf("figures/mtcars_star.pdf", height = 5)
stars(mtcars[c(1, 12, 15:17, 19:20, 24:25, 29:31), 1:7], key.loc = c(10, 2), 
  flip.labels = FALSE)
dev.off()

##
## Chernoff face plot.
##

library(aplpack)

pdf("figures/mtcars_faces.pdf", height = 5)
faces(mtcars[c(1, 12, 15:17, 19:20, 24:25, 29:31), 1:7])
dev.off()