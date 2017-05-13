
#The following R code plots a Gamma Ref plot 
#-------------------------------------------------------------------------------

#postscript("u:/meth1/psfiles/gammarefplot.ps",height=6,horizontal=FALSE)

x = rgamma(100,2.3,1/4.5)

y = sort(x)
n = length(y)
i = 1:n
ui = (i-.5)/n
QG = qgamma(ui,2.3,1/4.5)
plot(QG,y,abline(c(0,1)),
       main="Gamma Reference Plot",cex=.75,lab=c(7,11,7),
       xlab="Q(u) for Gamma",
       ylab="Sample Quantile  Q(u)")
#text(7,25.0,expression(hat(Q)(u) == .14 + .9445*Q(u[i])))
abline(h=0)


#graphics.off()


