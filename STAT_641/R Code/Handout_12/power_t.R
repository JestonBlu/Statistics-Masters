
#postscript("u:/meth1/psfiles/power_t.ps",height=9,horizontal=FALSE)


n<- 10
df<- n-1
muo <- 84
sigma<- 1.4
mu<-  seq(83.0,86.0,.001)
delta<- sqrt(n)*(mu-muo)/sigma
power<- 1-pt(qt(.95,df),df,delta)
par(lab=c(10,20,4))
plot(mu,power,type="l",ylim=c(0,1),xlab=expression(mu),
ylab="POWER")
title("POWER FUNCTION FOR t - Test")
text(83.6, .92,expression(H[o]: mu<= 84))   
text(83.6, .85,expression(H[1]: mu > 84))   

output = cbind(mu,delta,power)

#graphics.off()
