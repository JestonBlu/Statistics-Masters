####
#### Size measurements for Cophosaurus texanus lizards. For each of 25 lizards, we have 
#### data on three variables: mass in grams, snout-vent length (SVL) in millimeters, and 
#### hind limb span (HLS) in millimeters. We also know the gender of each lizard.
####

## Input data.
dta_0 <- read.delim("T1-3.DAT", header = FALSE, sep = " ")
n <- nrow(dta_0)

dta <- matrix(NA, nrow = n, ncol = 3)
colnames(dta) <- c("Mass", "SVL", "HLS")
for(i in 1:n) 
  dta[i, ] <- as.numeric(dta_0[i, !is.na(dta_0[i, ])])

