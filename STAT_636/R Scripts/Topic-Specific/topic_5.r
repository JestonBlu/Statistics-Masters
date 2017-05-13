####
#### An illustration of confidence regions and intervals in the bivariate case.
####

library(mvtnorm)
library(plotrix)

n <- 30
p <- 2
mu <- rep(1, p)
rho <- 0.9
Sigma <- matrix(rho, nrow = p, ncol = p); diag(Sigma) <- 1
alpha <- 0.2

## A function to draw a confidence region.
conf_region_f <- function(n, x_bar, S, alpha) {
  p <- 2
  c2 <- (n - 1) * p * qf(1 - alpha, p, n - p) / (n - p)
  
  ee <- eigen(S)
  lambda <- ee$values
  ee <- ee$vectors
  theta <- acos(abs(ee[1, 1])) * 57.2957795
  if(prod(sign(ee[, 1])) == -1)
    theta <- 180 - theta

  ## Draw (1 - alpha)100% confidence region for mean vector.
  xlim <- x_bar[1] + c(-1, 1) * 2 * sqrt(S[1, 1] / n)
  ylim <- x_bar[2] + c(-1, 1) * 2 * sqrt(S[2, 2] / n)
  plot(xlim, ylim, xlab = expression(mu[1]), ylab = expression(mu[2]), asp = 1, 
    xaxt = "n", yaxt = "n", type = "n")
  title(main = paste((1 - alpha) * 100, "% Confidence Region and Intervals", sep = ""))
  draw.ellipse(x_bar[1], x_bar[2], sqrt(c2 * lambda[1] / n), sqrt(c2 * lambda[2] / n), 
    angle = theta, lwd = 2)

  ## Simultaneous (1 - alpha)100% confidence intervals for mean components.
  ci_sim_1 <- x_bar[1] + c(-1, 1) * sqrt(c2 * S[1, 1] / n)
  ci_sim_2 <- x_bar[2] + c(-1, 1) * sqrt(c2 * S[2, 2] / n)
  lines(rep(ci_sim_1[1], 2), c(0, ci_sim_2[2]), lwd = 2, lty = 2, col = "red")
  lines(rep(ci_sim_1[2], 2), c(0, ci_sim_2[2]), lwd = 2, lty = 2, col = "red")
  lines(c(0, ci_sim_1[2]), rep(ci_sim_2[1], 2), lwd = 2, lty = 2, col = "red")
  lines(c(0, ci_sim_1[2]), rep(ci_sim_2[2], 2), lwd = 2, lty = 2, col = "red")
  axis(1, at = c(ci_sim_1[1], x_bar[1], ci_sim_1[2]), labels = round(c(ci_sim_1[1], 
    x_bar[1], ci_sim_1[2]), 1))
  axis(2, at = c(ci_sim_2[1], x_bar[2], ci_sim_2[2]), labels = round(c(ci_sim_2[1], 
    x_bar[2], ci_sim_2[2]), 1))

  ## Bonferroni (1 - alpha)100% confidence intervals for mean components.
  ci_bon_1 <- x_bar[1] + c(-1, 1) * qt(1 - alpha / (2 * p), n - 1) * sqrt(S[1, 1] / n)
  ci_bon_2 <- x_bar[2] + c(-1, 1) * qt(1 - alpha / (2 * p), n - 1) * sqrt(S[2, 2] / n)
  lines(rep(ci_bon_1[1], 2), c(0, ci_bon_2[2]), lwd = 2, lty = 3, col = "blue")
  lines(rep(ci_bon_1[2], 2), c(0, ci_bon_2[2]), lwd = 2, lty = 3, col = "blue")
  lines(c(0, ci_bon_1[2]), rep(ci_bon_2[1], 2), lwd = 2, lty = 3, col = "blue")
  lines(c(0, ci_bon_1[2]), rep(ci_bon_2[2], 2), lwd = 2, lty = 3, col = "blue")

  text(ci_sim_1[2] + 0.05, ci_bon_2[2], expression(T^2), col = "red", adj = c(0, 0))
  text(ci_sim_1[2] + 0.05, ci_bon_2[2] - 0.05, "Bonferroni", col = "blue", adj = c(0, 0))
}

## Simulate a sample from the bivariate normal distribution.
set.seed(101)

X <- rmvnorm(n, mu, Sigma)
x_bar <- colMeans(X)
S <- var(X)

conf_region_f(n, x_bar, S, alpha)

