#### Twenty-six samples of Romano-British pottery were found at four different kiln sites 
#### in Wales, Gwent and the New Forest. The sites are Llanederyn (L), Caldicot (C), 
#### Island Thorns (I), and Ashley Rails (A). The other variables are the percentage of 
#### oxides of various metals measured by atomic absorption spectrophotometry. The data 
#### were collected to see if different sites contained pottery of different chemical 
#### compositions.
####
#### Number of cases: 26
#### Variable Names:
####   Al: Percentage of aluminum oxide in sample
####   Fe: Percentage of iron oxide in sample
####   Mg: Percentage of magnesium oxide in sample
####   Ca: Percentage of calcium oxide in sample
####   Na: Percentage of sodium oxide in sample
####   Site: Site where pottery sample was collected

## Load data.
dta <- read.delim("pottery.txt")

##
## Toy subset.
##

dta_toy <- dta[1:4, 4:5]
n <- 4

## Sample mean vector.
x_bar <- c(sum(dta_toy[, 1]) / n, sum(dta_toy[, 2]) / n)
x_bar <- c(mean(dta_toy[, 1]), mean(dta_toy[, 2]))
x_bar <- apply(dta_toy, 2, mean)
x_bar <- colMeans(dta_toy)
x_bar <- drop(t(dta_toy) %*% rep(1 / 4, 4))

## Sample variance / covariance matrix. See textbook and slides for comment on dividing 
## by n vs. n - 1.
S_n <- matrix(NA, nrow = 2, ncol = 2)
S_n[1, 1] <- sum((dta_toy$Ca - x_bar[1]) ^ 2) / n
S_n[2, 2] <- sum((dta_toy$Na - x_bar[2]) ^ 2) / n
S_n[1, 2] <- S_n[2, 1] <- sum((dta_toy$Ca - x_bar[1]) * (dta_toy$Na - x_bar[2])) / n

S_n <- var(dta_toy) * (n - 1) / n

## Sample correlation matrix.
R <- matrix(NA, nrow = 2, ncol = 2)
R[1, 1] <- R[2, 2] <- 1
R[1, 2] <- R[2, 1] <- sum((dta_toy$Ca - x_bar[1]) * (dta_toy$Na - x_bar[2])) / 
  (sqrt(sum((dta_toy$Ca - x_bar[1]) ^ 2)) * sqrt(sum((dta_toy$Na - x_bar[2]) ^ 2)))
  
R <- diag(rep(1, 2))
R[1, 2] <- R[2, 1] <- S_n[1, 2] / sqrt(S_n[1, 1] * S_n[2, 2])

R <- cor(dta_toy)

##
## Pairwise scatterplots on original data set.
##

pdf("figures/pottery_pairs.pdf", height = 5)
pairs(dta)
dev.off()

##
## Coplot.
##

pdf("figures/pottery_co.pdf", height = 5)
coplot(Ca ~ Na | Site, data = dta)
dev.off()
