
#The following R code generates data from various specified distributions
#and the plots the empirical density function of the generated data.
# This program is ~longneck/meth1/distden.s
#------------------------------------------------------------------------------
x1  =  seq(-8,8,length=5000)
x2  =  seq(-4,4,length=5000)
x3  =  seq(0,15,length=5000)
x4  =  seq(0,100,length=5000)

y1  =  dt(x1,3)
y2  =  dnorm(x2,0,1)
y3  =  dweibull(x3,2,5)
y4  =  dlnorm(x4,3,1.5)

#postscript("distpdf.ps",height=8,horizontal=F)
par(mfrow=c(2,2))
plot(x1,y1,main="t PDF with df=3",ylab="PDF",type="l",ylim=c(0,.4),
     xlim=c(-8,8),lab=c(9,8,7),cex=.5)
plot(x2,y2,main="N(0,1) PDF",ylab="PDF",type="l",ylim=c(0,.5),
     xlim=c(-4,4),lab=c(9,10,7),cex=.5)
plot(x3,y3,main="Weibull(2,5) PDF",ylab="PDF",type="l",ylim=c(0,.2),
     xlim=c(0,16),lab=c(8,8,7),cex=.5)
plot(x4,y4,main="LogNormal(3,1.5) PDF",ylab="PDF",type="l",ylim=c(0,.05),
     xlim=c(0,100),lab=c(10,10,7),cex=.5)

#generates 250 observations from t with df=3, normal(0,1)
#Weibull with scale=5 and shape=2, 
#LogNormal with logmean=3 and logsd=1.5

t3  =  rt(250,3)
norm  =  rnorm(250,0,1)

wei  =  rweibull(250,2,5)
lnrm  = rlnorm(250,3,1.5)

#The following commands will generate the relative frequency histograms:

#postscript("disthist.ps",height=8,horizontal=F)

# par(mfrow=c(2,2))
# Histogram of 250 observations from t with df= 3:

 hist(t3,plot=TRUE,prob=T,
         main="Hist. of 250 Observ. from t, df=3",ylab="PDF",
         xlab="t with df = 3",cex=.50)

# Histogram of 250 observations from Normal:

 hist(norm,plot=TRUE,prob=T,
         main="Hist. of 250 Observ. from N(3,25)",ylab="PDF",
         xlab="Normal(0,1)",cex=.50)

# Histogram of 250 observations from Weibull:

 hist(wei,plot=TRUE,prob=T,
         main="Hist. of 250 Observ. from Weibull(2,5)",ylab="PDF",
         xlab="Weibull(2,5)",cex=.50)

# Histogram of 250 observations from LogNormal:

 hist(lnrm,plot=TRUE,prob=T,
         main="Hist. of 250 Observ. from LogNorm(3,1.5)",ylab="PDF",
         xlab="LogNorm(3,1.5)",cex=.50)

# graphics.off()


#The following commands will generate the nonparametric density estimates:

#postscript("distden.ps",height=8,horizontal=F)

# par(mfrow=c(2,2))

# Density of 250 observations from t with df= 3:


 plot(density(t3,bw="nrd"),type="l",
         main="Density Estimate of 250 Observ. \n from t, df=3",ylab="PDF",
         xlab="t with df = 3",cex=.50)

# Density Estimate of 250 observations from Normal:

 plot(density(norm,bw="nrd"),type="l", ylab="PDF",
         main="Density Estimate of 250 Observ. \n from Normal(0,1)",
         xlab="Normal(3,25)",cex=.50)

# Density Estimate of 250 observations from Weibull:

 plot(density(wei,bw="nrd"),type="l", ylab="PDF",
         main="Density Estimate of 250 Observ. \n from Weibull(2,5)",
         xlab="Weibull(2,5)",cex=.50)

# Density Estimate of 250 observations from LogNormal:

 plot(density(lnrm,bw="nrd"),type="l", ylab="PDF",
         main="Density Estimate of 250 Observ. \n from LogNorm(3,1.5)",
         xlab="LogNorm(3,1.5)",cex=.50)

#graphics.off()


#The following commands will yield nonparametric density estimates
#for the 250 data values from a N(0,1) distribution:

#postscript("normden.ps",height=8,horizontal=F)
par(mfrow=c(2,3))

# Density Estimate of 250 observations from Normal with Cosine Kernel:


 plot(density(norm,window='cosine'),type="l", 
         main="n=250 from N(0,1),Cos,bw=default",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=1),type="l",
         main="n=250 from N(0,1),Cos,bw=1",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=2),type="l",
         main="n=250 from N(0,1),Cos,bw=2",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=5),type="l", 
         main="n=250 from N(0,1),Cosine,bw=5",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=8),type="l", 
         main="n=250 from N(0,1),Cos,bw=8",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=10),type="l", 
         main="n=250 from N(0,1),Cos,bw=10",
         xlab="Normal(0,1)",ylab=" ",cex=.5)





# Density Estimate of 250 observations from Normal with Gaussian Kernel:



 plot(density(norm,window='g'),type="l", 
         main="n=250 from N(0,1),Gauss,b=default",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=1),type="l",
         main="n=250 from N(0,1),Gauss,b=1",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=2),type="l",
         main="n=250 from N(0,1),Gauss,b=2",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=5),type="l", 
         main="n=250 from N(0,1),Gauss,b=5",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=8),type="l", 
         main="n=250 from N(0,1),Gauss,b=8",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=10),type="l", 
         main="n=250 from N(0,1),Gauss,b=10",
         xlab="Normal(0,1)",ylab=" ",cex=.5)



# Density Estimate of 250 observations from Normal with Various Kernel:



 plot(density(norm),type="l", 
         main="n=250 from N(0,1),Default Settings",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='cosine',width=6),type="l",
         main="n=250 from N(0,1),Cosine,b=6",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='g',width=6),type="l",
         main="n=250 from N(0,1),Gauss,b=6",
         xlab="Normal(0,1)",ylab=" ",cex=.5)

 plot(density(norm,window='rectangular',width=6),type="l", 
         main="n=250 from N(0,1),Rectangular,b=6",
         xlab="Normal(0,1)",ylab=" ",cex=.5)


 plot(density(norm,window='triangular',width=6),type="l", 
         main="n=250 from N(0,1),Triangle,b=6",
         xlab="Normal(0,1)",ylab=" ",cex=.5)
#graphics.off()

