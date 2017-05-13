####
#### For each of n = 11 water discharge samples from a municipal wastewater treatment 
#### plant, we have one measurements of chemical oxygen demand (BOD) and suspended solids 
#### (SS) at two laboratories. Thus, these are paired data.
####

library(DescTools)

##
## Input data.
##

X <- as.matrix(read.delim("T6-1.DAT", header = FALSE, sep = ""))
n <- nrow(X)
p <- ncol(X) / 2
colnames(X) <- c("BOD_1", "SS_1", "BOD_2", "SS_2")

## Summary statistics.
d <- cbind(X[, 1] - X[, 3], X[, 2] - X[, 4])
d_bar <- colMeans(d)
S_d <- var(d)

##
## The normality assumption is suspect for the SS variable.
##

par(mfrow = c(1, 2))
qqnorm(d[, 1]); qqline(d[, 1])
qqnorm(d[, 2]); qqline(d[, 2])

##
## Inference.
##

## The 95% confidence region for the mean difference vector does not contain delta_0' = 
## [0, 0]. Equivalently, we reject H_0: delta_0' = [0, 0] at significance level 0.05.
c2 <- ((n - 1) * p) / (n - p) * qf(0.95, p, n - p)
T2 <- n * t(d_bar - 0) %*% solve(S_d) %*% (d_bar - 0)

HotellingsT2Test(d, mu = rep(0, p))
(n - p) / ((n - 1) * p) * T2
1 - pf((n - p) / ((n - 1) * p) * T2, p, n - p)

## The 95% Bonferroni confidence intervals for the individual mean differences just 
## barely include 0 as a plausible mean difference, for both variables. Overall, we might 
## say there is "moderate" evidence for differences between the labs. It appears that 
## lab 1 tends to give larger values for SS, and lab 2 tends to give larger values of 
## BOD.
d_bar[1] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S_d[1, 1] / n)
d_bar[2] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S_d[2, 2] / n)

