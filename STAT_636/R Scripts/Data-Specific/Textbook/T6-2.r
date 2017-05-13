####
#### For each of n = 19 dogs, we have time (in milliseconds) between heartbeats under 
#### four treatment conditions: (1) carbon dioxide at high pressure without halothane, 
#### (2) carbon dioxide at low pressure without halothane, (3) carbon dioxide at high 
#### pressure with halothane, and (4) carbon dioxide at low pressure with halothane. This 
#### is a repeated-measures design.
####

library(DescTools)

##
## Input data.
##

X <- as.matrix(read.delim("T6-2.DAT", header = FALSE, sep = ""))
n <- nrow(X)
q <- ncol(X)
colnames(X) <- c("TX_1", "TX_1", "TX_2", "TX_2")

CO2 <- factor(rep(rep(c("High", "Low"), each = n), 2))
Hal <- factor(rep(c("No", "Yes"), each = 2 * n))

## We will consider three mean contrasts: (1) the halothane "main effect" (mu_3 + mu_4) - 
## (mu_1 + mu_2), (2) the carbon dioxide pressure "main effect" (mu_1 + mu_3) - (mu_2 + 
## mu_4), and (3) the "interaction" between halothane and carbon dioxide pressure (mu_1 - 
## mu_2) - (mu_3 - mu_4). 
c_1 <- c(-1, -1, 1, 1)
c_2 <- c(1, -1, 1, -1)
c_3 <- c(1, -1, -1, 1)
CC <- rbind(c_1, c_2, c_3)

## Summary statistics.
x_bar <- colMeans(X)
S <- var(X)

##
## Inference.
##

## We reject H_0: Cmu = 0 in favor of H_1: Cmu != 0.
T2 <- n * t(CC %*% x_bar) %*% solve(CC %*% S %*% t(CC)) %*% (CC %*% x_bar)
1 - pf((n - q + 1) / ((n - 1) * (q - 1)) * T2, q - 1, n - q + 1)

## Bonferroni 95% confidence intervals suggest that there is a halothane main effect (the 
## presence of halothane is associated with longer times between heartbeats), a carbon 
## dioxide pressure main effect (*low* pressure is associated with longer times between 
## heartbeats), but no interaction between halothane and carbon dioxide pressure. 
t(c_1) %*% x_bar + c(-1, 1) * qt(1 - 0.05 / (2 * (q - 1)), n - 1) * 
  sqrt(t(c_1) %*% S %*% c_1 / n)
t(c_2) %*% x_bar + c(-1, 1) * qt(1 - 0.05 / (2 * (q - 1)), n - 1) * 
  sqrt(t(c_2) %*% S %*% c_2 / n)
t(c_3) %*% x_bar + c(-1, 1) * qt(1 - 0.05 / (2 * (q - 1)), n - 1) * 
  sqrt(t(c_3) %*% S %*% c_3 / n)

## Note that this is all equivalent to a usual one-sample analysis based on XC'.
Y <- X %*% t(CC)
p <- ncol(Y)

y_bar <- colMeans(Y)
S_y <- var(Y)

HotellingsT2Test(Y, mu = rep(0, p))
(n - q + 1) / ((n - 1) * (q - 1)) * T2
y_bar[1] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S_y[1, 1] / n)
y_bar[2] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S_y[2, 2] / n)
y_bar[3] + c(-1, 1) * qt(1 - 0.05 / (2 * p), n - 1) * sqrt(S_y[3, 3] / n)


