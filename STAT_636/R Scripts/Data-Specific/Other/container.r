####
#### These data contains the elemental concentration of nine different elements (Titanium, 
#### Aluminium, Iron, Manganese, Magnesium, Calcium, Barium, Strontium, and Zirconium) in 
#### specimens of glass taken from two different containers. Ten measurements were taken 
#### from each container.
####

library(Hotelling)
library(DescTools)
library(plotrix)

## Load data.
data(container.df)
attach(container.df)
container.df

n <- 10

##
## Is multivariate normality a reasonable assumption?
##

## Univariate assessments of normality, by group. Manganese is obviously not normal. We 
## will exclude it from subsequent analysis. There appears to be an outlier for iron in 
## the first container and an outlier for magnesium in the second container. We'll go 
## ahead and leave them in. The other variables look reasonably normal.

pdf("figures/container_qq.pdf")
par(mfrow = c(3, 3), mar = c(2, 2, 2, 2))
qqnorm(Ti[gp == 1], main = "Ti"); qqline(Ti[gp == 1])
qqnorm(Al[gp == 1], main = "Al"); qqline(Al[gp == 1])
qqnorm(Fe[gp == 1], main = "Fe"); qqline(Fe[gp == 1])
qqnorm(Mn[gp == 1], main = "Mn"); qqline(Mn[gp == 1])
qqnorm(Mg[gp == 1], main = "Mg"); qqline(Mg[gp == 1])
qqnorm(Ca[gp == 1], main = "Ca"); qqline(Ca[gp == 1])
qqnorm(Ba[gp == 1], main = "Ba"); qqline(Ba[gp == 1])
qqnorm(Sr[gp == 1], main = "Sr"); qqline(Sr[gp == 1])
qqnorm(Zr[gp == 1], main = "Zr"); qqline(Zr[gp == 1])
dev.off()

par(mfrow = c(3, 3), mar = c(2, 2, 2, 2))
qqnorm(Ti[gp == 2], main = "Ti"); qqline(Ti[gp == 2])
qqnorm(Al[gp == 2], main = "Al"); qqline(Al[gp == 2])
qqnorm(Fe[gp == 2], main = "Fe"); qqline(Fe[gp == 2])
qqnorm(Mn[gp == 2], main = "Mn"); qqline(Mn[gp == 2])
qqnorm(Mg[gp == 2], main = "Mg"); qqline(Mg[gp == 2])
qqnorm(Ca[gp == 2], main = "Ca"); qqline(Ca[gp == 2])
qqnorm(Ba[gp == 2], main = "Ba"); qqline(Ba[gp == 2])
qqnorm(Sr[gp == 2], main = "Sr"); qqline(Sr[gp == 2])
qqnorm(Zr[gp == 2], main = "Zr"); qqline(Zr[gp == 2])
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1)

## Group-specific mean vectors and covariance matrices.
p <- 8
X_bar_1 <- colMeans(container.df[1:10, -c(1, 5)])
X_bar_2 <- colMeans(container.df[11:20, -c(1, 5)])
S_1 <- var(container.df[1:10, -c(1, 5)])
S_2 <- var(container.df[11:20, -c(1, 5)])

## Multivariate assessment of normality, by group. We saw two diagnostics in Topic 4: (1)
## a check for whether approximately 50% of the d_j^2 are <= the median of the chi-square 
## distribution with p degrees of freedom, and (2) a QQ plot of the d_j^2 (the "chi-
## square plot"). The chi-square plot is only appropriate for large sample sizes, so we 
## won't use it here. The proportions of d_j^2 less than the chi-square_p median differ 
## from 0.5, so multivariate normality looks suspect. Unfortunately, Box-Cox trans-
## formation does not help in this example. We will proceed, but note that the parametric 
## assumption is not to be trusted. We could try a bootstrap analysis instead.
d_j_2_g1 <- d_j_2_g2 <- rep(NA, n)
for(j in 1:n) {
  x_j_1 <- as.numeric(container.df[j, -c(1, 5)])
  x_j_2 <- as.numeric(container.df[j + 10, -c(1, 5)])
  d_j_2_g1[j] <- (x_j_1 - X_bar_1) %*% solve(S_1) %*% (x_j_1 - X_bar_1)
  d_j_2_g2[j] <- (x_j_2 - X_bar_2) %*% solve(S_2) %*% (x_j_2 - X_bar_2)
}

