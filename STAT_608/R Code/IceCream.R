#30 4-week periods

icecream <- read.csv("U:\\608\\Data\\icecream.csv", header=TRUE)
attach(icecream)
n<-dim(icecream)[1]
library(nlme)
library(car)


par(mfrow=c(2,2), cex.axis=2, cex.lab=2, mar=c(4, 5, 2, 1))
plot(date, IC, col=(Year+1), pch=(Year + 16), ylab="Consumption")
plot(income, IC, col=(Year+1), pch=(Year + 16), ylab="Consumption")
plot(priceInf, IC, col=(Year+1), pch=(Year + 16), ylab="Consumption")
plot(temp, IC, col=(Year+1), pch=(Year + 16), ylab="Consumption")

par(mfrow=c(1,2), cex.axis=2, cex.lab=2,  mar=c(4, 5, 4, 1), lwd=2, cex.main=2)
acf(IC, main="Consumption")
acf(temp, main="Temperature")

acf(IC, main="Consumption", type="partial")
acf(temp, main="Temperature", type="partial")  #Don't worry about the lag 2; we care about residuals!

par(mfrow=c(2,2), cex.axis=2, cex.lab=2,  mar=c(4, 5, 2, 1))
plot(date, temp, col=(Year + 1), pch=(Year + 16))
plot(date, income, col=(Year + 1), pch=(Year + 16))
plot(date, priceInf, col=(Year + 1), pch=(Year + 16))
plot(temp, priceInf, col=(Year + 1), pch=(Year + 16))

par(mfrow=c(1,2), cex.axis=2, cex.lab=2,  mar=c(4, 5, 2, 1))
plot(temp, income, col=(Year + 1), pch=(Year + 16))
plot(income, priceInf, col=(Year + 1), pch=(Year + 16))


m2<-lm(IC ~ date + temp + priceInf + income + Year)
#Run the transformation
m2g <- gls(IC ~ date + temp + priceInf + income + Year, correlation=corAR1(form = ~date), method="ML")
rho <- 0.3324567  
x <- model.matrix(m2)
iden <- diag(n)
Sigma <- rho^abs(row(iden)-col(iden))
sm <- chol(Sigma)
smi <- solve(t(sm))  #Not good programming practice!
xstar <- smi %*% x   #Don't do this!

xstar <- solve(t(sm), x)  #Do this instead: avoid taking inverses of matrices computationally.
ystar <- smi %*% IC
m2tls <- lm(ystar ~ xstar - 1)  #Remember to remove the intercept!
summary(m2tls)

#Diagnostic plots for the model:
StanRes2<- rstandard(m2tls)
par(mfrow=c(2,2), cex.axis=2, cex.lab=2, pch=19, mar=c(4, 5, 2, 1))
plot( date, StanRes2, col=(Year + 1), pch=(Year + 16))
plot(income, StanRes2, col=(Year + 1), pch=(Year + 16))
plot(priceInf, StanRes2, col=(Year + 1), pch=(Year + 16))
plot(temp, StanRes2, col=(Year + 1), pch=(Year + 16))

par(mfrow=c(2,2), cex.axis=2, cex.lab=2, pch=19, mar=c(4, 5, 2, 1))
plot(m2tls, col=(Year + 1))

m2tls <- lm(ystar ~ xstar[,1] + xstar[,2] + xstar[,3] + xstar[,4] + xstar[,5] - 1) 
mmps(m2tls)


#Try this model instead:

#Create an indicator variable for being the first observation:
ifirst<-rep(0,n)
ifirst[1]<-1

m3<-lm(IC ~ temp + I(temp^2) + Year + ifirst)
res3<-residuals(m3)
acf(res3)
#Correlation not significant, but is it important?

m3g <- gls(IC ~  temp + I(temp^2) + Year + ifirst, 
           correlation=corAR1(form = ~date), method="ML")
rho <-0.3272092  
x <- model.matrix(m3)
iden <- diag(n)
Sigma <- rho^abs(row(iden)-col(iden))
sm <- chol(Sigma)
xstar <- solve(t(sm), x)
ystar <- smi %*% IC
m3tls <- lm(ystar ~ xstar - 1)
summary(m3tls)


#Diagnostic plots for the model:
m3tls <- lm(ystar ~ xstar[,1] + xstar[,2] + xstar[,3] + xstar[,4] - 1) 
mmps(m3tls)


StanRes3 <- rstandard(m3tls)
par(mfrow=c(2,2), cex.axis=2, cex.lab=2, pch=19, mar=c(4, 5, 2, 1))
plot(date, StanRes3, col=(Year + 1), pch=(Year + 16))
plot(temp, StanRes3, col=(Year + 1), pch=(Year + 16))
plot(Year, StanRes3, col=(Year + 1), pch=(Year + 16))
plot(priceInf, StanRes3, col=(Year + 1), pch=(Year + 16))


par(mfrow=c(2,2), cex.axis=2, cex.lab=2, pch=19, mar=c(4, 5, 2, 1))
plot(m3tls, col=(Year + 1))





