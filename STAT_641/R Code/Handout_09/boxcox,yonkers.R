x = scan("u:/meth1/Rfiles/ozone2.DAT")
n = length(x)
y = abs(x)
ly = log(y)
s = sum(ly)
yt0 = log(x)
varyt0 = var(yt0)
Lt0 = -1*s - .5*n*(log(2*pi*varyt0)-1)
th = 0
Lt = 0
t = -2.01
i = 0
while(t < 2)
{t = t+.001
i = i+1
th[i] = t
yt = (x^t -1)/t
varyt = var(yt)
Lt[i] = (t-1)*s - .5*n*(log(2*pi*varyt)-1)
if(abs(th[i])<1.0e-10)Lt[i]<-Lt0
if(abs(th[i])<1.0e-10)th[i]<-0
}
# The following outputs the values of the likelihood and theta and yields
# the value of theta where likelihood is a maximum
out = cbind(th,Lt)
Ltmax= max(Lt)
imax= which(Lt==max(Lt))
thmax= th[imax]

#postscript("u:/meth1/psfiles/boxcox_yonkers.ps",horizontal=FALSE)

plot(th,Lt,main="Box-Cox Transformations, Yonkers Ozone",
           xlab=expression(theta),type="l",lab=c(30,40,10),
           ylab=expression(Lt(theta)))

#the following plots a 95\% c.i. for theta

cic = Ltmax-.5*qchisq(.95,1)  

del= .01
iLtci = which(abs(Lt-cic)<=del)
iLtciL= min(iLtci)
iLtciU= max(iLtci)
thLci= th[iLtciL]
thUci= th[iLtciU]
abline(h=cic)
abline(v=thLci)
abline(v=thUci)
abline(v=thmax)


#postscript("u:/meth1/psfiles/trans_yonkers1.ps",horizontal=FALSE)

qqnorm(x,main="Normal Prob Plots of Yonkers Ozone Data",
       lab=c(7,9,7),xlab="normal quantiles",ylab="ozone concentration",cex=.65)
qqline(x)
legend(-2,120,"SW=.9525\
p-value=.00006")

y2= x^.318
y3= x^.5
y5= x^.23
s = shapiro.test(x)
s2 = shapiro.test(y2)
s3 = shapiro.test(y3)
s5 = shapiro.test(y5)

#postscript("u:/meth1/psfiles/trans_yonkers2.ps",horizontal=FALSE)


qqnorm(y2,main="Normal Prob Plots of Yonkers Ozone Data with (Ozone)^.318",
        lab=c(7,9,7),xlab="normal quantiles",ylab=expression(Ozone^.318),cex=.65)
          qqline(y2)
legend(-2,4.5,"SW=.9882\
p-value=.243")


#postscript("u:/meth1/psfiles/trans_yonkers3.ps",horizontal=FALSE)



qqnorm(y3,main="Normal Prob Plots of Yonkers Ozone Data with SQRT(Ozone)",
      lab=c(7,9,7),xlab="normal quantiles",ylab=expression(Ozone^.5),cex=.65)
          qqline(y3)
legend(-2,11,"SW=.9852\
p-value=.1151")

#postscript("u:/meth1/psfiles/trans_yonkers4.ps",horizontal=FALSE)


qqnorm(y5,main="Normal Prob Plots of Yonkers Ozone Data with (Ozone)^.23",
     lab=c(7,9,7), xlab="normal quantiles",ylab=expression(Ozone^.23),cex=.65)
          qqline(y5)
legend(-2,2.9,"SW=.9875\
p-value=.2064")


#graphics.off()


