####
#### Subset of data from the Synthetic Aperture Personality Assessment (SAPA). For each 
#### of 1000 individuals, we have 25 self-report personality variables. The variables are 
#### organized into five predefined categories: agreeableness (A), conscientiousness (C), 
#### extraversion (E), neuroticism (N), and openness (O). 
#### 

## Load data from 'psych' package.
library(psych)
data(bfi)

##
## Factor analysis can be used to construct "factors" from scratch, without knownledge of 
## the five predefined categories. It is of interest to see whether the factor analysis 
## factors match the predefined categories.
##

fa <- factanal(covmat = cor(bfi[, 1:25], use = "complete.obs"), factors = 5)
print(loadings(fa), cutoff = 0.25)

ll <- loadings(fa)
ll[abs(ll) < 0.4] <- 0

pdf("figures/bfi_fa.pdf", height = 5)
plot(c(1, 25), c(-0.7, 0.85), xlab = "Variables", ylab = "Loadings", type = "n", 
  xaxt = "n", main = "Loadings For 5 Factors (Small Values Have Been Filtered)")
axis(1, at = seq(5, 25, by = 5), labels = FALSE)
axis(1, at = seq(2.5, 22.5, by = 5), labels = c("A", "C", "E", "N", "O"), tick = FALSE)
for(i in 1:5)
  lines(rep(i * 5, 2), c(-1, 1), lty = 2)
for(i in 1:5) {
  ii <- (1:25)[ll[, i] != 0]
  points(ii, ll[ii, i])
  points(ii, ll[ii, i], pch = 20, col = i)
}
dev.off()
