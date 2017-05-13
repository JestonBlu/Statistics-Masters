####
#### A randomized clinical trial investigating the effect of an anti-epileptic drug. In 
#### this clinical trial, 59 patients suffering from epilepsy were randomized to groups 
#### receiving either the anti-epileptic drug Progabide or a placebo in addition to 
#### standard chemotherapy. The numbers of seizures suffered in each of four, two-week 
#### periods were recorded for each patient along with a baseline seizure count for the 
#### 8 weeks prior to being randomized to treatment and age. The main question of 
#### interest is whether taking progabide reduced the number of epileptic seizures 
#### compared with placebo.
####

data("epilepsy", package = "HSAUR2")

## Convert to wide format.
epi_wide <- reshape(epilepsy, v.names = "seizure.rate", timevar = "period", 
  idvar = "subject", direction = "wide")
n <- nrow(epi_wide)

## Growth curves for random subset of 4 treatment and 4 control individuals.
set.seed(101)

ii_co <- sample((1:n)[epi_wide$treatment == "placebo"], 4, replace = FALSE)
ii_tx <- sample((1:n)[epi_wide$treatment == "Progabide"], 4, replace = FALSE)

pdf("figures/epilepsy_growth.pdf", height = 5)
plot(c(1, 4), range(epi_wide[c(ii_co, ii_tx), 5:8]), xlab = "Period", ylab = "Seizures", 
  xaxt = "n", type = "n")
axis(1, at = 1:4)
for(i in 1:4) {
  lines(1:4, epi_wide[ii_co[i], 5:8], col = "blue", lwd = 1.5)
  lines(1:4, epi_wide[ii_tx[i], 5:8], col = "red", lwd = 1.5)
}
legend(3, 100, legend = c("Placebo", "Progabide"), lwd = rep(1.5, 2), 
  col = c("blue", "red"), bty = "n")
dev.off()