table(d_j_2_g1 <= qchisq(0.5, p))
table(d_j_2_g2 <= qchisq(0.5, p))

##
## Hotelling's T2 test for one mean vector. We'll look at the first container type. As a  
## simple first example, we only consider the elements Ti, Al, and Fe. We reject the null 
## hypothesis that mu_{Ti} = 0.035, mu_{Al} = 0.9, and mu_{Fe} = 0.15 at significance 
## level alpha = 0.05.
##

mu_0 <- c(0.035, 0.9, 0.15)
p_0 <- 3

## Compute mean vector and covariance matrix for the three variables.
X_bar <- colMeans(container.df[1:10, 2:4])
S <- var(container.df[1:10, 2:4])

T2 <- n * (X_bar - mu_0) %*% solve(S) %*% (X_bar - mu_0)
p_value <- 1 - pf((n - p_0) * T2 / ((n - 1) * p_0), p_0, n - p_0)
qf(0.05, p_0, n - p_0)

HotellingsT2Test(container.df[1:10, 2:4], mu = mu_0)
((n - p_0) / ((n - 1) * p_0)) * T2

##
## Now we consider all variables, except manganese. We fail to reject H_0 at significance 
## level alpha = 0.05.
##

mu_0 <- c(0.035, 0.9, 0.15, 0.25, 7, 0.02, 0.015, 0.011)
T2 <- n * (X_bar_1 - mu_0) %*% solve(S_1) %*% (X_bar_1 - mu_0)
p_value <- 1 - pf((n - p) * T2 / ((n - 1) * p), p, n - p)
qf(0.05, p, n - p)

HotellingsT2Test(container.df[1:10, -c(1, 5)], mu = mu_0)
((n - p) / ((n - 1) * p)) * T2

##
## Confidence intervals and regions. We'll just look at Al and Fe.
##

p <- 2

X_bar <- colMeans(container.df[1:10, 3:4])
S <- var(container.df[1:10, 3:4])

## A function to draw a (1-alpha)100% confidence region for mu. 
conf_region_f <- function(n, X_bar, S, alpha) {
  p <- length(X_bar)

  c2 <- (n - 1) * p * qf(1 - alpha, p, n - p) / (n - p)
  ee <- eigen(S)
  lambda <- ee$values
  ee <- ee$vectors
  theta <- atan(ee[2, 1] / ee[1, 1]) * 57.2957795

  xlim <- X_bar[1] + c(-1, 1) * 3.5 * sqrt(S[1, 1] / n)
  ylim <- X_bar[2] + c(-1, 1) * 2 * sqrt(S[2, 2] / n)
  plot(xlim, ylim, xlab = expression(mu[1]), ylab = expression(mu[2]), asp = 1, type = "n")
  title(main = paste((1 - alpha) * 100, "% Confidence Region", sep = ""))
  draw.ellipse(X_bar[1], X_bar[2], sqrt(c2 * lambda[1] / n), sqrt(c2 * lambda[2] / n), 
    angle = theta, lwd = 2)
}

