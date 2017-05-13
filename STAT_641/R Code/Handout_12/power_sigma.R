n =  10
df =  n-1
sigo  =  1.5
sig =   seq(0,5,.001)
power =  pchisq((sigo**2)*qchisq(.025,df)/(sig**2),df)+1-
        pchisq((sigo**2)*qchisq(.975,df)/(sig**2),df)

#postscript("u:/meth1/psfiles/power_sig.ps",height=8,horizontal=F)

par(lab=c(15,20,4))
plot(sig,power,type="l",ylim=c(0,1),xlab="Sigma",
ylab="POWER")
title("POWER Function For 2-Sided Test of Sigma")
text(3.5,.55,"n=10, alpha=.05")
abline(h=0)
text(3.3,.7, expression(H[o]))   
text(3.7,.7, expression( sigma == 1.5))   
text(3.3,.64,expression(H[1]))   
text(3.7,.64,expression( sigma != 1.5)) 
 
#graphics.off()


