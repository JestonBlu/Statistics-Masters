#
# R CODE FOR Var(p)
# ----------------------------------------------------------------------------
 x0=c(.5,.5)
 y0=c(0,.25)
 x1=c(.8,.8)
 y1=c(0,.16)
 x2=c(.1,.1)
 y2=c(0,.09)

 p=seq(0,1,.001)
 varp = p*(1-p)

#postscript("u:/meth1/psfiles/varpplot.ps")

 plot(p,varp,type="l",main="Variance of p-hat",ylab="p(1-p)",xlab="p",cex=.9,
 lab=c(16,11,5))
 lines(x1,y1)
 lines(x2,y2)
 lines(x0,y0)


#graphics.off()


