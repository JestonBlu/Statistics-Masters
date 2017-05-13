
#postscript("u:/meth1/psfiles/powercurve1.ps",height=9,horizontal=FALSE)



mu0=8
mu1=seq(-2,12,.05)
delta1=-1.96+.5*(mu0-mu1)
pow1=pnorm(delta1)
par(lab=c(11,21,4))
plot(mu1,pow1,type="l",ylim=c(0,1),xlab=expression(mu),ylab="POWER")
text(6.1,.91, expression(H[o]))   
text(7.1,.91, expression( mu >=   8))   
text(6.1,.85,expression(H[1]))   
text(7.1,.85,expression( mu < 8))   
title("POWER FUNCTION")
out = cbind(mu1,pow1)


#graphics.off()
