x=rchisq(1000000,4)
y=x*40

#postscript("u:/meth1/psfiles/SignTest.ps",horizontal=F)

plot(density(y),xlim=c(0,460),ylab="f(y)",xlab="x",main="Population pdf")
m=median(y)
abline(v=m)

#graphics.off()