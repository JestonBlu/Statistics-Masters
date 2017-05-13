####
#### Univariate and bivariate normal densities.
####

## Univariate normal.
pdf("figures/norm.pdf")
curve(dnorm, from = -3, to = 3, xlab = "", ylab = "", main = "Univariate Normal", 
  xaxt = "n", yaxt = "n")
dev.off()

## Bivariate normal.
library(mvtnorm)

x <- y <- seq(-3, 3, length = 50)
f <- function(x, y) { dmvnorm(cbind(x, y)) }
z <- outer(x, y, f)

pdf("figures/mvnorm.pdf")
persp(x, y, z, theta = 30, phi = 30, main = "Multivariate Normal", axes = FALSE)
box()
dev.off()

####
#### Statistical distance.
####

library(mvtnorm)

set.seed(101)
Y <- rmvnorm(50, mean = c(0, 0), sigma = matrix(c(4, 0, 0, 1), nrow = 2))

pdf("figures/dist_biv_norm.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)
dev.off()

library(plotrix)
pdf("figures/dist_biv_norm_annot.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), col = "grey", asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)
draw.circle(0, 0, 2, border = "red", lwd = 2)
points(c(0, 2), c(2, 0), pch = 20, col = "blue", cex = 2)
dev.off()

pdf("figures/dist_biv_norm_ellipse.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)
draw.ellipse(0, 0, 2, 1, border = "red", lwd = 2)
points(c(0, 2), c(1, 0), pch = 20, col = "blue", cex = 2)
dev.off()

##
## Rotated axes.
##

library(mvtnorm)

set.seed(101)

rho <- 0.85
sg <- c(1, 2)
Sigma <- matrix(c(sg[1] ^ 2, prod(sg) * rho, prod(sg) * rho, sg[2] ^ 2), nrow = 2)
Y <- rmvnorm(50, mean = c(0, 0), sigma = Sigma)

pdf("figures/dist_biv_norm_rot.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)
dev.off()

pdf("figures/dist_biv_norm_rot_annot.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)

draw.ellipse(0, 0, 3, 1.5, border = "red", lwd = 2)
points(c(0, 3), c(1.5, 0), pch = 20, col = "blue", cex = 2)
dev.off()

pdf("figures/dist_biv_norm_rot_axes.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)

slp <- coef(lm(Y[, 2] ~ Y[, 1]))[2]
theta <- acos(1 / sqrt(1 + slp ^ 2))
draw.radial.line(start = 0, end = 10, center = c(0, 0), angle = theta)
draw.radial.line(start = 0, end = 10, center = c(0, 0), angle = theta + pi / 2)
draw.radial.line(start = 0, end = 10, center = c(0, 0), angle = theta + pi)
draw.radial.line(start = 0, end = 10, center = c(0, 0), angle = theta - pi / 2)

draw.arc(0, 0, radius = 4, angle1 = 0, angle2 = theta)
text(4, 2, expression(theta))
dev.off()

pdf("figures/dist_biv_norm_rot_ellipse.pdf", height = 5, width = 5)
plot(Y, xlim = c(-4.5, 4.5), ylim = c(-4.5, 4.5), xlab = expression(x[1]), 
  ylab = expression(x[2]), asp = 1)
lines(c(-5, 5), c(0, 0), lty = 2)
lines(c(0, 0), c(-5, 5), lty = 2)

draw.ellipse(0, 0, 3, 1.5, angle = theta, deg = FALSE, segment = c(0, 2 * pi), 
  border = "red", lwd = 2)
dev.off()

