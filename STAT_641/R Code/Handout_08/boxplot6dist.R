
#The following R code generates data from various specified distributions
#and then plots the box plots from these distributions
#-------------------------------------------------------------------------------

#generates 250 observations from t with df=5 and 30, Cauchy, Gamma with 
#scale=1/3 and shape=2, weibull with scale=4 and shape=2, uniform on (-2,5):
nor = rnorm(1000,0,1)
t2  = rt(1000,2)
t30 = rt(1000,30)
cau = rcauchy(1000,0,1)
gam = rgamma(1000,2,3)
wei = rweibull(1000,2,4)
uni = runif(1000,-2,5)
left = -rchisq(1000,2)
#The following commands will generate various box plots:

#postscript("u:/meth1/psfiles/boxplotsp1.ps",height=8,horizontal=FALSE)
#par(mfrow=c(2,2))

# Box plot of N(0,1)  :

boxplot(nor)
title("Box Plot of Normal(0,1) Data",cex=.75)

# Box plot of t with df=2  :

boxplot(t2)
title("Box Plot t with df=2 Data",cex=.75)

# Box plot of t with df=30  :

boxplot(t30)
title("Box Plot t with df=30 Data",cex=.75)

# Box Plot of  Cauchy:

boxplot(cau)
title("Box Plot of Data from Cauchy(5,50)",cex=.75)

#postscript("u:/meth1/psfiles/boxplotsp2.ps",height=8,horizontal=FALSE)
#par(mfrow=c(2,2))


# Box plot of  Gamma:

boxplot(gam)
title("Box Plot of Data from Gamma(2,1/3)",cex=.75)

# Box Plot of Data from -Chisquared  :

boxplot(left)
title("Box Plot of Data from Left Skewed Distribution",cex=.75)



# Box plot of  Weibull:

boxplot(wei)
title("Box Plot of Data from Weibull(2,16)",cex=.75)


# Box plot of  Uniform:

boxplot(uni)
title("Box Plot of Data from Uniform(-2,5)",cex=.75)

#graphics.off()








