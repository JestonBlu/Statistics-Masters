# ~longneck/meth1/gofexp.s
# The following program computes the Kolmogorov-Smirnov, Cramer-von Mises,
# and Anderson-Darling Statistics for testing goodness of the fit of an 
# Exponential Distribution with unspecified parameter. 
# This example is involves the time to failure of n=12 light bulbs:
#
w <- c(3,5,7,18,43,85,
91,98,100,130,230,487)
n <- 12
lam <- mean(w) 
w <- sort(w)
z <- 1-exp(-w/lam)   #computes F0(X(i))
i <- seq(1,n,1)

# K-S Computations:
d1 <- i/n - z
dp <- max(d1) 
d2 <- z - (i - 1)/n
dm <- max(d2)
KS <- max(dp,dm)

KS <- (KS-.2/n)*(sqrt(n)+.26+.5/sqrt(n)) 

# Cramer-von Mises Computations:
wi <- (z-(2*i-1)/(2*n))^2
s <- sum(wi)
cvm <- s + 1/(12*n) 
CvM <- cvm*(1+.16/n) 

# Anderson-Darling Computations:

a1i <- (2*i-1)*log(z)
a2i <- (2*n+1-2*i)*log(1-z)
s1 <- sum(a1i)
s2 <- sum(a2i)
AD <- -n-(1/n)*(s1+s2) 

AD <- AD*(1+.6/n) 

# Exponential Probability Plot

#postscript("gofexp,bs.ps",height=8,horizontal=F)

w <- sort(w)
j <- (i-.5)/n
quexp <- -log(1-j)
expQ1 <- -log(1-.25)
expQ3 <- -log(1-.75)
yQ1<- quantile(w,.25)
yQ3<- quantile(w,.75)
S<- (yQ3-yQ1)/(expQ3-expQ1)
I<- -S*expQ1+yQ1
plot(quexp,w,xlab="Standard Exponential Quantiles",ylab="Sample Quantiles",
     xlim=c(0,4.0),lab=c(15,12,7))
title("Exponential Probability Plot \n Times between Failure for Air Conditioners",cex=.8)
#abline(I,S)
reg <- lm(w~quexp)
#summary(reg)
abline(-29.94,142.09)

#graphics.off()

