 n=10
mu=0.
temp1=temp2=temp3=rep(0,10000)
for (i in 1:10000){
x=rnorm(n)+mu
tstat=mean(x)/(sd(x)/sqrt(n))
temp1[i]=1-pt(tstat,n-1)
temp2[i]=pt(tstat,n-1)
temp3[i]=2*(1-pt(abs(tstat),n-1))
}
hist(temp1,main="p-value for right-tailed test")

hist(temp2,main="p-value for left-tailed test")

hist(temp3,main="p-value for two-tailed test")
