#x <- scan("/home/stat/longneck/meth1/ozone1.DAT")

postscript("fig5,21.ps",height=8,horizontal=F)

par(mfrow=c(2,2))
x <- c(0.01,0.99)
y <- c(0.0001,0.9999)
y1 <- c(0.0001,0.9999)
bounds.norm <- qnorm(x)
bounds.gam1  <- 3*qgamma(y,.5)+4
bounds.gam2  <- qgamma(y1,4)
bounds.t    <- qt(x,3)
points.norm <- seq(bounds.norm[1],bounds.norm[2],length=5000)
points.gam1 <- seq(bounds.gam1[1],bounds.gam1[2],length=5000)
points.gam2 <- seq(bounds.gam2[1],bounds.gam2[2],length=5000)
points.t <- seq(bounds.t[1],bounds.t[2],length=5000)
pdf.norm <- dnorm(points.norm)
pdf.gam1  <- dgamma(points.gam1,.5)
pdf.gam2  <- dgamma(points.gam2,4)
pdf.t    <- dt(points.t,3)
pdf.gam1 <- 3*pdf.gam1+4

plot(points.norm,pdf.norm,xlab="x, value of random variable ", ylab="Normal Density",main="Fig. 5.21(a) Density of the
Standard Normal Distribution",cex=.5)
plot(points.t,pdf.t,xlab="x, value of random variable ", ylab="Density",main="Fig. 5.21(b) Density of a
Heavy-Tailed Distribution",cex=.5)
plot(points.gam2,pdf.gam2,xlab="x, value of random variable ", ylab="Density",main="Fig. 5.21(c) Density of a
Lightly Skewed Distribution",cex=.5)
plot(points.gam1,pdf.gam1,xlab="x, value of random variable ", ylab="Density",main="Fig. 5.21(d) Density of a
Highly Skewed Distribution",cex=.5)


graphics.off()
