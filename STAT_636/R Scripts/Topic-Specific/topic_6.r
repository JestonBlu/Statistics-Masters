####
#### Example 6.3 from textbook.
####

library(Hotelling)
library(DescTools)
library(plotrix)

n_1 <- n_2 <- 50
p <- 2

## Summary statistics.
x_bar_1 <- c(8.3, 4.1)
x_bar_2 <- c(10.2, 3.9)
S_1 <- matrix(c(2, 1, 1, 6), nrow = p)
S_2 <- matrix(c(2, 1, 1, 4), nrow = p)

S_po <- ((n_1 - 1) * S_1 + (n_2 - 1) * S_2) / (n_1 + n_2 - 2)

## 95% confidence ellipse for mu_1 - mu_2.
ee <- eigen(S_po)
lambda <- ee$values
ee <- ee$vectors
theta <- atan(ee[2, 1] / ee[1, 1]) * 57.2957795
c2 <- (n_1 + n_2 - 2) * p / (n_1 + n_2 - p - 1) * qf(0.95, p, n_1 + n_2 - p - 1)

plot(c(-3, 1), c(-1, 2), xlab = expression(mu[11] - mu[21]), 
  ylab = expression(mu[12] - mu[22]), asp = 1, type = "n")
draw.ellipse(x_bar_1[1] - x_bar_2[1], x_bar_1[2] - x_bar_2[2], 
  sqrt(c2 * lambda[1] * (1 / n_1 + 1 / n_2)), sqrt(c2 * lambda[2] * (1 / n_1 + 1 / n_2)), 
  angle = theta, lwd = 2)
points(x_bar_1[1] - x_bar_2[1], x_bar_1[2] - x_bar_2[2], pch = 20, col = "blue")
lines(c(-5, 5), c(0, 0))
lines(c(0, 0), c(-5, 5))

####
#### Example 6.10 from textbook. For each of n_1 = 271 private, n_2 = 138 nonprofit, and 
#### n_3 = 107 government nursing homes, we have observations on p = 4 variables: (1) 
#### cost of nursing labor, (2) cost of dietary labor, (3) cost of plant operation and 
#### maintenance labor, and (4) cost of housekeeping and laundry labor. 
####

n_1 <- 271
n_2 <- 138
n_3 <- 107
n <- n_1 + n_2 + n_3
p <- 4
g <- 3

## Summary statistics.
x_bar_1 <- c(2.066, 0.480, 0.082, 0.360)
x_bar_2 <- c(2.167, 0.596, 0.124, 0.418)
x_bar_3 <- c(2.273, 0.521, 0.125, 0.383)
x_bar <- (n_1 * x_bar_1 + n_2 * x_bar_2 + n_3 * x_bar_3) / n
S_1 <- matrix(c(0.291, -0.001, 0.002, 0.010, -0.001, 0.011, 0.000, 0.003, 0.002, 0.000, 
  0.001, 0.000, 0.010, 0.003, 0.000, 0.010), nrow = p)
S_2 <- matrix(c(0.561, 0.011, 0.001, 0.037, 0.011, 0.025, 0.004, 0.007, 0.001, 0.004, 
  0.005, 0.002, 0.037, 0.007, 0.002, 0.019), nrow = p)
S_3 <- matrix(c(0.261, 0.030, 0.003, 0.018, 0.030, 0.017, 0.000, 0.006, 0.003, 0.000, 
  0.004, 0.001, 0.018, 0.006, 0.001, 0.013), nrow = p)

## MANOVA. Reject H_0: tau_1 = tau_2 = tau_3 = 0 (no differences in the mean cost vectors 
## between the nursing home types) at alpha = 0.05. Also see 'manova' function.
W <- (n_1 - 1) * S_1 + (n_2 - 1) * S_2 + (n_3 - 1) * S_3
B <- n_1 * (x_bar_1 - x_bar) %*% t(x_bar_1 - x_bar) + 
  n_2 * (x_bar_2 - x_bar) %*% t(x_bar_2 - x_bar) + 
  n_3 * (x_bar_3 - x_bar) %*% t(x_bar_3 - x_bar)
Lambda <- det(W) / det(B + W)
1 - pchisq(-(n - 1 - (p + g) / 2) * log(Lambda), p * (g - 1))
1 - pf(((n - p - 2) / p) * ((1 - sqrt(Lambda)) / sqrt(Lambda)), 2 * p, 2 * (n - p - 2))

## Bonferroni 95% intervals. There are 4(3)(2)/2 = 12 possible pairwise comparisons. Here 
## are intervals for comparing mean costs between private and government-owned nursing 
## homes. The government-owned homes tend to spend more on both nursing labor and plant 
## operation and maintenance than privately-owned homes.
x_bar_1[1] - x_bar_3[1] + c(-1, 1) * qt(1 - 0.05 / (12 * 2), n - g) * 
  sqrt((W[1, 1] / (n - g)) * (1 / n_1 + 1 / n_3))
