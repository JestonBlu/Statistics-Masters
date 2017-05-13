####
#### For each of 42 microwave ovens, we have measurements of radiation emitted with the 
#### door both closed and open.
####

##
## Input data.
##

dta <- cbind(as.numeric(read.delim("T4-1.DAT", header = FALSE, sep = "")[, 1]), 
  as.numeric(read.delim("T4-5.DAT", header = FALSE, sep = "")[, 1]))
colnames(dta) <- c("Closed", "Open")
n <- nrow(dta)
p <- 2

##
## Transformations.
##

## Neither variable looks individually normal, so they can't be jointly normal.
pdf("figures/rad_raw.pdf")
par(mfrow = c(2, 2))
hist(dta[, 1], xlab = "", main = "Door Closed")
hist(dta[, 2], xlab = "", main = "Door Open")
qqnorm(dta[, 1], main = "Door Closed")
qqline(dta[, 1])
qqnorm(dta[, 2], main = "Door Open")
qqline(dta[, 2])
dev.off()
 
## Individual Box-Cox transformations. Interestingly, both variables have optimal lambda 
## value about 0.26. Might as well pick 0.25 for simplicity.
library(MASS)

pdf("figures/rad_bc.pdf", height = 4)
par(mfrow = c(1, 2))
bc_c <- boxcox(dta[, 1] ~ 1)
title(main = "Door Closed")
bc_o <- boxcox(dta[, 2] ~ 1)
title(main = "Door Open")
dev.off()

bc_c$x[which.max(bc_c$y)]
bc_o$x[which.max(bc_o$y)]
dta_tr <- (dta ^ 0.25 - 1) / 0.25

pdf("figures/rad_tr.pdf")
par(mfrow = c(2, 2))
hist(dta_tr[, 1], xlab = "", main = "Door Closed")
hist(dta_tr[, 2], xlab = "", main = "Door Open")
qqnorm(dta_tr[, 1], main = "Door Closed")
qqline(dta_tr[, 1])
qqnorm(dta_tr[, 2], main = "Door Open")
qqline(dta_tr[, 2])
dev.off()

## Multivariate Box-Cox. Consider a grid of paired values for the lambdas. Evaluate the 
## multivariate objective function for each, then draw a contour plot.
lambda_seq <- seq(from = -2, to = 2, length = 100)
obj <- matrix(NA, nrow = 100, ncol = 100)

csld <- colSums(log(dta))
for(i in 1:100) {
  for(j in 1:100) {
    X_l <- dta
    lambda <- lambda_seq[c(i, j)]
    
    for(k in 1:2) {
      if(lambda[k] != 0) {
        X_l[, k] <- (X_l[, k] ^ lambda[k] - 1) / lambda[k]
      } else {
        X_l[, k] <- log(X_l[, k])
      }
    }
    S <- var(X_l)
    
    obj[i, j] <- -(n / 2) * log(det(S)) + (lambda - 1) %*% csld
  }
}

pdf("figures/rad_cont.pdf")
par(mfrow = c(1, 1))
contour(lambda_seq, lambda_seq, obj, xlab = expression(lambda[1]), 
  ylab = expression(lambda[2]))
points(0.15, 0.15, pch = 20, cex = 2, col = "red")
text(0.3, 0.8, expression(paste(hat(lambda), "' = [0.15, 0.15]", sep = "")), lwd = 2)
dev.off()