## Two possible values for mu: (1) mu' = [0.9, 0.13] is a plausible value at 95% 
## confidence, but (2) mu' = [0.9, 0.15] is not. We could equivalently assess these 
## candidate values of mu with the T2 test.
print(c2 <- (n - 1) * p * qf(1 - alpha, p, n - p) / (n - p))
print(T2_1 <- n * t(X_bar - c(0.9, 0.13)) %*% solve(S) %*% (X_bar - c(0.9, 0.13)))
print(T2_2 <- n * t(X_bar - c(0.9, 0.15)) %*% solve(S) %*% (X_bar - c(0.9, 0.15)))
1 - pf((n - p) * T2_1 / ((n - 1) * p), p, n - p) > 0.05
1 - pf((n - p) * T2_2 / ((n - 1) * p), p, n - p) < 0.05

pdf("figures/conf_region.pdf")
conf_region_f(n, X_bar, S, alpha = 0.05)
points(X_bar[1], X_bar[2], pch = 20)
text(X_bar[1], X_bar[2] - 0.005, expression(bar(X)))
points(0.9, 0.13, pch = 20, col = "green")
points(0.9, 0.13)
points(0.9, 0.15, pch = 20, col = "red")
points(0.9, 0.15)
dev.off()

## The T2 simultaneous intervals are the shadows of the above confidence ellipse. We can 
## also use the T2 intervals to obtain an interval for the mean difference.
a <- c(1, -1)
ci_T2_1 <- X_bar[1] + c(-1, 1) * sqrt(c2 * S[1, 1] / n)
ci_T2_2 <- X_bar[2] + c(-1, 1) * sqrt(c2 * S[2, 2] / n)
ci_T2_diff <- t(a) %*% X_bar + c(-1, 1) * sqrt(c2 * t(a) %*% S %*% a / n)

pdf("figures/conf_region_sim.pdf")
conf_region_f(n, X_bar, S, alpha = 0.05)
lines(rep(ci_T2_1[1], 2), c(-1, ci_T2_2[2]), lty = 2, lwd = 2, col = "red")
lines(rep(ci_T2_1[2], 2), c(-1, ci_T2_2[2]), lty = 2, lwd = 2, col = "red")
lines(c(-1, ci_T2_1[2]), rep(ci_T2_2[1], 2), lty = 2, lwd = 2, col = "red")
lines(c(-1, ci_T2_1[2]), rep(ci_T2_2[2], 2), lty = 2, lwd = 2, col = "red")
text(0.9, 0.17, expression(paste(T^2, " Intervals", sep = "")), col = "red", adj = c(0, 0))
dev.off()

## The Bonferroni simultaneous intervals are narrower than the T2 intervals.
ci_bon_1 <- X_bar[1] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S[1, 1] / n)
ci_bon_2 <- X_bar[2] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S[2, 2] / n)

pdf("figures/conf_region_sim_bon.pdf")
conf_region_f(n, X_bar, S, alpha = 0.05)
lines(rep(ci_T2_1[1], 2), c(-1, ci_T2_2[2]), lty = 2, lwd = 2, col = "red")
lines(rep(ci_T2_1[2], 2), c(-1, ci_T2_2[2]), lty = 2, lwd = 2, col = "red")
lines(c(-1, ci_T2_1[2]), rep(ci_T2_2[1], 2), lty = 2, lwd = 2, col = "red")
lines(c(-1, ci_T2_1[2]), rep(ci_T2_2[2], 2), lty = 2, lwd = 2, col = "red")
text(0.9, 0.17, expression(paste(T^2, " Intervals", sep = "")), col = "red", adj = c(0, 0))
lines(rep(ci_bon_1[1], 2), c(-1, ci_bon_2[2]), lty = 3, lwd = 2, col = "blue")
lines(rep(ci_bon_1[2], 2), c(-1, ci_bon_2[2]), lty = 3, lwd = 2, col = "blue")
lines(c(-1, ci_bon_1[2]), rep(ci_bon_2[1], 2), lty = 3, lwd = 2, col = "blue")
lines(c(-1, ci_bon_1[2]), rep(ci_bon_2[2], 2), lty = 3, lwd = 2, col = "blue")
text(0.9, 0.165, "Bonferroni Intervals", col = "blue", adj = c(0, 0))
dev.off()

