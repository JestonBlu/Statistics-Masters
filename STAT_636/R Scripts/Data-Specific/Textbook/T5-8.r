####
#### For each of n = 16 time periods, we have the number of overtime hours of 5 types in 
#### the Madison, Wisconsin police department. The overtime types are (1) legal appear-
#### ances, (2) extraordinary event, (3) holdover, (4) compensatory overtime allowed 
#### (COA), and (5) meetings. 
####

library(plotrix)

##
## Input data.
##

X <- as.matrix(read.delim("T5-8.DAT", header = FALSE, sep = ""))
n <- nrow(X)
p <- ncol(X)
colnames(X) <- c("legal", "extra", "holdover", "coa", "meeting")

## Summary statistics.
X_bar <- colMeans(X)
S <- var(X)

## X-bar charts for legal appearances and extraordinary event overtime types. 
pdf("figures/overtime_legal.pdf")
plot(X[, 1], ylim = c(1500, 5500), xlab = "Observation Number", ylab = "Overtime Hours", 
  main = "Legal Appearances", type = "b")
abline(X_bar[1], 0)
abline(X_bar[1] - 3 * sqrt(S[1, 1]), 0)
abline(X_bar[1] + 3 * sqrt(S[1, 1]), 0)
dev.off()

pdf("figures/overtime_extra.pdf")
plot(X[, 2], ylim = c(-3000, 6000), xlab = "Observation Number", ylab = "Overtime Hours", 
  main = "Extraordinary Event", type = "b")
points(11, X[11, 2], pch = 20, col = "red")
abline(X_bar[2], 0)
abline(X_bar[2] - 3 * sqrt(S[2, 2]), 0)
abline(X_bar[2] + 3 * sqrt(S[2, 2]), 0)
dev.off()

## An ellipse format chart for legal appearances and extraordinary event overtime types.
d2 <- rep(NA, n)
for(i in 1:n) 
  d2[i] <- t(X[i, 1:2] - X_bar[1:2]) %*% solve(S[1:2, 1:2]) %*% (X[i, 1:2] - X_bar[1:2])
c2 <- qchisq(0.99, 2)
  
ee <- eigen(S[1:2, 1:2])
lambda <- ee$values
ee <- ee$vectors
theta <- atan(ee[2, 1] / ee[1, 1]) * 57.2957795

pdf("figures/overtime_ellipse.pdf")
plot(c(1500, 5500), c(-2000, 5500), xlab = "Legal Appearances", 
  ylab = "Extraordinary Event", asp = 1, type = "n")
draw.ellipse(X_bar[1], X_bar[2], sqrt(c2 * lambda[1]), sqrt(c2 * lambda[2]), 
  angle = theta, lwd = 2)
points(X[, 1:2], pch = 20)
points(X[11, 1], X[11, 2], pch = 20, col = "red")
dev.off()

## A T2 chart for legal appearances and extraordinary event overtime types. This could 
## also be done for > 2 variables.
pdf("figures/overtime_T2.pdf")
plot(d2, xlab = "Observation Number", ylab = expression(T^2), type = "b")
points(11, d2[11], pch = 20, col = "red")
abline(c2, 0)
dev.off()
