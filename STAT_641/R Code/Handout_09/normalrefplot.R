#Normal Reference Distribution Plot for Weight of Chickens Example:

x = c(156,162,168,182,186,190,190,196,202,210,214,220,226,
       230,230,236,236,242,246,270)
n = length(x)
x = sort(x)
i = seq(1:n)
u = (i-.5)/n
z = qnorm(u)
 
#postscript("refdist,chicken.ps",height=8,horizontal=F)
 


plot(z,x,datax=F,plot=T,xlab="Normal Quantile",ylab="Empirical Quantile",
       lab=c(7,8,7),
       main="Normal Reference Distribution Plot\n Chicken Weight Example",
       cex=.95)
abline(lm(x~z))

#graphics.off()