####
#### A simulation to assess confidence region / interval coverages. In addition to the 
#### coverage of the confidence regions for the mean vector, we will assess the simul-
#### taneous coverage of "one-at-a-time" t-based intervals, T2-based intervals, and 
#### Bonferroni intervals. Note that the reported coverages for the T2 intervals will be 
#### higher than 1 - alpha, since they are designed to include *all* linear combinations 
#### of the components of mu; we are only evaluating the joint coverage of the p mean 
#### components. 
####

## A function to carry out simulation.
sim_f <- function(n, p, rho, alpha, N = 1000) {
  mu <- rep(0, p)

  ## Covariance matrix, assuming compound symmetry and unit variance.
  Sigma <- matrix(rho, nrow = p, ncol = p); diag(Sigma) <- 1

  ## Critical values for the different regions / intervals.
  F_crit <- (n - 1) * p * qf(1 - alpha, p, n - p) / (n - p)
  t_crit <- qt(1 - alpha / 2, n - 1)
  bon_crit <- qt(1 - alpha / (2 * p), n - 1)

  cov_reg <- rep(NA, N)
  cov_t <- cov_T2 <- cov_bon <- matrix(NA, nrow = N, ncol = p)
  for(i in 1:N) {
    X <- rmvnorm(n, mu, Sigma)
    x_bar <- colMeans(X)
    S <- var(X)

    cov_reg[i] <- n * t(x_bar - mu) %*% solve(S) %*% (x_bar - mu) <= F_crit
    for(k in 1:p) {
      ci_t <- x_bar[k] + c(-1, 1) * t_crit * sqrt(S[k, k] / n)
      ci_T2 <- x_bar[k] + c(-1, 1) * sqrt(F_crit * S[k, k] / n)
      ci_bon <- x_bar[k] + c(-1, 1) * bon_crit * sqrt(S[k, k] / n)

      cov_t[i, k] <- (ci_t[1] <= mu[k]) & (mu[k] <= ci_t[2])
      cov_T2[i, k] <- (ci_T2[1] <= mu[k]) & (mu[k] <= ci_T2[2])
      cov_bon[i, k] <- (ci_bon[1] <= mu[k]) & (mu[k] <= ci_bon[2])
    }
  }

  ## Summarize results.
  cat(paste("Region coverage = ", round(mean(cov_reg), 2), "\n", sep = ""))
  cat(paste("Simultaneous coverage of the p t-intervals = ", 
    round(mean(apply(cov_t, 1, prod)), 2), "\n", sep = ""))
  cat(paste("Simultaneous coverage of the p T2-intervals = ", 
    round(mean(apply(cov_T2, 1, prod)), 2), "\n", sep = ""))
  cat(paste("Simultaneous coverage of the p Bonferroni-intervals = ", 
    round(mean(apply(cov_bon, 1, prod)), 2), "\n", sep = ""))
}

sim_f(n = 30, p = 2, rho = 0.0, alpha = 0.2); 0.8 ^ 2
sim_f(n = 30, p = 2, rho = 0.9, alpha = 0.2)
sim_f(n = 30, p = 5, rho = 0.9, alpha = 0.2)
sim_f(n = 100, p = 5, rho = 0.9, alpha = 0.2)

####
#### Comparison of interval widths under different scenarios. Interval types considered: 
#### (1) t-intervals, (2) T2-intervals, and (3) Bonferroni intervals with m = p.
####

alpha <- 0.05
n <- c(15, 25, 50, 100)
p <- c(2, 4, 10)

crit_vals <- matrix(NA, nrow = length(n) + 1, ncol = 1 + 2 * length(p))
rownames(crit_vals) <- c(as.character(n), "inf")
colnames(crit_vals) <- c("t", paste(rep(c("T2", "bon"), each = length(p)), rep(p, 2), 
  sep = "_"))
for(i in 1:length(n)) {
  crit_vals[i, "t"] <- qt(1 - alpha / 2, n[i] - 1)
  for(j in 1:length(p)) {
    crit_vals[i, paste("T2", p[j], sep = "_")] <- 
      sqrt((p[j] * (n[i] - 1) / (n[i] - p[j])) * qf(1 - alpha, p[j], n[i] - p[j]))
    crit_vals[i, paste("bon", p[j], sep = "_")] <- qt(1 - alpha / (2 * p[j]), n[i] - 1)
  }
}
crit_vals[length(n) + 1, "t"] <- qnorm(1 - alpha / 2)
for(j in 1:length(p)) {
  crit_vals[length(n) + 1, paste("T2", p[j], sep = "_")] <- sqrt(qchisq(1 - alpha, p[j]))
  crit_vals[length(n) + 1, paste("bon", p[j], sep = "_")] <- 
    qnorm(1 - alpha / (2 * p[j]))
}
round(crit_vals, 2)

