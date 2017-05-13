####
#### Census data by tract on five socioeconomic variables in the Madison, WI area. The 
#### variables are total population (thousands), professional degree (percent), employed 
#### age over 16 (percent), government employment (percent), median home value ($100k). 
####

## Load data.
dta <- read.delim("T8-5.DAT", header = FALSE)
colnames(dta) <- c("tot_pop", "prof_deg", "emp", "gov_emp", "med_home")

## PCA.
pca <- princomp(dta)
pca$loadings
summary(pca)

## Factor analysis.
fa <- factanal(dta, 3)

