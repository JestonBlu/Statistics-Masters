#
# R CODE FOR DISPLAYING CORRELATION PLOTS FOR DATA
# (file is in longneck/meth1/sfiles/corrplot_vonneumann.R)

 y <- matrix(0,150,1)
 par(ask=TRUE) 
y <- scan("u:/meth1/Rfiles/corr.dat")
 #par(mfrow=c(2,1))
 #postscript("u:/meth1/psfiles/corr.ps",height=7,width=6,horizontal=F)
 n <- length(y)
 ytime1 <- ts(y,start=1,frequency=1) 
 plot(ytime1,type="b",ylab="Y_t",xlab="t",main="Y_t  vs  t")
 ymean <- mean(y)
 abline(h=ymean,lty=2)
 yt <- y[2:150]
 ytlag1 <- y[1:149]
 plot(ytlag1,yt,main="Lag Plot",ylab="Y_t",xlab="Y_t-1")

 acf(y,main="ACF for Time Series Data")


#Calculation of von Neumann Statistics

dif1 <- (yt-ytlag1)^2
num1 <- sum(dif1)
y2 <- (y-ymean)^2
den1 <- sum(y2) 
Q <- (num1/(n-1))/(den1/n) 
prd1 <- (yt-ymean)*(ytlag1-ymean)
prdsum1 <- sum(prd1)
rho1 <- prdsum1/den1
QP<- 2*n/(n-1)-qnorm(.95)*2/sqrt(n)
QN<- 2*n/(n-1)+qnorm(.95)*2/sqrt(n)
#graphics.off()
#Output from Corrplot.s:
#> QP
#> QN
#> rho1
#[1] 0.7746074
#> Q
#[1] 0.441409
