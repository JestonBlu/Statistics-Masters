y = seq(0,1,.001)
D1 = dbeta(y,.5,.5)
D2 = dbeta(y,5,2)
D3 = dbeta(y,2,.5)
D4 = dbeta(y,1,1)

B = cbind(D1,D2,D3,D4)

#postscript("u:/meth1/psfiles/betapdf.ps",height=7,horizontal=FALSE)          


matplot(y,B,type="l",ylab="f(y)", xlab="y",lab=c(15,10,7),col="black",lwd=1.8,lty="solid",
ylim=c(0,10))
title("Beta Density Functions")
par(font=5)

text(.05,6,"a=0.5,b=0.5",adj=0)
arrows(.12,5.7,.02,4.5)

text(.3,2.5,"a=1,b=1",adj=0)
arrows(.36,2.3,.3,1.1)

text(.7,4,"a=5,b=2",adj=0)
arrows(.77,3.8,.69,2.3)

text(.8,6,"a=2,b=0.5",adj=0)
arrows(.87,5.8,.96,4.5)


#graphics.off()





