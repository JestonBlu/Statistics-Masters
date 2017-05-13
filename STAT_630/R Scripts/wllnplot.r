plot(c(-1,1),c(0,6),type="n",xlab="xbar",ylab="n",yaxt="n",main="Means from Normal Samples")
axis(2,at=c(1,2,3,4,5,6),labels=c("10","100","1000","10000","100000","1000000"))
temp=rep(0,100)
for (i in 1:100)temp[i]=mean(rnorm(10))
points(temp,rep(1,100))
for (i in 1:100)temp[i]=mean(rnorm(100))
points(temp,rep(2,100))
for (i in 1:100)temp[i]=mean(rnorm(1000))
points(temp,rep(3,100))
for (i in 1:100)temp[i]=mean(rnorm(10000))
points(temp,rep(4,100))
lines(c(0,0),c(0,6),col=2)

for (i in 1:100)temp[i]=mean(rnorm(100000))
points(temp,rep(5,100))
for (i in 1:100)temp[i]=mean(rnorm(1000000))
points(temp,rep(6,100))




plot(c(0.5,2),c(0,6),type="n",xlab="xbar",ylab="n",yaxt="n",main="Means from Exponential Samples")
axis(2,at=c(1,2,3,4,5,6),labels=c("10","100","1000","10000","100000","1000000"))
temp=rep(0,100)
for (i in 1:100)temp[i]=mean(rexp(10))
points(temp,rep(1,100))
for (i in 1:100)temp[i]=mean(rexp(100))
points(temp,rep(2,100))
for (i in 1:100)temp[i]=mean(rexp(1000))
points(temp,rep(3,100))
for (i in 1:100)temp[i]=mean(rexp(10000))
points(temp,rep(4,100))
lines(c(1,1),c(0,6),col=2)

for (i in 1:100)temp[i]=mean(rexp(100000))
points(temp,rep(5,100))

for (i in 1:100)temp[i]=mean(rexp(1000000))
points(temp,rep(6,100))


theta=0.2
plot(c(0,.6),c(0,6),type="n",xlab="thetahat",ylab="n",yaxt="n",main="Thetahat from Binomial")
axis(2,at=c(1,2,3,4,5,6),labels=c("10","100","1000","10000","100000","1000000"))
temp=rep(0,100)
for (i in 1:100)temp[i]=mean(rexp(10))
points(rbinom(100,10,theta)/10,rep(1,100)+0.4*(runif(100)-.5))
points(rbinom(100,100,theta)/100,rep(2,100)+0.4*(runif(100)-.5))
points(rbinom(100,1000,theta)/1000,rep(3,100)+0.4*(runif(100)-.5))
points(rbinom(100,10000,theta)/10000,rep(4,100)+0.4*(runif(100)-.5))
lines(c(theta,theta),c(0,6),col=2)
points(rbinom(100,100000,theta)/100000,rep(5,100))
points(rbinom(100,1000000,theta)/1000000,rep(6,100))


