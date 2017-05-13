temp=matrix(rep(0,20000),10000,2)
for (i in 1:10000){
x=rgamma(100,2,4)
sigma2hat=var(x)*(100-1)/100
xbar=mean(x)
temp[i,1]=xbar/sigma2hat
temp[i,2]=xbar^2/sigma2hat}
plot(temp[,1],temp[,2],main="Scatter Plot of Estimate",xlab="lambdahat",ylab="alphahat")
hist(temp[,1],main="Histogram of Moment Estimates of Lambda")
hist(temp[,2],main="Histogram of Moment Estimates of Alpha")
mean(temp[,1])
mean(temp[,2])
var(temp[,1])
var(temp[,2])
