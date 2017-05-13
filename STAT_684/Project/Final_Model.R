rm(list = ls())

library(ggplot2)
library(plyr)
library(reshape2)
library(Hmisc)
library(multcomp)
library(nlme)
library(pander)
library(lsmeans)

## Data Prep and Plots
flies = read.csv("hornflydata.csv")
flies$trt = factor(capitalize(as.character(flies$trt)))
flies$cty = factor(capitalize(as.character(flies$cty)))

# ggplot(flies, aes(x = week, y = flies, color = trt)) +
#   stat_summary(fun.y = "mean", geom = "point") +
#   stat_summary(fun.y = "mean", geom = "line") +
#   scale_x_continuous("Week") +
#   scale_y_continuous("Fly Count") +
#   scale_color_discrete("Treatment") +
#   ggtitle("Horn Fly Count by Treatment and County") +
#   facet_wrap(~cty) +
#   theme(plot.title = element_text(hjust = .5))

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
modeling = subset(avg, !cty %in% c('Anderson', 'Camp', 'Palopinto', 'Cherokee') & 
                    !trt %in% c('Vetgun', 'Pythonstrips'))

modeling$cty = factor(modeling$cty)
modeling$trt = factor(modeling$trt)
modeling$trt = relevel(modeling$trt, ref = "Magnum")
row.names(modeling) = 1:nrow(modeling)

x = modeling
colnames(x) = c("County", "Treatment", "Week", "Treatment Count", 
                "Control Count", "Difference")
pander(head(x), caption = "Sample of Final Dataset")


x = ddply(modeling, .(trt), summarise, mean = mean(diff), cty = length(unique(cty)))
colnames(x) = c("Treatment", "Mean", "Counties")
x = arrange(x, desc(Mean))
pander(x, caption = "Mean Difference in Count vs Control")

x = ddply(modeling, .(trt, cty), summarise, mean = round(mean(diff), 1))
colnames(x) = c("Treatment", "County", "Mean")
x = dcast(x, County ~ Treatment, fill = '')
pander(x, caption = "Mean Difference in Count by Treatment and County")


ggplot(modeling, aes(x = week, y = diff, color = trt)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  scale_x_continuous("Week") +
  scale_y_continuous("Mean Difference") +
  scale_color_discrete("Treatment") +
  facet_wrap(~cty) +
  ggtitle("Mean Difference in Control vs Treatment Count") +
  theme(plot.title = element_text(hjust = .5))


ggplot(modeling, aes(x = week, y = diff)) +
  geom_point() +
  geom_smooth(method = "lm") +
  scale_x_continuous("Week") +
  scale_y_continuous("Mean Difference") +
  scale_color_discrete("Treatment") +
  ggtitle("Mean Difference in Control vs Treatment Count") +
  theme(plot.title = element_text(hjust = .5))





#################################################################################
## Main Model: 
## Random Effect: Week within County (Int and Slope)
mdl = lme(log(diff + 150) ~ trt, random = list(~week|cty),
          correlation = corAR1(), data = modeling)

## Random Effect: Week within County (Int and Slope)
##                Treatment (Int)
mdl2 = lme(log(diff + 150) ~ trt, random = list(~week|cty, ~1|trt),
           correlation = corAR1(), data = modeling)

## Random Effect: Week within County (Int and Slope)
##                Week within Treatment (Int and Slope)
mdl3 = lme(log(diff + 150) ~ trt, random = list(~week|cty, ~week|trt),
           correlation = corAR1(), data = modeling)

## Compare the 3 models
anova(mdl, mdl2, mdl3)

## Model1 Appears the best

## Summary of Fixed Effects (transformed)
summary(mdl)

## LS Means --> back transformed
#x = lsmeans(mdl, specs = "trt")
x = data.frame(
  Treatment = c("Xp820", "Gardstar", "Magnum", "Optimizer", "Python", "Warrior"),
  LSMean = exp(c(5.660619, 5.867127, 5.587565, 5.885592, 5.753406, 5.781614))-150,
  SE = c(.09275768, .08300011, .10123983, .06774405, .07458511, .14733735)
)
x$SE = with(x, LSMean * SE)
x$DF = rep(9, 6)
x$Lower.CL = with(x, LSMean - qt(p = .975, df = 9) * SE)
x$Upper.CL = with(x, LSMean + qt(p = .975, df = 9) * SE)

pander(x)

cat("Variance Components\n")
VarCorr(mdl)


cat("LSMeans for Treatments (Back Transformed)")
x = arrange(x, LSMean)
pander(x)
ggplot(x, aes(x = reorder(Treatment, -LSMean))) +
  geom_point(aes(y = LSMean)) +
  geom_errorbar(aes(ymin = Lower.CL, ymax = Upper.CL)) +
  coord_flip() +
  scale_x_discrete("Treatment") +
  ggtitle("LSMeans for Treatment (Back Tranformed)") +
  theme(plot.title = element_text(hjust = .5))

hp1 = glht(model = mdl, linfct = mcp(trt = "Tukey"))
summary(hp1)

plot(mdl, main = "Fitted Values vs Residuals", xlab = "Fitted Values", 
     ylab = "Residuals")
plot(mdl, log(diff + 150) ~ fitted(.) | trt, abline = c(0,1), 
     main = "Fitted Values vs Actual Values",
     xlab = "Fitted", ylab = "Actual")
plot(mdl, trt ~ resid(.), ylab = "Treatment", 
     main = "Box Plot of Residuals by Treatment")