x_bar_1[2] - x_bar_3[2] + c(-1, 1) * qt(1 - 0.05 / (12 * 2), n - g) * 
  sqrt((W[2, 2] / (n - g)) * (1 / n_1 + 1 / n_3))
x_bar_1[3] - x_bar_3[3] + c(-1, 1) * qt(1 - 0.05 / (12 * 2), n - g) * 
  sqrt((W[3, 3] / (n - g)) * (1 / n_1 + 1 / n_3))
x_bar_1[4] - x_bar_3[4] + c(-1, 1) * qt(1 - 0.05 / (12 * 2), n - g) * 
  sqrt((W[4, 4] / (n - g)) * (1 / n_1 + 1 / n_3))

## Test for equality of covariance matrices.
S_po <- W / (n - g)
M <- (n - g) * log(det(S_po)) - (n_1 - 1) * log(det(S_1)) - (n_2 - 1) * log(det(S_2)) - 
  (n_3 - 1) * log(det(S_3))
u <- (1 / (n_1 - 1) + 1 / (n_2 - 1) + 1 / (n_3 - 1) - 1 / (n - g)) * 
  ((2 * p ^ 2 + 3 * p - 1) / (6 * (p + 1) * (g - 1)))
1 - pchisq((1 - u) * M, p * (p + 1) * (g - 1) / 2)

####
#### Illustration of interaction for two-way ANOVA. Factor 1 has 3 levels, and factor 2 
#### has 4 levels.
####

## Overall mean and main effects.
mu <- 5
tau <- c(-1, 0, 1)
beta <- c(-0.5, 0, -0.5, 1)

## Interaction effects.
gamma <- matrix(NA, nrow = 3, ncol = 4)
rownames(gamma) <- paste("F_1", 1:3, sep = "_")
colnames(gamma) <- paste("F_2", 1:4, sep = "_")

gamma[, 1] <- c(-0.5, 0, 0.5)
gamma[, 2] <- c(0, 0, 0)
gamma[, 3] <- c(1, 0, -1)
gamma[, 4] <- c(-0.5, 0, 0.5)

## Means with and without interaction.
means_0 <- mu + matrix(tau, nrow = 3, ncol = 4) + matrix(beta, nrow = 3, ncol = 4, 
  byrow = TRUE)
means_1 <- means_0 + gamma

## Pictures.
pdf("figures/two_way_0.pdf")
plot(c(1, 4), c(3, 7.5), xlab = "Level of factor 2", ylab = "Expected response", 
  main = "Without Interaction", xaxt = "n", yaxt = "n", type = "n")
axis(1, at = 1:4)
lines(1:4, means_0[1, ], col = "red", lwd = 2)
lines(1:4, means_0[2, ], col = "blue", lwd = 2)
lines(1:4, means_0[3, ], col = "green", lwd = 2)
legend(1, 7.5, legend = c("Level 1 of factor 1", "Level 2 of factor 1", 
  "Level 3 of factor 1"), col = c("red", "blue", "green"), lwd = rep(2, 3), bty = "n")
dev.off()

pdf("figures/two_way_1.pdf")
plot(c(1, 4), c(3, 7.5), xlab = "Level of factor 2", ylab = "Expected response", 
  main = "With Interaction", xaxt = "n", yaxt = "n", type = "n")
axis(1, at = 1:4)
lines(1:4, means_1[1, ], col = "red", lwd = 2)
lines(1:4, means_1[2, ], col = "blue", lwd = 2)
lines(1:4, means_1[3, ], col = "green", lwd = 2)
legend(1, 7.5, legend = c("Level 1 of factor 1", "Level 2 of factor 1", 
  "Level 3 of factor 1"), col = c("red", "blue", "green"), lwd = rep(2, 3), bty = "n")
dev.off()

####
#### Example 6.14 from textbook.
####

n_1 <- n_2 <- 30
p <- 4

x_bar_1 <- c(6.833, 7.033, 3.967, 4.700)
x_bar_2 <- c(6.633, 7.000, 4.000, 4.533)
S_po <- matrix(c(0.606, 0.262, 0.066, 0.161, 0.262, 0.637, 0.173, 0.143, 0.066, 0.173, 
  0.810, 0.029, 0.161, 0.143, 0.029, 0.306), nrow = p)

## Profile plot.
pdf("figures/marriage.pdf")
plot(1:4, x_bar_1, xlab = "Variable", ylab = "Sample mean", type = "l", lwd = 2, 
  col = "blue", xaxt = "n", yaxt = "n")
