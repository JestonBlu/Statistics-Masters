####
#### Geometric representation of a sample.
####

##
## Example. 
##

X <- matrix(c(4, -1, 3, 1, 3, 5), nrow = 3)

## Row and column vectors.
x_1 <- X[1, , drop = TRUE]
x_2 <- X[2, , drop = TRUE]
x_3 <- X[3, , drop = TRUE]

y_1 <- X[, 1, drop = TRUE]
y_2 <- X[, 2, drop = TRUE]
x_bar_1 <- mean(y_1)
x_bar_2 <- mean(y_2)

## Deviation vectors.
one <- rep(1, 3)

d_1 <- y_1 - x_bar_1 * one
d_2 <- y_2 - x_bar_2 * one

all(y_1 == x_bar_1 * one + d_1)
all(y_2 == x_bar_2 * one + d_2)

x_bar_1 * t(one) %*% d_1
x_bar_2 * t(one) %*% d_2

## Covariance and correlation matrices.
s_11 <- t(d_1) %*% d_1 / 3
s_22 <- t(d_2) %*% d_2 / 3
s_12 <- t(d_1) %*% d_2 / 3

S_n <- matrix(c(s_11, s_12, s_12, s_22), nrow = 2)
var(X) * 2 / 3

r_12 <- s_12 / (sqrt(s_11) * sqrt(s_22))
R <- matrix(c(1, r_12, r_12, 1), nrow = 2)
cor(X)

##
## Example for illustrating generalized variance.
##

## Generate three covariance matrices with differing correlation structures but equal 
## generalized variances.
e_1 <- cbind(c(1 / sqrt(2), 1 / sqrt(2)), c(1 / sqrt(2), -1 / sqrt(2)))
e_2 <- cbind(c(1, 0), c(0, 1))
e_3 <- cbind(c(1 / sqrt(2), -1 / sqrt(2)), c(1 / sqrt(2), 1 / sqrt(2)))

lambda_1 <- c(4, 1)
lambda_2 <- c(2, 2)
lambda_3 <- c(4, 1)

S_1 <- lambda_1[1] * e_1[, 1] %*% t(e_1[, 1]) + lambda_1[2] * e_1[, 2] %*% t(e_1[, 2])
S_2 <- lambda_2[1] * e_2[, 1] %*% t(e_2[, 1]) + lambda_2[2] * e_2[, 2] %*% t(e_2[, 2])
S_3 <- lambda_3[1] * e_3[, 1] %*% t(e_3[, 1]) + lambda_3[2] * e_3[, 2] %*% t(e_3[, 2])

det(S_1)
det(S_2)
det(S_3)

## Since the variables both have mean vector (0, 0)', the cosine of the angle between 
## them is equal to the correlation coefficient.
rho_1 <- S_1[1, 2] / (sqrt(S_1[1, 1]) * sqrt(S_1[2, 2]))
rho_2 <- S_2[1, 2] / (sqrt(S_2[1, 1]) * sqrt(S_2[2, 2]))
rho_3 <- S_3[1, 2] / (sqrt(S_3[1, 1]) * sqrt(S_3[2, 2]))

theta_1 <- acos(rho_1)
theta_2 <- acos(rho_2)
theta_3 <- acos(rho_3)

## Generate some data using these covariances. Here, I'll use the multivariate normal 
## distribution. We'll learn more about it soon.
library(mvtnorm)
library(plotrix)

set.seed(101)

n <- 100
Y_1 <- rmvnorm(n, mean = c(0, 0), sigma = S_1)
Y_2 <- rmvnorm(n, mean = c(0, 0), sigma = S_2)
Y_3 <- rmvnorm(n, mean = c(0, 0), sigma = S_3)

## Make a picture. In p = 2 dimensions, defining c^2 as the qth percentile of the chi
## square distribution with p degrees of freedom will capture approximately q% of the 
## observations (we'll see why soon). We can draw the corresponding ellipse as having 
## axes parallel to the eigenvalues.
c2 <- qchisq(0.95, 2)
kappa <- 0.99

arrow_coord_1_1 <- c(rho_1 * sqrt(c2 * lambda_1[1]), 
  sin(theta_1) * sqrt(c2 * lambda_1[1]))
arrow_coord_1_1 <- c(arrow_coord_1_1 * kappa, arrow_coord_1_1)
arrow_coord_1_2 <- c(sin(theta_1) * sqrt(c2 * lambda_1[2]), 
  rho_1 * sqrt(c2 * lambda_1[2]))
arrow_coord_1_2 <- c(arrow_coord_1_2 * kappa, arrow_coord_1_2)

plot(Y_1, xlim = c(-6, 6), ylim = c(-6, 6), xlab = expression(x[1]), 
  ylab = expression(x[2]), pch = 20, col = "grey", asp = 1)
lines(c(-10, 10), c(0, 0), lty = 2)
lines(c(0, 0), c(-10, 10), lty = 2)
draw.ellipse(0, 0, sqrt(c2 * lambda_1[1]), sqrt(c2 * lambda_1[2]), 
  angle = theta_1 * 57.2957795, deg = TRUE, border = "red", lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_1[1]), angle = theta_1, lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_1[2]), angle = theta_1 - pi / 2, lwd = 2)
arrows(arrow_coord_1_1[1], arrow_coord_1_1[2], arrow_coord_1_1[3], arrow_coord_1_1[4], 
  length = 0.1, lwd = 2)
