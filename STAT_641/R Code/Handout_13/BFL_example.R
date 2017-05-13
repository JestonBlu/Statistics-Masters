#postscript("u:/meth1/psfiles/bfl_expA1.ps",horizontal=FALSE)


y1=c(4.2,2.9,.2,25.7,6.3,7.2,2.3,9.9,5.3,6.5)
y2=c(.2,11.3,.3,17.1,51,10.1,.3,.6,7.9,7.2)
y3=c(7.2,6.4,9.9,3.5,10.6,10.8,10.6,8.4,6,11.9)
n1 = length(y1)
n2 = length(y2)
n3 = length(y3)
y = c(y1,y2,y3)
grp = c(rep(1,n1),rep(2,n2),rep(3,n3))
grp = as.factor(grp)

y1 = sort(y1)
y2 = sort(y2)
y3 = sort(y3)
n = length(y1)
i = seq(1,n,1)
ui = (i-.5)/n
z = qnorm(ui)
plot(z,y1,main="Normal Ref Plot for Additive 1",xlab="Standard Normal Quantiles",
ylab="Sample Quantiles")
par(lab=c(10,10,5))
abline(lm(y1~z))
sw=shapiro.test(y1)
sw
text(-0.95,25," Q(u) = 7.0 + 6.11 Qz(u)")
text(-1.15,23,"SW = 0.7424")
text(-1.1,21,"p-value = .0029")
lm(y1~z)

#graphics.off()

#postscript("u:/meth1/psfiles/bfl_expA2.ps",horizontal=FALSE)


plot(z,y2,main="Normal Ref Plot for Additive 2",xlab="Standard Normal Quantiles",
ylab="Sample Quantiles")
par(lab=c(10,10,5))
abline(lm(y2~z))
sw=shapiro.test(y2)
sw
text(-0.95,50," Q(u) = 10.6 + 12.75 Qz(u)")
text(-1.15,47,"SW = . 0.691")
text(-1.1,44,"p-value = .0007")
lm(y2~z)

#graphics.off()


#postscript("u:/meth1/psfiles/bfl_expA3.ps",horizontal=FALSE)

plot(z,y3,main="Normal Ref Plot for Additive 3",xlab="Standard Normal Quantiles",
ylab="Sample Quantiles")
par(lab=c(10,10,5))
abline(lm(y3~z))
sw=shapiro.test(y3)
sw
text(-0.95,11," Q(u) = 8.5 + 2.63 Qz(u)")
text(-1.15,10.5,"SW =  0.9306")
text(-1.1,10.0,"p-value = .4534")

lm(y3~z)

install.packages("car")
library(car)
leveneTest(y,grp)

#graphics.off()