##
## Hotelling's T2 test for equality of aluminum and iron concentrations. 
##

n_1 <- n_2 <- 10
p <- 2

## Sample statistics.
X_bar_1 <- colMeans(container.df[1:10, 3:4])
X_bar_2 <- colMeans(container.df[11:20, 3:4])
S_1 <- var(container.df[1:10, 3:4])
S_2 <- var(container.df[11:20, 3:4])

## Assuming equal variances. We reject H_0: mu_1 = mu_2 at significance level alpha = 
## 0.05. Bonferroni intervals suggest that both element concentrations differ between the 
## container types.
S_po <- ((n_1 - 1) * S_1 + (n_2 - 1) * S_2) / (n_1 + n_2 - 2)

T2 <- (X_bar_1 - X_bar_2) %*% solve(S_po * (1 / n_1 + 1 / n_2)) %*% (X_bar_1 - X_bar_2)
p_value <- 1 - pf((n_1 + n_2 - p - 1) / ((n_1 + n_2 - 2) * p) * T2, p, n_1 + n_2 - p - 1)
qf(0.95, p, n_1 + n_2 - p - 1)

print(hotelling.test(Al + Fe ~ gp, data = container.df[, c(1, 3, 4)]))
(n_1 + n_2 - p - 1) / ((n_1 + n_2 - 2) * p) * T2

X_bar_1[1] - X_bar_2[1] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n_1 + n_2 - 2) * 
  sqrt(S_po[1, 1] * (1 / n_1 + 1 / n_2))
X_bar_1[2] - X_bar_2[2] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n_1 + n_2 - 2) * 
  sqrt(S_po[2, 2] * (1 / n_1 + 1 / n_2))

ee <- eigen(S_po)
lambda <- ee$values
ee <- ee$vectors
theta <- atan(ee[2, 1] / ee[1, 1]) * 57.2957795
c2 <- (n_1 + n_2 - 2) * p / (n_1 + n_2 - p - 1) * qf(0.95, p, n_1 + n_2 - p - 1)

pdf("figures/two_sample_region.pdf")
plot(c(0.075, 0.225), c(0.075, 0.125), xlab = "Aluminum", ylab = "Iron", asp = 1, 
  type = "n", main = expression(paste("95% Confidence Region for ", mu[1] - mu[2], 
  sep = "")))
draw.ellipse(X_bar_1[1] - X_bar_2[1], X_bar_1[2] - X_bar_2[2], 
  sqrt(c2 * lambda[1] * (1 / n_1 + 1 / n_2)), sqrt(c2 * lambda[2] * (1 / n_1 + 1 / n_2)), 
  angle = theta, lwd = 2)
dev.off()

## Assuming unequal variances. Conclusions do not change.
SS_1 <- S_1 %*% solve(S_1 / n_1 + S_2 / n_2) / n_1
SS_2 <- S_2 %*% solve(S_1 / n_1 + S_2 / n_2) / n_2
nu <- (p + p ^ 2) / ((sum(diag(SS_1 ^ 2)) + sum(diag(SS_1)) ^ 2) / n_1 + 
  (sum(diag(SS_2 ^ 2)) + sum(diag(SS_2)) ^ 2) / n_2)
T2 <- (X_bar_1 - X_bar_2) %*% solve(S_1 / n_1 + S_2 / n_2) %*% (X_bar_1 - X_bar_2)
p_value <- 1 - pf((nu - p + 1) / (nu * p) * T2, p, nu - p + 1)

X_bar_1[1] - X_bar_2[1] + c(-1, 1) * qt(1 - 0.05 / (2 * p), nu) * 
  sqrt(S_1[1, 1] / n_1 + S_2[1, 1] / n_2)
X_bar_1[2] - X_bar_2[2] + c(-1, 1) * qt(1 - 0.05 / (2 * p), nu) * 
  sqrt(S_1[2, 2] / n_1 + S_2[2, 2] / n_2)




