means=rep(0,10000)
vars=rep(0,10000)
for (i in 1:10000){
x=rnorm(20)
means[i]=mean(x)
vars[i]=var(x)}
plot(means,vars)
cor(means,vars)
