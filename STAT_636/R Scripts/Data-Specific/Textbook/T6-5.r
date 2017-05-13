####
#### These are data on loss of calcium density in the dominant ulna bone. There are n_1 = 
#### 15 subjects in the control group and n_2 = 16 subjects in the treatment group. For 
#### each subject, measurements are taken at p = 4 time points: baseline, year 1, year 2, 
#### and year 4. 
####

##
## Input data.
##

X_1 <- read.delim("T6-5.DAT", header = FALSE, sep = "")
X_2 <- read.delim("T6-6.DAT", header = FALSE, sep = "")
n_1 <- nrow(X_1)
n_2 <- nrow(X_2)
n <- n_1 + n_2
p <- ncol(X_1)
g <- 2
colnames(X_1) <- colnames(X_2) <- c("Baseline", "Year_1", "Year_2", "Year_3")

## Summary statistics.
x_bar_1 <- colMeans(X_1)
x_bar_2 <- colMeans(X_2)
S_po <- ((n_1 - 1) * var(X_1) + (n_2 - 1) * var(X_2)) / (n - 2)

## Plot of growth curves.
pdf("figures/calcium_means.pdf")
plot(0:3, x_bar_1, xlab = "Year", ylab = "Mean Calcium Loss", type = "l", lwd = 2, 
  col = "blue", xaxt = "n")
axis(1, at = 0:3)
lines(0:3, x_bar_2, lwd = 2, col = "red")
legend(0.5, 67, legend = c("Control", "Treatment"), lwd = rep(2, 2), col = c("blue", 
  "red"), bty = "n")
dev.off()

## Fit cubic growth curves.
q <- 3
B <- cbind(1, 0:3, (0:3) ^ 2, (0:3) ^ 3)
beta_hat_1 <- solve(t(B) %*% solve(S_po) %*% B) %*% t(B) %*% solve(S_po) %*% x_bar_1
beta_hat_2 <- solve(t(B) %*% solve(S_po) %*% B) %*% t(B) %*% solve(S_po) %*% x_bar_2
k <- ((n - g) * (n - g - 1)) / ((n - g - p + q) * (n - g - p + q + 1))
cov_beta_hat_1 <- (k / n_1) * solve(t(B) %*% solve(S_po) %*% B)
cov_beta_hat_2 <- (k / n_2) * solve(t(B) %*% solve(S_po) %*% B)

## Test for equal curves. The p-value is only approximate, since it is based on large 
## sample sizes. We fail to reject H_0 at alpha = 0.05.
T2 <- t(beta_hat_1 - beta_hat_2) %*% solve(cov_beta_hat_1 + cov_beta_hat_2) %*% 
  (beta_hat_1 - beta_hat_2)
1 - pchisq(T2, q + 1)

## Fitted curves.
sq <- seq(0, 3, length = 500)
B_sq <- cbind(1, sq, sq ^ 2, sq ^ 3)
mu_hat_1 <- B_sq %*% beta_hat_1
mu_hat_2 <- B_sq %*% beta_hat_2

pdf("figures/calcium_cubic.pdf")
plot(0:3, x_bar_1, xlab = "Year", ylab = "Mean Calcium Loss", type = "l", lwd = 2, 
  col = "lightblue", xaxt = "n")
axis(1, at = 0:3)
lines(0:3, x_bar_2, lwd = 2, col = "pink")
lines(sq, mu_hat_1, lwd = 2, col = "blue")
lines(sq, mu_hat_2, lwd = 2, col = "red")
legend(0.5, 67, legend = c("Control", "Treatment"), lwd = rep(2, 2), col = c("blue", 
  "red"), bty = "n")
dev.off()












