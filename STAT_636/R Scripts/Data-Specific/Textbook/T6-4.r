####
#### These are data on qualities of extruding plastic. There are two factors, rate of 
#### extrusion and amount of an additive (both with two levels - low and high, so g = b = 
#### 2). Within each of the four factor level combinations, n = 5 plastic samples were 
#### observed, for which p = 3 variables were measured: (1) tear resistance, (2) gloss, 
#### and (3) opacity.
####

##
## Input data.
##

X <- read.delim("T6-4.DAT", header = FALSE, sep = "")
n <- 5
p <- 3
g <- b <- 2
colnames(X) <- c("Factor_1", "Factor_2", "X_1", "X_2", "X_3")
attach(X)

## Summary statistics.
x_bar <- colMeans(X[, 3:5])
x_bar_lk <- rbind(colMeans(X[Factor_1 == 0 & Factor_2 == 0, 3:5]), 
  colMeans(X[Factor_1 == 0 & Factor_2 == 1, 3:5]),
  colMeans(X[Factor_1 == 1 & Factor_2 == 0, 3:5]),
  colMeans(X[Factor_1 == 1 & Factor_2 == 1, 3:5]))
x_bar_l_dot <- rbind(colMeans(X[Factor_1 == 0, 3:5]), colMeans(X[Factor_1 == 1, 3:5]))
x_bar_dot_k <- rbind(colMeans(X[Factor_2 == 0, 3:5]), colMeans(X[Factor_2 == 1, 3:5]))

## Boxplots.
pdf("figures/plastic_boxes.pdf", width = 7, height = 3)
par(mfrow = c(1, 3))
boxplot(X[, 3] ~ Factor_1 * Factor_2, names = c("LL", "HL", "LH", "HH"), 
  main = "Tear Resistance")
boxplot(X[, 4] ~ Factor_1 * Factor_2, names = c("LL", "HL", "LH", "HH"), 
  main = "Gloss")
boxplot(X[, 5] ~ Factor_1 * Factor_2, names = c("LL", "HL", "LH", "HH"), 
  main = "Opacity")
dev.off()

## Components for MANOVA.
SSP_cor <- SSP_fac_1 <- SSP_fac_2 <- SSP_int <- SSP_res <- matrix(0, nrow = p, ncol = p)
for(l in 1:g) {
  SSP_fac_1 <- SSP_fac_1 + b * n * t(x_bar_l_dot[l, , drop = FALSE] - x_bar) %*% 
    (x_bar_l_dot[l, , drop = FALSE] - x_bar)
  SSP_fac_2 <- SSP_fac_2 + g * n * t(x_bar_dot_k[l, , drop = FALSE] - x_bar) %*% 
    (x_bar_dot_k[l, , drop = FALSE] - x_bar)
  for(k in 1:b) {
    SSP_int <- SSP_int + n * t(x_bar_lk[(l - 1) * 2 + k, , drop = FALSE] - 
      x_bar_l_dot[l, , drop = FALSE] - x_bar_dot_k[k, , drop = FALSE] + x_bar) %*% 
      (x_bar_lk[(l - 1) * 2 + k, , drop = FALSE] - x_bar_l_dot[l, , drop = FALSE] - 
      x_bar_dot_k[k, , drop = FALSE] + x_bar)
    for(r in 1:n) {
      SSP_res <- SSP_res + t(as.matrix(X[(l - 1) * 2 * n + (k - 1) * n + r, 3:5]) - 
        x_bar_lk[(l - 1) * 2 + k, , drop = FALSE]) %*% 
        (as.matrix(X[(l - 1) * 2 * n + (k - 1) * n + r, 3:5]) - 
        x_bar_lk[(l - 1) * 2 + k, , drop = FALSE])
      SSP_cor <- SSP_cor + t(as.matrix(X[(l - 1) * 2 * n + (k - 1) * n + r, 3:5]) - 
        x_bar) %*% (as.matrix(X[(l - 1) * 2 * n + (k - 1) * n + r, 3:5]) - x_bar)
    }
  }
}

##
## Inference.
##

## No interaction.
Lambda <- det(SSP_res) / det(SSP_int + SSP_res)
1 - pf((((g * b * (n - 1) - p + 1) / 2) / ((abs((g - 1) * (b - 1) - p) + 1) / 2)) * 
  (1 - Lambda) / Lambda, abs((g - 1) * (b - 1) - p) + 1, g * b * (n - 1) - p + 1)

## There is an effect of rate of extrusion.
Lambda <- det(SSP_res) / det(SSP_fac_1 + SSP_res)
1 - pf((((g * b * (n - 1) - p + 1) / 2) / ((abs((g - 1) - p) + 1) / 2)) * 
  (1 - Lambda) / Lambda, abs((g - 1) - p) + 1, g * b * (n - 1) - p + 1)

## There is an effect of amount of additive.
Lambda <- det(SSP_res) / det(SSP_fac_2 + SSP_res)
1 - pf((((g * b * (n - 1) - p + 1) / 2) / ((abs((b - 1) - p) + 1) / 2)) * 
  (1 - Lambda) / Lambda, abs((b - 1) - p) + 1, g * b * (n - 1) - p + 1)

summary(manova(as.matrix(X[, 3:5]) ~ Factor_1 + Factor_2 + Factor_1 * Factor_2), 
  test = "Wilks")

## Bonferroni 95% confidence intervals for factor 1 main effects.
m <- p * g * (g - 1)
nu <- g * b * (n - 1)
x_bar_l_dot[1, 1] - x_bar_l_dot[2, 1] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[1, 1] / (nu * b * n))
x_bar_l_dot[1, 2] - x_bar_l_dot[2, 2] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[2, 2] / (nu * b * n))
x_bar_l_dot[1, 3] - x_bar_l_dot[2, 3] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[3, 3] / (nu * b * n))

## Bonferroni 95% confidence intervals for factor 2 main effects. Note that all of these 
## contain zero (barely, in the case of tear resistance). This is an example where the 
## strength of evidence of an effect is increased by performing a multivariate analysis. 
m <- p * b * (b - 1)
x_bar_dot_k[1, 1] - x_bar_dot_k[2, 1] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[1, 1] / (nu * g * n))
x_bar_dot_k[1, 2] - x_bar_dot_k[2, 2] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[2, 2] / (nu * g * n))
x_bar_dot_k[1, 3] - x_bar_dot_k[2, 3] + c(-1, 1) * qt(1 - 0.05 / m, nu) * 
  sqrt(2 * SSP_res[3, 3] / (nu * g * n))








