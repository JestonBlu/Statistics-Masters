#The following R program generates data from various specified distributions
#and the plots the generated data various various reference distributions.
# This program is refdist.R in Files/Rcode on Dostat 
#-------------------------------------------------------------------------------

#generates 250 observations from t with df=9 and 30, Cauchy, Gamma with 
#shape=2 and scale=1/3, weibull with scale=4 and shape=2, uniform on (-2,5):
#Note in the gamma function, gamma(a,b): a=shape, b=1/scale
#Note in the weibull function, weibull(a,b): a=shape, b=(scale)^(1/a)

n=250

i= seq(1:n)
u= (i-.5)/n
z   = sort(qnorm(u))

t9  = sort(rt(n,9))
t30 = sort(rt(n,30))
cau = sort(rcauchy(n,5,50))
wei = sort(rweibull(n,2,16))
gam = sort(rgamma(n,2,3))
uni = sort(runif(n,-2,5))

#The following commands will generate various normal probability plots:

#postscript("u:/meth1/psfiles/refdistt9vn.ps",height=8,horizontal=FALSE)


# Empirical Quantile of t with df=9  vs Normal Quantiles:

plot(z,t9,xlab="Normal Quantile",ylab="Empirical Quantile",
       lab=c(7,8,7),main="Empirical Quantiles for t with 9 df vs Normal",
cex=.5)
abline(lm(t9~z))
 
# Empirical t with df= 9-Quantile vs t with df=9 Quantiles:

#postscript("u:/meth1/psfiles/refdistt9vt.ps",height=8,horizontal=FALSE)


t=sort(qt(u,9))
plot(t,t9, xlab="t (df=9) Quantile",
     ylab="Empirical Quantile",lab=c(6,9,7), main=
"Empir. Quant. of t Data vs t-Quantiles",cex=.25)
abline(lm(t9~t))



#postscript("u:/meth1/psfiles/refdistt30vn.ps",height=8,horizontal=FALSE)



# empirical t with df=30-Quantile vs normal quantiles:

plot(z,t30,xlab="Normal Quantile",ylab="Empirical Quantile",
       lab=c(7,8,7),main="Empirical Quantiles of t with 30 df vs Normal",cex=.5)
abline(lm(t30~z))

# empirical Cauchy-Quantile vs Normal Quantiles:

#postscript("u:/meth1/psfiles/refdistcvn.ps",height=8,horizontal=FALSE)


plot(z,cau,xlab="Normal Quantile",ylab="Empirical Quantile",
main="Empirical Quantiles of Cauchy(5,50) vs Normal",cex=.5)
abline(lm(cau~z))



#postscript("u:/meth1/psfiles/refdistwvn.ps",height=8,horizontal=FALSE)



# empirical Weibull-Quantile vs Normal Quantiles:

plot(z,wei,xlab="Normal Quantile",ylab="Empirical Quantile",
main="Empirical Quantiles of Weibull(2,16) vs Normal",cex=.5)
abline(lm(wei~z))

# empirical Weibull-Quantile vs Weibull-Quantiles:

#postscript("u:/meth1/psfiles/refdistwvw.ps",height=8,horizontal=FALSE)


x= sort(qweibull(u,2,16))
plot(x,wei, xlab="Weibull Quantile",ylab="Empirical Quantile",main=
"Empir. Quant. of Weibull Data vs Weibull-Quantiles",cex=.5)
abline(lm(wei~x))



#postscript("u:/meth1/psfiles/refdistgvn.ps",height=8,horizontal=FALSE)

# empirical Gamma-Quantile vs Normal Quantiles:

plot(z,gam,xlab="Normal Quantile",ylab="Empirical Quantile",
main="Empirical Quantiles of Gamma(2,1/3) vs Normal",cex=.5)
abline(lm(gam~z))


# empirical Uniform-Quantile vs Normal Quantiles:

#postscript("u:/meth1/psfiles/refdistuvn.ps",height=8,horizontal=FALSE)


plot(z,uni,xlab="Normal Quantile",ylab="Empirical Quantile",
lab=c(7,7,7), main="Empirical Quantiles of Uniform(-2,5) vs Normal",cex=.5)
abline(lm(uni~z))

#graphics.off()