arrows(arrow_coord_1_2[1], -arrow_coord_1_2[2], arrow_coord_1_2[3], -arrow_coord_1_2[4], 
  length = 0.1, lwd = 2)


arrow_coord_2_1 <- c(rho_2 * sqrt(c2 * lambda_2[1]), 
  sin(theta_2) * sqrt(c2 * lambda_2[1]))
arrow_coord_2_1 <- c(arrow_coord_2_1 * kappa, arrow_coord_2_1)
arrow_coord_2_2 <- c(sin(theta_2) * sqrt(c2 * lambda_2[2]), 
  rho_2 * sqrt(c2 * lambda_2[2]))
arrow_coord_2_2 <- c(arrow_coord_2_2 * kappa, arrow_coord_2_2)


plot(Y_2, xlim = c(-6, 6), ylim = c(-6, 6), xlab = expression(x[1]), 
  ylab = expression(x[2]), pch = 20, col = "grey", asp = 1)
lines(c(-10, 10), c(0, 0), lty = 2)
lines(c(0, 0), c(-10, 10), lty = 2)
draw.ellipse(0, 0, sqrt(c2 * lambda_2[1]), sqrt(c2 * lambda_2[2]), 
  angle = theta_2 * 57.2957795, deg = TRUE, border = "red", lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_2[1]), angle = theta_2, lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_2[2]), angle = theta_2 - pi / 2, lwd = 2)
arrows(arrow_coord_2_1[1], arrow_coord_2_1[2], arrow_coord_2_1[3], arrow_coord_2_1[4], 
  length = 0.1, lwd = 2)
arrows(arrow_coord_2_2[1], -arrow_coord_2_2[2], arrow_coord_2_2[3], -arrow_coord_2_2[4], 
  length = 0.1, lwd = 2)


arrow_coord_3_1 <- c(rho_3 * sqrt(c2 * lambda_3[1]), 
  sin(theta_3) * sqrt(c2 * lambda_3[1]))
arrow_coord_3_1 <- c(arrow_coord_3_1 * kappa, arrow_coord_3_1)
arrow_coord_3_2 <- c(sin(theta_3) * sqrt(c2 * lambda_3[2]), 
  rho_3 * sqrt(c2 * lambda_3[2]))
arrow_coord_3_2 <- c(arrow_coord_3_2 * kappa, arrow_coord_3_2)

plot(Y_3, xlim = c(-6, 6), ylim = c(-6, 6), xlab = expression(x[1]), 
  ylab = expression(x[2]), pch = 20, col = "grey", asp = 1)
lines(c(-10, 10), c(0, 0), lty = 2)
lines(c(0, 0), c(-10, 10), lty = 2)
draw.ellipse(0, 0, sqrt(c2 * lambda_3[1]), sqrt(c2 * lambda_3[2]), 
  angle = theta_3 * 57.2957795, deg = TRUE, border = "red", lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_3[1]), angle = theta_3 - pi, lwd = 2)
draw.radial.line(0, sqrt(c2 * lambda_3[2]), angle = theta_3 - pi / 2, lwd = 2)
arrows(-arrow_coord_3_1[1], -arrow_coord_3_1[2], -arrow_coord_3_1[3], -arrow_coord_3_1[4], 
  length = 0.1, lwd = 2)
arrows(arrow_coord_3_2[1], -arrow_coord_3_2[2], arrow_coord_3_2[3], -arrow_coord_3_2[4], 
  length = 0.1, lwd = 2)

##
## Generalized variance = 0 example. A an example with n = 4 and p = 3. The sum of the 
## three variables equals one for each individual.
##

X <- rbind(c(0.25, 0.25, 0.50), c(0.15, 0.65, 0.20), c(0.4, 0.3, 0.3), 
  c(0.7, 0.05, 0.25))

x_bar <- colMeans(X)
D <- X - outer(rep(1, 4), x_bar)

Sigma <- (1 / 3) * t(D) %*% D

## The third eigenvalue is zero, and its eigengene is a weighted sum of the three 
## variables. Since eigenvectors can be arbitrarily scaled, this pattern is consistent 
## with what we know about these data: the sum of the three variables equals one.
eigen(Sigma)

####
#### Sample statistics as matrix operations.
####

##
## Some example data.
##

set.seed(101)

X <- matrix(rnorm(15), nrow = 5)
n <- 5

##
## Sample mean, variance, and correlation.
##

one <- rep(1, n)
Id <- diag(n)

## Mean vector.
colMeans(X)
x_bar <- t(X) %*% one / n

## Covariance matrix.
var(X)
S <- t(X) %*% (Id - one %*% t(one) / n) %*% X / (n - 1)

## Correlation matrix.
D_inv <- diag(1 / sqrt(diag(S)))

cor(X)
R <- D_inv %*% S %*% D_inv
solve(D_inv) %*% R %*% solve(D_inv)

##
## Linear combinations.
##

## Vectors for two linear combinations.
u <- c(1, 0, -1)
v <- c(1, 2, 3)

lc_u <- X %*% u
lc_v <- X %*% v

## Sample mean.
mean(lc_u)
x_bar_u <- u %*% x_bar

## Sample variance.
var(lc_u)
s_u <- t(u) %*% S %*% u
s_v <- t(v) %*% S %*% v

## Sample covariance.
cov(lc_u, lc_v)
cov_uv <- t(u) %*% S %*% v

## Sample correlation.
cor(lc_u, lc_v)
cor_uv <- t(u) %*% S %*% v / sqrt(s_u * s_v)