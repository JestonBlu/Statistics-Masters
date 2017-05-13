c1 = c(.5,1,1.75,2)
c2 = exp(.5*c1^2)
c3 = sqrt(exp(2*c1^2)-exp(c1^2))  
y = seq(0,10,.01)
X1 = dlnorm(y,1.133,0.6039)
X2 = dlnorm(y,1.649,2.161)
X3 = dlnorm(y,4.624,20.875)
X4 = dlnorm(y,7.389,54.0958)

Y1 = dlnorm(y,0,.5)
Y2 = dlnorm(y,0,.75)
Y3 = dlnorm(y,0,1)
Y4 = dlnorm(y,0,1.5)
Y5 = dlnorm(y,0,2)
Y6 = dlnorm(y,0,2.25)

Y = cbind(Y1,Y3,Y4,Y5)

#postscript("u:/meth1/psfiles/lognormal.ps",horizontal=FALSE)


matplot(y,Y,type="l",xlim=c(0,3.2),ylim=c(0,1.6),
ylab="f(y)", xlab="y",lab=c(20,10,5),lty="solid",lwd=1.8,col="black",
main="LogNormal Density Functions")

text(2.4,1.4,substitute(mu=="0"))
text(.11,1.25,substitute(sigma=="2"),adj=0)
text(.24,.77,substitute(sigma=="1.5"),adj=0)
text(.85,.51,substitute(sigma=="1"),adj=0)
text(1.6,.39,substitute(sigma==".5"),adj=0)


#graphics.off()
 

