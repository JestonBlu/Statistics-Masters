
confood2 <- read.table("/Users/Elizabeth/Documents/TAMU/stat608/sp13/Notes/confood2.txt", header=TRUE)
attach(confood2)

library(car)
bc<-powerTransform(Price)
summary(bc)

#Plot without transformations:
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(Price,Sales,xlab="Price",ylab="Sales",pch=Promotion+16,col=Promotion+1)
legend(-0.3, 8.5,legend=c("No","Yes"),pch=16:17,col=1:2,title="Promotion")


#Scatterplot with transformations, promotions marked:
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(log(Price),log(Sales),xlab=expression(log(Price[t])),ylab=expression(log(Sales[t])),
pch=Promotion+16,col=Promotion+1)
legend(-0.3, 8.5,legend=c("No","Yes"),pch=16:17,col=1:2,title="Promotion")

m0 <- lm(log(Sales)~ log(Price))
summary(m0)

par(mfrow=c(2,2),cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(m0)

#Pattern plotting residuals against predictor:
StanRes0 <- rstandard(m0)
par(mfrow=c(1,1),cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(log(Price), StanRes0, ylab="Stzd Resids", pch=Promotion+16,col=Promotion+1)

#Pattern plotting residuals against predictor:
StanRes0 <- rstandard(m0)
par(mfrow=c(1,1),cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(Week, StanRes0, ylab="Stzd Resids", pch=Promotion+16,col=Promotion+1)

#Plot sales from this week against sales last week:
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(log(SalesLag1), log(Sales), xlab="Log Sales Last Week", ylab="Log Sales This Week", pch=Promotion+16, col=Promotion+1)







#ACF Plot:
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
acf(Sales)


#Time series of Sales
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(Week,log(Sales),type='o',ylab=expression(log(Sales[t])),xlab="Week, t",
pch=Promotion+2,col=Promotion+1)
legend(0, 8.5,legend=c("No","Yes"),pch=2:3,col=1:2,title="Promotion")
#type = "p" for points, "l" for lines, "o" for overplotted points and lines, ("b", "c") for (empty if "c") points joined by lines, "s" and "S" for stair steps and "h" for histogram-like vertical lines. Finally, "n" does not produce any points or lines.


#Time series of Price
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(Week,Price,type='o',ylab=expression(log(Price[t])),xlab="Week, t",
pch=Promotion+2,col=Promotion+1)
legend(0, 8.5,legend=c("No","Yes"),pch=2:3,col=1:2,title="Promotion")


#First, WRONG model ignoring autocorrelation:
m1 <- lm(log(Sales) ~ log(Price)+Promotion+Week, data=confood2)
StanRes1 <- rstandard(m1)
par(mfrow=c(2,2), cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
plot(log(Price),StanRes1,ylab="Standardized Residuals",xlab=expression(log(Price[t])))
plot(Week,StanRes1,ylab="Standardized Residuals",xlab="Week, t",type='o')
plot(Promotion,StanRes1,ylab="Standardized Residuals")
plot(m1$fitted.values,StanRes1,ylab="Standardized Residuals",xlab="Fitted Values")

#Notice the value of the Week parameter:  non-stationarity
summary(m1)  #About a 1.2% increase in sales each week.

#Check on the autocorrelation of the errors:
par(mfrow=c(1,2),cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
acf(m1$residuals, main="Series GLS Model 1 Residuals")
acf(m1$residuals, type='partial')
#The partial autocorrelation function is the ACF of the de-trended series; that is, it calculates the correlation for
#an AR(1) model, plots that at lag 1, then removes that correlation from the series.  Then the correlation at lag 2 is estimated
#and plotted, and so on.  The PACF is useful for determining the order of the AR model you want to fit.

#Durbin Watson Test for significant autocorrelation:
dwt1<-dwt(m1$residuals, max.lag=5)


#Let's fit the model using the correlation structure this time:
library(nlme)
m2 <- gls(log(Sales) ~ log(Price)+Promotion+Week, correlation=corARMA(form = ~Week, p=1), data=confood2, method="ML")
summary(m2)
intervals(m2)  #Finds confidence intervals for parameter estimates and correlation "phi" (rho).

library(car)
dwt2<-dwt(as.vector(m2$residuals), max.lag=5)


par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
acf(m2$residuals,main="Series GLS  Model 2 Residuals")


#Now let's transform to a model with iid errors:
#The old, WRONG model:
m1 <- lm(log(Sales) ~ log(Price)+Promotion+Week, data=confood2)
n<-length(Week)
rho <- 0.5504
x <- model.matrix(m1)
iden <- diag(n)  #Creates an identity matrix of the same #rows and columns as n.
Sigma <- rho^abs(row(iden)-col(iden))
St <- chol(Sigma)  #The Cholesky decomposition:  upper triangular
Sinv <- solve(t(St))
xstar <- Sinv %*% x
ystar <- Sinv %*% log(Sales)
m1t <- lm(ystar ~ xstar-1) 
summary(m1t)


#Plots of Ystar by Xstar:
par(mfrow=c(2,2), cex.axis=2,cex.lab=2, pch=19, mar=c(5.1,5.1,2,2))
plot(xstar[,1],ystar,xlab="Intercept*",ylab="log(Sales)*")
#identify(xstar[,1],ystar,Week)
plot(xstar[,2],ystar,xlab="log(Price)*",ylab="log(Sales)*")
#identify(xstar[,2],ystar,Week)
plot(xstar[,3],ystar,xlab="Promotion*",ylab="log(Sales)*")
#identify(xstar[,3],ystar,Week)
plot(xstar[,4],ystar,xlab="Week*",ylab="log(Sales)*")
#identify(xstar[,4],ystar,Week)


#ACF of transformed model:
StanRes1 <- rstandard(m1t)
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,4,2),lwd=2)
acf(StanRes1,main="Series Standardized LS Residuals Transformed Model")

#Residual plots:
par(mfrow=c(2,2),cex.axis=2,cex.lab=1.5, mar=c(4.1,5.1,2,1),lwd=2)
plot(xstar[,2],StanRes1,ylab="Stzd LS Residuals",xlab="log(Price)*")
plot(xstar[,4],StanRes1,ylab="Stzd LS Residuals",xlab="Week*",type='o')
#identify(xstar[,4],StanRes1,labels=Week,cex=0.75)
plot(xstar[,3],StanRes1,ylab="Stzd LS Residuals",xlab="Promotion*")
plot(m1t$fitted.values,StanRes1,ylab="Stzd LS Residuals",xlab="Fitted Values*")

#Week 30: Competitor had a sale, reducing our sales
#Week 38: We had a sale the week no one else did
#Diagnostic plots:
par(mfrow=c(2,2),cex.axis=2,cex.lab=1.5,lwd=2)
plot(m1t)
abline(v=2*4/length(Week),lty=2)

detach(confood2)





