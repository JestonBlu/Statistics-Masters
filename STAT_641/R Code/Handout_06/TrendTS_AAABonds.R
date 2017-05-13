
Y = c(9.62,9.64,9.80,9.79,9.57,9.10,8.93,8.96,9.01,8.92,8.89,8.96,
8.99,9.22,9.37,9.46,9.47,9.26,9.24,9.41,9.56,9.53,9.30,9.05,
9.04,8.83,8.93,8.86,8.86,9.01,9.00,8.75,8.61,8.55,8.48,8.31,
8.20,8.29,8.35,8.33,8.28,8.22,8.07,7.95,7.92,7.99,8.10,7.98,
7.91,7.71,7.58,7.46,7.43,7.33,7.17,6.85,6.66,6.67,6.93,6.90)

n=length(Y)
i=1:n
i2=i*i
i3=i*i*i
mY=matrix(0,12)
sY=matrix(0,12)
R=matrix(0,60)
mR=matrix(0,12)
sR=matrix(0,12)



lm(Y~i+i2+i3)
pY = 9.3456353 +   0.0090330*i   -0.0008767*i2  
pY3 = 9.467 -   0.01388*i   +0.00005455*i2  -.00001018*i3

for(j in 1:n)
{
R[j] = Y[j]-  pY3[j]

}

YM = cbind(Y,pY3)

matplot(i,YM,lab=c(40,10,4),ylab="AAA Bond Yields",
ylim=c(6.5,10),xlim=c(1,60),col="black",type="l",
main="Monthly Average of AAA Bond Yields",xlab="Months")
legend(40.5,9.5,c("Yield","Yield Trend"),lty=c(1,2))
abline(v=c("12","24","36","48"))

text(5,6.5,"1989")
text(17,6.5,"1990")
text(29,6.5,"1991")
text(41,6.5,"1992")
text(53,6.5,"1993")

plot(i,R,lab=c(40,10,4),ylab="Detrended AAA Bond Yields",
ylim=c(-1,1),xlim=c(1,60),
main="Detrended Monthly Average of AAA Bond Yields",xlab="Months",type="l")
abline(v=c("12","24","36","48"))
abline(h=0)

acf = acf(Y)
acf


#graphics.off()

w=12
for(m in 1:12)
{
for(k in 1:5)
{
mY[m] =mean(c(Y[m], Y[m+w],Y[m+2*w],Y[m+3*w],Y[m+4*w]))
sY[m] =  sd(c(Y[m], Y[m+w],Y[m+2*w],Y[m+3*w],Y[m+4*w]))
mR[m] =mean(c(R[m], R[m+w],R[m+2*w],R[m+3*w],R[m+4*w]))
sR[m] =  sd(c(R[m], R[m+w],R[m+2*w],R[m+3*w],R[m+4*w]))
}
}

m = 1:12
outY = cbind(m,mY,sY)
outR = cbind(m,mR,sR)
round(outY,3)
round(outR,3)

acf(R)
acfR = acf(R)
j=1:60
plot(j,R)
abline(h=0)





