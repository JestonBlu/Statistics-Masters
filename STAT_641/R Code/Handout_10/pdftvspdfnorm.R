x = seq(-6,6,length=500)
x1 =seq(.3,6,length=250)
x1=c(seq(-6,0,length=250),x1)
z = dnorm(x)
t = dt(x,5)
w=dweibull(x1,.61,.62)
y = cbind(z,t,w)

#postscript("u:/meth1/psfiles/pdf_norm_t_Weibull.ps",height=8,horizontal=F)

matplot(x,y,type="l",col="black",main="pdf of t(5),   Weibull(.61,.62),   N(0,1)",lwd=1.5,
ylab="f(x)",xlab="x",lty=c(1,2,3))
#legend(-5,0.68,c("N(0,1)", "t(5)", "Weibull(.61,.62)"),lty=c(1,2,3),lwd=1.5)
arrows(2,.58,.19,.5)
text(2,.6,"Weibull(.61,.62)")
arrows(2,.38,0.5,.35)
text(2,.4,"Normal(0,1)")
arrows(3.5,.11,2.9,.02)
text(3.5,.12,"t(5)")




#graphics.off()
 



