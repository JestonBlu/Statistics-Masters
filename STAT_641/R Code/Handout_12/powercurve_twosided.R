#postscript("u:/meth1/psfiles/powercurve3.ps",height=9,horizontal=FALSE)



mu0=7
mu3=seq(-4,16,.05)
delta3a= 1.96+.5*(mu0-mu3)
delta3b= -1.96+.5*(mu0-mu3)
pow3= pnorm(delta3b) + 1-pnorm(delta3a)
par(lab=c(15,21,4))
plot(mu3,pow3,type="l",ylim=c(0,1),xlab=expression(mu),ylab="POWER")
text(6.1, .9,expression(H[o] ))
text(7.5, .9,expression(mu == 7))   
text(6.1,.85,expression(H[1]))   
text(7.5,.85,expression(   mu != 7))   
title("POWER FUNCTION")
out3=cbind(mu3,pow3)


#graphics.off()