axis(1, at = 1:4)
axis(2, at = 4:7)
lines(1:4, x_bar_2, lwd = 2, col = "red")
legend(3, 6.5, legend = c("Males", "Females"), lwd = rep(2, 2), col = c("blue", "red"), 
  bty = "n")
dev.off()

## Test for parallel profiles.
CC <- matrix(c(-1, 0, 0, 1, -1, 0, 0, 1, -1, 0, 0, 1), nrow = p - 1)
T2 <- t(x_bar_1 - x_bar_2) %*% t(CC) %*% 
  solve((1 / n_1 + 1 / n_2) * CC %*% S_po %*% t(CC)) %*% CC %*% (x_bar_1 - x_bar_2)
1 - pf(((n_1 + n_2 - p) / ((n_1 + n_2 - 2) * (p - 1))) * T2, p - 1, n_1 + n_2 - p)

## Test for coincident profiles, assuming they are parallel.
T2 <- (sum(x_bar_1 - x_bar_2) / sqrt((1 / n_1 + 1 / n_2) * sum(S_po))) ^ 2
1 - pf(T2, 1, n_1 + n_2 - 2)

####
#### Linear regression examples.
####

n <- 100

##
## One continuous covariate one two-level factor. A linear mean relationship with the 
## continuous covariate. And an interaction.
##

beta <- c(0, 0, 0.5, 1)
sigma <- 0.25
z_1 <- rep(0:1, each = n / 2)
z_2 <- runif(n, 0, 1)
Z <- cbind(1, z_1, z_2, z_1 * z_2)

set.seed(101)
y <- Z %*% beta + rnorm(n, 0, sigma)

plot(z_2, y, xlab = expression(z[2]), ylab = "y", type = "n")
points(z_2[z_1 == 0], y[z_1 == 0], pch = 20, col = "blue")
points(z_2[z_1 == 1], y[z_1 == 1], pch = 20, col = "red")

## Model estimation.
beta_hat <- solve(t(Z) %*% Z) %*% t(Z) %*% y
y_hat <- Z %*% beta_hat
s <- sqrt(((n - 1) / (n - 4)) * var(y - y_hat))
s * sqrt(diag(solve(t(Z) %*% Z)))

summary(lm(y ~ Z - 1))

pdf("figures/reg_lin_fitted.pdf")
plot(z_2, y, xlab = expression(z[2]), ylab = "y", type = "n")
points(z_2[z_1 == 0], y[z_1 == 0], pch = 20, col = "lightblue")
points(z_2[z_1 == 1], y[z_1 == 1], pch = 20, col = "pink")
abline(beta_hat[1], beta_hat[3], lwd = 2, col = "blue")
abline(beta_hat[1] + beta_hat[2], beta_hat[3] + beta_hat[4], lwd = 2, col = "red")
text(0.7, 0.1, expression(hat(beta)[0] + hat(beta)[2] * z[2]))
text(0.4, 1.0, 
  expression(hat(beta)[0] + hat(beta)[1] + (hat(beta)[2] + hat(beta)[3]) * z[2]))
dev.off()

##
## Now a quadratic mean relationship with the continuous covariate.
##

beta <- c(0, 0, 0.5, 1, -0.25, -0.4)
Z <- cbind(1, z_1, z_2, z_2 ^ 2, z_1 * z_2, z_1 * z_2 ^ 2)

set.seed(101)
y <- Z %*% beta + rnorm(n, 0, sigma)

plot(z_2, y, xlab = expression(z[2]), ylab = "y", type = "n")
points(z_2[z_1 == 0], y[z_1 == 0], pch = 20, col = "blue")
points(z_2[z_1 == 1], y[z_1 == 1], pch = 20, col = "red")

## Model estimation.
beta_hat <- solve(t(Z) %*% Z) %*% t(Z) %*% y
y_hat <- Z %*% beta_hat
s <- sqrt(((n - 1) / (n - 6)) * var(y - y_hat))
s * sqrt(diag(solve(t(Z) %*% Z)))

sq <- seq(0, 1, length = 500)
Z_fit_1 <- cbind(1, 0, sq, sq ^ 2, 0, 0)
Z_fit_2 <- cbind(1, 1, sq, sq ^ 2, sq, sq ^ 2)

pdf("figures/reg_quad_fitted.pdf")
plot(z_2, y, xlab = expression(z[2]), ylab = "y", type = "n")
points(z_2[z_1 == 0], y[z_1 == 0], pch = 20, col = "lightblue")
points(z_2[z_1 == 1], y[z_1 == 1], pch = 20, col = "pink")
lines(sq, Z_fit_1 %*% beta_hat, lwd = 2, col = "blue")
lines(sq, Z_fit_2 %*% beta_hat, lwd = 2, col = "red")
dev.off()











