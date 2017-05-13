x=nerve
B=10000
temp=rep(0,B)
xbar=mean(nerve)

for (i in 1:B)temp[i]=1/mean(rexp(799,rate=1/xbar))
mean(temp)
sd(temp)
quantile(temp,c(0.025,0.975))
1/mean(nerve)-1.96*sd(temp)
1/mean(nerve)+1.96*sd(temp)



for (i in 1:B)temp[i]=1/mean(sample(x,replace=TRUE))
mean(temp)
sd(temp)
quantile(temp,c(0.025,0.975))
1/mean(nerve)-1.96*sd(temp)
1/mean(nerve)+1.96*sd(temp)


for (i in 1:B)temp[i]=1/mean(rexp(length(x),1/mean(x)))

mean(temp)
sd(temp)
quantile(temp,c(0.025,0.975))
1/mean(nerve)-1.96*sd(temp)
1/mean(nerve)+1.96*sd(temp)

