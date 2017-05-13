# gofexp.R
# The following program computes the Kolmogorov-Smirnov, Cramer-von Mises,
# and Anderson-Darling Statistics for testing goodness ofthe fit of an 
# Exponential Distribution with unspecified parameter. 
# The statistics include the modification needed to use the Tables included 
# in the GOF handout.
# This example is based on a random sample of n=15 observations:
#
w  =  c(12,21,26,27,29,29,48,57,59,70,74,153,326,386,502)

n  =  length(w)
lam  =  mean(w)
w  =  sort(w)
z  =  1-exp(-w/lam)   #computes F0(X(i))
i  =  seq(1,n,1)

# K-S Computations:

d1  =  i/n - z
dp  =  max(d1)
d2  =  z - (i - 1)/n
dm  =  max(d2)
KS  =  max(dp,dm)
KS
MKS  =  (KS-.2/n)*(sqrt(n)+.26+.5/sqrt(n))
MKS

kstest = ks.test(w,"pexp",1/121.2)

kstest


# Cramer-von Mises Computations:

wi  =  (z-(2*i-1)/(2*n))^2
s  =  sum(wi)
cvm  =  s + 1/(12*n)
CvM  =  cvm*(1+.16/n)

CvM


# Anderson-Darling Computations:

a1i  =  (2*i-1)*log(z)
a2i  =  (2*n+1-2*i)*log(1-z)
s1  =  sum(a1i)
s2  =  sum(a2i)
AD  =  -n-(1/n)*(s1+s2)
MAD  =  AD*(1+.6/n)
MAD



# Exponential Probability Plot

#postscript("u:/meth1/psfiles/exp.ps",horizontal=T)

j  =  (i-.5)/n
quexp  =  -log(1-j)
plot(quexp,w,xlab="Exponential Quantiles",ylab="Sample Quantiles")
title("Exponential Probability Plot")
abline(lm(w~quexp))
#graphics.off()