####
#### EM example.
####

n <- 4
p <- 3
X <- matrix(c(NA, 7, 5, NA, 0, 2, 1, NA, 3, 6, 2, 5), nrow = n)

## Initial estimates.
mu_0 <- colMeans(X, na.rm = TRUE)
X_0 <- X
X_0[is.na(X_0)] <- kronecker(rep(1, n), mu_0)[is.na(X_0)]
Sigma_0 <- var(X_0) * (n - 1) / n

## EM algorithm.
eps <- 1e-5
max_iter <- 5000
theta_0 <- c(mu_0, diag(Sigma_0), Sigma_0[upper.tri(Sigma_0)])
theta_1 <- matrix(NA, nrow = max_iter, ncol = p + p * (p + 1) / 2)
delta <- rep(NA, max_iter)
for(i in 1:max_iter) {
  ## E step for observation vector one.
  x_1_1 <- X[1, 1, drop = FALSE]
  x_1_2 <- X[1, -1]
  mu_0_1 <- mu_0[1]
  mu_0_2 <- mu_0[-1]
  Sigma_0_11 <- Sigma_0[1, 1, drop = FALSE]
  Sigma_0_12 <- Sigma_0[1, -1, drop = FALSE]
  Sigma_0_21 <- Sigma_0[-1, 1, drop = FALSE]
  Sigma_0_22 <- Sigma_0[-1, -1]
  x_tilde_1_1 <- mu_0_1 + Sigma_0_12 %*% solve(Sigma_0_22) %*% (x_1_2 - mu_0_2)
  x_x_tilde_1_1_1 <- Sigma_0_11 - Sigma_0_12 %*% solve(Sigma_0_22) %*% Sigma_0_21 + 
    mu_0_1 %*% t(mu_0_1) + 2 * Sigma_0_12 %*% solve(Sigma_0_22) %*% (x_1_2 - mu_0_2) %*% 
    t(mu_0_1)
  x_x_tilde_1_1_2 <- mu_0_1 %*% t(x_1_2)
  x_tilde_1 <- c(x_tilde_1_1, x_1_2)
  x_x_tilde_1 <- rbind(c(x_x_tilde_1_1_1, x_x_tilde_1_1_2), 
    cbind(t(x_x_tilde_1_1_2), x_1_2 %*% t(x_1_2)))

  ## E step for observation vector four.
  x_4_1 <- X[4, 1:2]
  x_4_2 <- X[4, 3, drop = FALSE]
  mu_0_1 <- mu_0[1:2]
  mu_0_2 <- mu_0[3]
  Sigma_0_11 <- Sigma_0[1:2, 1:2]
  Sigma_0_12 <- Sigma_0[1:2, 3, drop = FALSE]
  Sigma_0_21 <- Sigma_0[3, 1:2, drop = FALSE]
  Sigma_0_22 <- Sigma_0[3, 3, drop = FALSE]
  x_tilde_4_1 <- mu_0_1 + Sigma_0_12 %*% solve(Sigma_0_22) %*% (x_4_2 - mu_0_2)
  x_x_tilde_4_1_1 <- Sigma_0_11 - Sigma_0_12 %*% solve(Sigma_0_22) %*% Sigma_0_21 + 
    mu_0_1 %*% t(mu_0_1) + 2 * Sigma_0_12 %*% solve(Sigma_0_22) %*% (x_4_2 - mu_0_2) %*% 
    t(mu_0_1)
  x_x_tilde_4_1_2 <- mu_0_1 %*% t(x_4_2)
  x_tilde_4 <- c(x_tilde_4_1, x_4_2)
  x_x_tilde_4 <- rbind(cbind(x_x_tilde_4_1_1, x_x_tilde_4_1_2), c(x_x_tilde_4_1_2, 
    x_4_2 %*% t(x_4_2)))

  ## E step versions of T_1 and T_2.
  T_tilde_1 <- x_tilde_1 + X[2, ] + X[3, ] + x_tilde_4
  T_tilde_2 <- x_x_tilde_1 + X[2, ] %*% t(X[2, ]) + X[3, ] %*% t(X[3, ]) + x_x_tilde_4

  ## M step.
  mu_0 <- T_tilde_1 / n
  Sigma_0 <- T_tilde_2 / n - mu_0 %*% t(mu_0)

  ## Check convergence.
  theta_1[i, ] <- c(mu_0, diag(Sigma_0), Sigma_0[upper.tri(Sigma_0)])
  delta[i] <- sqrt(sum((theta_1[i, ] - theta_0) ^ 2))
  if(delta[i] < eps)
    break
  theta_0 <- theta_1[i, ]
}




