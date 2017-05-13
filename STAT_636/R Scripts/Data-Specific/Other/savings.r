####
#### Intercountry life-cycle savings data. For each of 50 countries, we have data on 
#### five variables: savings ratio (total savings divided by disposable income), percent 
#### of population under 15, percent of population over 75, per-capita disposable income, 
#### and percent growth rate of disposable income. It is thought that the savings ratio 
#### can be explained by the other four variables. 
####
#### The data are in the 'LifeCycleSavings' dataset of the 'stats' package.
####

library(stats)

##
## Canonical correlation analysis, comparing the population variables with the non-
## population variables.
##

pop <- LifeCycleSavings[, 2:3]
oth <- LifeCycleSavings[, -(2:3)]

cc <- cancor(pop, oec)

## Reproduce canonical correlation.
dta <- as.matrix(LifeCycleSavings)
lcp_1 <- dta[, 2:3] %*% cc$xcoef[, 1]
lco_1 <- dta[, -(2:3)] %*% cc$ycoef[, 1]
cor(lcp_1, lco_1)