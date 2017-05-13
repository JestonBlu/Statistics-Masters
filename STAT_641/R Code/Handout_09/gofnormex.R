
x = c(156,162,168,182,186,190,190,196,202,210,214,220,226,230,230,236,236,242,246,270)
n = 20
m = 200
a = 35
x = sort(x)
z = pnorm(x,m,a)   #computes F0(X(i))
i = seq(1,n,1)

# K-S Computations:

d1 = i/n - z
dp = max(d1)
d2 = z - (i - 1)/n
dm = max(d2)
ks = max(dp,dm)
KS = ks*(sqrt(n)+.12+0.11/sqrt(n))
#reject normality at 0.05 level if KS > 1.358

# Cramer-von Mises Computations:

wi = (z-(2*i-1)/(2*n))^2
s = sum(wi)
cvm = s + 1/(12*n)
CvM = (cvm-.4/n+.6/n**2)*(1+1/n)

#reject normality at 0.05 level if CvM > 0.461



# Anderson-Darling Computations:

a1i = (2*i-1)*log(z)
a2i = (2*n+1-2*i)*log(1-z)
s1 = sum(a1i)
s2 = sum(a2i)
AD = -n-(1/n)*(s1+s2)

#reject normality at 0.05 level if AD > 2.492

data = cbind(z,d1,d2,wi,a1i,a2i)

# Correlation Test

x = c(156,162,168,182,186,190,190,196,202,210,214,220,226,
      230,230,236,236,242,246,270)
y = sort(x)
n = length(x)
i = seq(1,n,1)
u = (i-.375)/(n+.25)
q = qnorm(u)
r = cor.test(q,y)

#postscript("u:/meth1/psfiles/gofnormex.ps",height=7,horizontal=F)

x2 = c(162,168,182,186,190,190,196,202,210,214,220,226,230,230,236,236,242,246,270,300,300)
x3 = c(162,168,182,186,190,190,196,202,210,214,220,226,230,230,236,236,242,246,270,300)
x1 = c(156,x3)
y1 = c(.05,.1,.15,.2,.25,.35,.35,.4,.45,.5,.55,.6,.65,.75,.75,.85,.85,.9,.95,1.0,1.0)
y2 = c(0,.05,.1,.15,.2,.25,.35,.35,.4,.45,.5,.55,.6,.65,.75,.75,.85,.85,.9,.95,1.0)
s = pnorm(x1,m,a)   #computes F0(X(i))
s = cbind(y1,y2,s)
matplot(x1,s,type="ppl",lty="solid",pch=c(3),col="black",ylim=c(0,1),xlab="Chicken Weight",xlim=c(150,300),lab=c(10,11,7),
ylab="Fo and Edf",cex=.75)
title("Empirical CDF vs Model CDF",cex=.55)
segments(x1,y1,x2,y1)
text(200,.7,"Normal cdf",adj=1)
arrows(201,.7,209.5,.6)
arrows(226,.60,226,.7712159)
text(240,.68,"Maximum Difference",adj=0)
segments(226,.68,240,.68)

#graphics.off()

