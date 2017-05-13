# name: jblubau1_hw06_script.r
# path: ~/Projects/learning/Statistics/STAT_604/Homework
# created by: Joseph Blubaugh
# created on: 24 Sept 2016
# purpose: Homework 06
# last ran:
Sys.time()

# 1) Clean the workspace
ls(); rm(list = ls())

# 2) Load workspace from HW04
load(file = "/home/jeston/Projects/learning/Statistics/STAT_604/Data/HW04.RData")
ls()

# 3) Output to pdf
pdf(file = "/home/jeston/Projects/learning/Statistics/STAT_604/Homework/jblubau1_hw06_graph.pdf")

# 4) Create histogram of Pupi/Teacher ratio
## a) Default histogram
hist(Oklahoma$PTRatio, freq = FALSE, xlab = "Pupils/Teacher", main = "Pupil/Teacher Ratios in Oklahoma Schools")
## b) Vector for breaks in increments of 5
brks = seq(from = 0, to = 155, by = 5)
## c) Histogram with custom breaks
hist(Oklahoma$PTRatio, breaks = brks, freq = FALSE,
     xlab = "Pupils/Teacher", main = "Pupil/Teacher Ratios in Oklahoma Schools")

# 5) Add maroon density line
lines(density(na.omit(Oklahoma$PTRatio), bw = 5), col = "maroon")

# 6) Add vertical line
abline(v = mean(na.omit(Oklahoma$PTRatio)), col = 7)

# 7) Scatterplot of Teacher to PTRatio
plot(x = Oklahoma$Teachers, y = Oklahoma$PTRatio, pch = 3, col = "purple", xlim = c(0, 140),
     xlab = "Teachers", ylab = "Pupil/Teacher Ratio")

# 8) Add a fitted line
abline(lm(PTRatio ~ Teachers, data = Oklahoma), col = "#FF9900")
summary(lm(PTRatio ~ Teachers, data = Oklahoma))

# 9) Imbed the systemdate time
text(x = 100, y = 150, labels = Sys.time())

# 10) Make boxplots
boxplot(x = Oklahoma[, 6:11], names = 7:12, col = "lightgreen", range = 0,
        xlab = "Grades", ylab = "Students", main = "Tulsa County vs State")

# 11) Add diamond points
pts = colMeans(x = subset(Oklahoma, County == "TULSA COUNTY")[, 6:11], na.rm = TRUE)
points(pts, pch = 23, col = "red", bg = "darkgreen", cex = 2)

## close graphics device
dev.off()
