library(ggplot2)
library(plyr)
library(reshape2)
library(Hmisc)
library(multcomp)
library(lsmeans)
library(nlme)

rm(list = ls())

## Read in Data
flies = read.csv("hornflydata.csv")
flies$trt = factor(capitalize(as.character(flies$trt)))
flies$cty = factor(capitalize(as.character(flies$cty)))
flies$week = flies$week + 2
flies$flies = flies$flies + 1
flies = subset(flies, week > 4)

## Remove VetGun
flies = subset(flies, trt != 'Vetgun')

## Create weekly average by county, treatment, week
avg = ddply(flies, .(cty, trt, week), summarise, flies = mean(flies))
avg$trt = relevel(avg$trt, ref = 'Control')
avg.plots = avg

## Split control from the treatments
control = subset(avg.plots, trt == 'Control')
colnames(control)[4] = 'ctrl_cnt'
control = control[, -2]
avg.plots = subset(avg.plots, trt != 'Control')

## Join control value back as a separate column
avg.plots = join(x = avg.plots, y = control, type = 'inner')

## Remove any observations that are missing a control or treatment value
avg.plots = na.omit(avg.plots)
rm(control)

## Create weekly difference between the control and treatment
avg.plots$diff = with(avg.plots, flies - ctrl_cnt)
avg.plots$trt = relevel(avg.plots$trt, ref = 'Control')


##########################################################
## Plot 1
g1 = ggplot(avg.plots, aes(x = week, y = diff, color = trt)) +
  geom_hline(yintercept = 0, lty = 2, color = "gray50") + 
  geom_line(size = .6) +
  geom_point(size = .9) +
  scale_color_discrete("Treatment") +
  scale_x_continuous("Week") +
  scale_y_continuous("Treatment vs Control") +
  facet_wrap(~cty) +
  ggtitle("Average Difference in Treatment vs Control by County") +
  theme(plot.title = element_text(hjust = .5))


diff = avg.plots

## Exploratory Modeling
mdl1 = lme((log(flies) - log(ctrl_cnt)) ~ trt + poly(week, 2), random = ~ 1|cty, data = avg.plots)
mdl1 = lm(diff ~ trt + cty, data = avg.plots)
mdl2 = glht(aov(mdl1, data = avg.plots), linfct = mcp(trt = 'Tukey', cty = 'Tukey'), alternative = "less")
mdl3 = lsmeans(mdl1, specs = "trt")


ddply(avg.plots, .(cty, trt), summarise, 
      min = min(diff), 
      mean = mean(diff), 
      median = median(diff), 
      max = max(diff))

g2 = ggplot(avg.plots, aes(x = cty, y = diff)) +
  geom_hline(yintercept = 0, lty = 2, color = "gray50") +
  geom_boxplot(width = .7, color = "gray") +
  geom_point(position = position_jitter(width = .1), alpha = .4, pch = 21) +
  scale_x_discrete("County") +
  scale_y_continuous("Treatment vs Control") +
  facet_grid(.~trt, scale = "free", space = "free") +
  ggtitle("Average Difference in Treatment vs Control by County") +
  theme(plot.title = element_text(hjust = .5))

ggsave(filename = "Plots/Blubaugh_Plot2.pdf", plot = g2, 
       width = 18, height = 7)

############################################################
## Detrend Data

library(pracma)

diff.detrend = ddply(diff, .(cty, trt), summarise, 
                     trt.detrend = detrend(flies, tt = "linear"),
                     ctl.detrend = detrend(ctrl_cnt, tt = "linear"))
diff.detrend$week = diff$week

ggplot(diff.detrend, aes(x = week, y = trt.detrend, color = trt)) +
  geom_hline(yintercept = 0, lty = 2, color = "gray50") + 
  geom_line() +
  geom_line(aes(y = ctl.detrend), color = "black") +
  geom_point() +
  scale_color_discrete("Treatment") +
  scale_x_continuous("Week Number") +
  scale_y_continuous("Diff(Control, Treatment)") +
  facet_wrap(~cty) +
  ggtitle("Treatments vs Control by County") +
  theme(plot.title = element_text(hjust = .5))























