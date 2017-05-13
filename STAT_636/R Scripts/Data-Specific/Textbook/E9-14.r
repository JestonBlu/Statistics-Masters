####
#### Bone and skull measurements of white leghorn fowl. There are 276 chickens. For each, 
#### we have data on two head variables (skull length and breadth), two leg variables 
#### (femur and tibia length), and two wing variables (humerus and ulna length).
####

## Input correlations.
dta <- read.delim("E9-14.DAT", header = FALSE, sep = " ")[-7, c(3, 5, 7, 9, 11)]
dta <- cbind(dta, c(rep(NA, 5), 1))
colnames(dta) <- 1:6
dta[is.na(dta)] <- 0
dta <- dta + t(dta)
diag(dta) <- 1

