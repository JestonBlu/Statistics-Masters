#postscript("u:/meth1/psfiles/boxcox_plotsam.ps",height=8,horizontal=FALSE)


x = scan("u:/meth1/Rfiles/ozone1.DAT")
n = length(x)
y = abs(x)
yt0 = log(x)
s = sum(yt0)
varyt0 = var(yt0)
Lt0 = -1*s - .5*n*(log(2*pi*varyt0)-1)
th = 0
Lt = 0
t = -3.01
i = 0
while(t < 3)
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

plot(th,Lt,lab=c(30,50,7),main="Box-Cox Transformations",
           xlab=expression(theta),type="l",
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

#postscript("u:/meth1/psfiles/boxcox_ozoneraw.ps",height=8,horizontal=FALSE)

qqnorm(x,main="Normal Prob Plots of Samford Ozone Data",
                 xlab="normal quantiles",ylab="ozone concentration",cex=.65)
qqline(x)
legend(-2,200,"SW=.9288\
p-value=0")

y1= log(x)
y2= x^.23
y3= x^.5
s = shapiro.test(x)
s1 = shapiro.test(y1)
s2 = shapiro.test(y2)
s3 = shapiro.test(y3)

#postscript("u:/meth1/psfiles/boxcox_ozone1.ps",height=8,horizontal=FALSE)


qqnorm(y2,
       main="Normal Prob Plots of Samford Ozone Data with Ozone^.23",
                 xlab="normal quantiles",ylab=expression(Ozone^.23),cex=.65)
          qqline(y2)
legend(-2,3.5,"SW=.9872\
p-value=.2382")
 

#postscript("u:/meth1/psfiles/boxcox_ozone2.ps",height=8,horizontal=FALSE)


qqnorm(y1,main="Normal Prob Plots of Samford Ozone Data with Log(Ozone)",
                 xlab="normal quantiles",ylab="log(Ozone)",cex=.65)
          qqline(y1)
legend(-2,5.3,"SW=.9806\
p-value=.0501")

#postscript("u:/meth1/psfiles/boxcox_ozone3.ps",height=8,horizontal=FALSE)



qqnorm(y3,main="Normal Prob Plots of Samford Ozone Data with SQRT(Ozone)",
                 xlab="normal quantiles",ylab=expression(Ozone^.5),cex=.65)
          qqline(y3)
legend(-2,14.5,"SW=.9789\
p-value=.0501")

#graphics.off()
