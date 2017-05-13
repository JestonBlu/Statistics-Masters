# name: jblubau1_hw04_script.r
# path: ~/Projects/learning/Statistics/STAT_604/Homework
# created by: Joseph Blubaugh
# created on: 6 Sept 2016
# purpose: Homework 04
# last ran:
Sys.time()


# 1) House Keeping
ls()
rm(list = ls())

# 2) Direct output to a file
sink(file <- "/home/jeston/Projects/learning/Statistics/STAT_604/Homework/jblubau1_hw04_output.txt", split = TRUE)

# 3) Sequence 4 - 100 by 4
(x1 <- seq(4, 100, 4))
mode(x1)

# 4) Create numeric vector .8 - 40 by .8
(x2 <- seq(.8, 40, .8))
mode(x2)

# 5) Create a 5 column matrix
matrix(x2, ncol = 5, byrow = FALSE)

# 6) combine two vectors: since x1 and x2 are multiples of each other
# x1 is recycled to fill in the empty spaces next to x2
(x3 <- cbind(x1, x2))
mode(x3)

# 7) combine vectors as rows
(x4 <- rbind(x1, x2))

# 8)
## a) show contents
ls()
## b) load data set
load("/home/jeston/Projects/learning/Statistics/STAT_604/Data/HW04.RData")
## c) show contents
ls()

# 9) Display structure of loaded object
str(Oklahoma)

# 10) Display summary of object
summary(Oklahoma)

# 11) Compute average of HSTotal
mean(na.omit(Oklahoma$HSTotal))

# 12) Perform logical test
is.na(Oklahoma$HSTotal) == FALSE & 
  Oklahoma$HSTotal < mean(na.omit(Oklahoma$HSTotal))

# 13) Return only School, City, HSTotal
Oklahoma[is.na(Oklahoma$HSTotal) == FALSE & 
  Oklahoma$HSTotal < mean(na.omit(Oklahoma$HSTotal)), 
                          c(1,2,15)]

# 14) Use apply to summarise average class size for grade 7 - 12
apply(X = Oklahoma[, 6:11], MARGIN = 2, FUN = "mean", na.rm = TRUE)

# 15) Use apply to create average class size
Oklahoma$AvgClassSize <- apply(Oklahoma[, 6:11], MARGIN = 1, FUN = "mean", na.rm = TRUE)

# 16) Display first 25 rows
head(Oklahoma, 25)

# 17) Stop output
sink()
