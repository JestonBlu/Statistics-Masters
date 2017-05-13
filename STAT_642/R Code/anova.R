install.packages("lsmeans")
install.packages("ggplot2")
library(lsmeans)
library(ggplot2)

# specify the treatments as a "stacked" data set
treatment = as.factor(c(rep("COMM", 3), rep("VAC", 3), rep("MIXED", 4), rep("CO2", 5)))

# specify the counts as a "stacked" data set
counts = c(7.66, 6.98, 7.80,5.26, 5.44, 5.80,7.41, 7.33, 7.04, 7.59,3.51, 2.91, 3.66, 2.87, 3.04)

# create a data frame of the treatments and counts
data = data.frame(T=treatment, TCOUNT=counts)

# produce a linear model of the counts as a function of treatment
model <- lm(TCOUNT ~ T, data=data)
summary(model)

# produce the AOV table
A = aov(model)
summary(A)

# produce plot of lsmeans with 95% C.I. on Population Means
lsmeans(model, "T")
T.LSmeans <- lsmeans(model, "T")
df.TLSmeans <- as.data.frame(summary(T.LSmeans))
limits <- aes(ymax = lsmean - qt(p=0.05/2, df=df)*SE, ymin = lsmean + qt(p=0.05/2, df=df) * SE)
qplot(data=df.TLSmeans, x=T, y=lsmean) + geom_errorbar(limits)

