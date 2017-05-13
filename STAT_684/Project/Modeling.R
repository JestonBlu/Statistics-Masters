
library(ggplot2)
library(plyr)
library(reshape2)
library(Hmisc)
library(multcomp)
library(lsmeans)
library(lme4)
library(pander)

rm(list = ls())

###################################################
## Data Prep

## Read in Data
flies = read.csv("STAT_684/Project/hornflydata.csv")
flies$trt = factor(capitalize(as.character(flies$trt)))
flies$cty = factor(capitalize(as.character(flies$cty)))
flies$week = flies$week + 2
flies$flies = flies$flies + 1

## Ensure all of the treatments have been applied
flies = subset(flies, week > 6 & week < 21)

## Create weekly average by county, treatment, week
avg = ddply(flies, .(cty, trt, week), summarise, flies = mean(flies))
avg$trt = relevel(avg$trt, ref = 'Control')

## Split control from the treatments
control = subset(avg, trt == 'Control')
colnames(control)[4] = 'ctrl_cnt'
control = control[, -2]
avg = subset(avg, trt != 'Control')

## Join control value back as a separate column
avg = join(x = avg, y = control, type = 'inner')
avg = na.omit(avg)
avg$diff = with(avg, ctrl_cnt - flies)


## Remove Suspicious Data
modeling = subset(avg, ! cty %in% c('Anderson', 'Camp', 'Palapinto'))

modeling$cty = factor(modeling$cty)
modeling$trt = factor(modeling$trt)
modeling$trt = relevel(modeling$trt, ref = "Vetgun")
row.names(modeling) = 1:nrow(modeling)

pander(head(modeling), caption = "Sample of Dataset")

ggplot(modeling) + 
  geom_dotplot(aes(x = diff), binwidth = 15) +
  geom_vline(xintercept = 0, lty = 2) +
  scale_x_continuous("Control - Treatment") +
  scale_y_continuous("Density") +
  facet_wrap(~trt) +
  ggtitle("Dotplot of Treatment vs Control") +
  theme(plot.title = element_text(hjust = .5))




## Redo model after elminating some data
modeling = subset(avg, ! cty %in% c('Anderson', 'Camp', 'Palapinto') & !trt %in% c('Vetgun', 'Pythonstrips'))

modeling$cty = factor(modeling$cty)
modeling$trt = factor(modeling$trt)
modeling$trt = relevel(modeling$trt, ref = "Magnum")

## Modeling
my.tran = make.tran(type = "genlog", 150)
mdl1 = with(my.tran, lmer(linkfun(diff) ~ trt + (week|cty), data = modeling))

## Anova since diff is transformed
anova(mdl1)

## Summary of Fixed Effects (transformed)
print(summary(mdl1), corr = FALSE)

## Plot --> good looking residuals
plot(mdl1, main = "Fitted Values vs Residuals", xlab = "Fitted Values", ylab = "Residuals")


## LS Means --> back transformed
x = lsmeans::lsmeans(mdl1, specs = "trt", type = "response")
cat("LSMeans for Treatments (Back Transformed)")
summary(x)
plot(x, main = "LSMeans for Treatment")


hp1 = glht(model = mdl1, linfct = mcp(trt = "Tukey"))
summary(hp1)

lmerTest::rand(mdl1)

ggplot(modeling, aes(x = week, y = diff)) + 
  geom_point() +
  facet_wrap(~cty)


