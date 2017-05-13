####
#### Original data are the words for the numbers one, ..., ten in 11 languages. These 
#### were converted into a matrix of concordance of first letters. So, the (i, j)th 
#### element equals the number of words with the same letter, comparing languages i and 
#### j.
####

dta <- matrix(0, nrow = 11, ncol = 11)
dta[, 1] <- c(10, 8, 8, 3, 4, 4, 4, 4, 3, 1, 1)
dta[-1, 2] <- c(10, 9, 5, 6, 4, 4, 4, 3, 2, 1)
dta[-(1:2), 3] <- c(10, 4, 5, 4, 5, 5, 4, 2, 1)
dta[-(1:3), 4] <- c(10, 5, 1, 1, 1, 0, 2, 1)
dta[-(1:4), 5] <- c(10, 3, 3, 3, 2, 1, 1)
dta[-(1:5), 6] <- c(10, 8, 9, 5, 0, 1)
dta[-(1:6), 7] <- c(10, 9, 7, 0, 1)
dta[-(1:7), 8] <- c(10, 6, 0, 1)
dta[-(1:8), 9] <- c(10, 0, 1)
dta[-(1:9), 10] <- c(10, 2)
dta[-(1:10), 11] <- 10

dta <- dta + t(dta)
diag(dta) <- 10

##
## Cluster analysis.
##

## Define distance matrix as in Example 12.4: Each entry is replaced by 10 minus its 
## value.
dd <- 10 - dta

pdf("figures/language.pdf", height = 5)
plot(hclust(as.dist(dd)), labels = c("E", "N", "Da", "Du", "G", "Fr", "Sp", "I", "P", 
  "H", "Fi"), xlab = "", sub = "")
dev.off()
