#postscript("u:/meth1/psfiles/powercurve2.ps",height=9,horizontal=FALSE)


mu0 = 2
mu2 = seq(-2,14,.05)
delta2 = 1.28155 +.5*(mu0-mu2)
pow2 = 1-pnorm(delta2)
par(lab=c(11,21,4))
plot(mu2,pow2,type="l",ylim=c(0,1),xlab=expression(mu),ylab="POWER")
text(0.1,.91, expression(H[o]))   
text(1.4,.91, expression( mu <= 2))   
text(0.1,.85,expression(H[1]))   
text(1.4,.85,expression( mu > 2))   
title("POWER FUNCTION")
out = cbind(mu2,pow2)



#graphics.off()

