####
#### For each of n = 30 boards, we have four measurements of stiffness. The last column 
#### contains squared statistical distances from the sample mean vector.
####

##
## Input data.
##

dta <- read.delim("T4-3.DAT", header = FALSE, sep = "")
n <- nrow(dta)
p <- 4

X <- as.matrix(dta[, 1:4])
d2 <- as.numeric(dta[, 5])

##
## Normality checks.
##

## Univariate Q-Q plots for each variable. The variables look mostly normal. Only concern 
## is with individual 9.
pdf("figures/stiff_univ.pdf")
par(mfrow = c(2, 2))

for(i in 1:4) {
  qq <- qqnorm(X[, i], main = paste("Variable ", i, sep = ""))
  points(qq$x[9], qq$y[9], pch = 20, col = "red")
}
dev.off()

## About 57% of the individuals lie within the estimated inner 50% probability ellipsoid. 
chi_2 <- qchisq(0.5, p)
table(d2 <= chi_2)

## A chi-square Q-Q plot. There is deviation from the line of equality on the upper end. 
## In particular, the last three points (corresponding to the three individuals with the 
## largest statistical distance from the mean) cause the curve to pull away from the 
## line of equality. One of these points corresponds to sample 9, which stood out above 
## as possibly being not normal itself; the other two are boards 16 and 21.
oo <- order(d2)
q_s <- d2[oo]
q_c <- qchisq((1:n - 0.5) / n, p)

pdf("figures/stiff_chisq.pdf")
par(mfrow = c(1, 1))
plot(q_c, q_s, xlab = expression(paste(chi^2, " Quantiles", sep = "")), 
  ylab = "Ordered Squared Distances")
abline(0, 1, lty = 2)
points(q_c[28:30], q_s[28:30], pch = 20, col = "red")
dev.off()

dta[oo[28:30], ]

##
## Outlier detection.
##

## Standardized variables. With n x p = 120 total standardized variables, assuming they 
## are approximately normally distributed, we don't expect any values greater than about 
## 2.6 in absolute value (because 2.6 is the 0.00833 / 2 quantile of the standard normal, 
## and 0.00833 * 120 = 1). We'll just round 2.6 up to 3. Board 9 shows up as a potential 
## outlier. 
X_st <- scale(X, center = TRUE, scale = TRUE)
X_st[1, 1]
(X[1, 1] - mean(X[, 1])) / sqrt(var(X[, 1]))

apply(X_st, 1, function(x) { sum(abs(x) >= 3) })

## Dot plots.
ii_o <- c(9, 16, 21)
lbls <- rep("", n)
lbls[ii_o] <- ii_o

pdf("figures/stiff_dot.pdf")
par(mfrow = c(2, 2))
for(i in 1:4) {
  dotchart(X[, i], labels = lbls, main = paste("Variable ", i, sep = ""))
  points(X[ii_o, i], ii_o, pch = 20, col = "red")
  text(X[ii_o, i], ii_o - 1.75, ii_o)
}
dev.off()

## Pairwise scatterplots. Could also use the 'pairs' function.
pdf("figures/stiff_pairs.pdf")
par(mfrow = c(4, 4), mar = rep(0.5, 4), oma = rep(1.5, 4))
for(i in 1:4) {
  for(j in 1:4) {
    rng_j <- max(X[, j]) - min(X[, j])
    
    plot(X[, i], X[, j], xlab = "", ylab = "", xaxt = "n", yaxt = "n", type = "n")
    
    if(i != j) {
      eps <- (rng_j) * 0.10
      points(X[, i], X[, j], pch = 20, col = "grey")
      points(X[ii_o, i], X[ii_o, j], pch = 20, col = "red")
      text(X[ii_o, i], X[ii_o, j] - eps, labels = ii_o)
    } else {
      text(min(X[, j]) + rng_j / 2, min(X[, j]) + rng_j / 2, paste("x_", j, sep = ""))
    }
    
    if(i == 1) 
      axis(3, labels = ifelse(j == 2 | j == 4, TRUE, FALSE))
    if(i == 4)
      axis(1, labels = ifelse(j == 1 | j == 3, TRUE, FALSE))
    if(j == 1)
      axis(2, labels = ifelse(i == 2 | i == 4, TRUE, FALSE))
    if(j == 4)
      axis(4, labels = ifelse(i == 1 | i == 3, TRUE, FALSE))
  }
}
par(mfrow = c(1, 1), mar = c(5, 4, 4, 2) + 0.1, oma = rep(0, 4))
dev.off()


