library(MASS)
soccer=cbind(0:9,c(10187,6923,3611,1592,608,280,107,33,9,11),c(225,293,224,114,41,15,9,1,2,0))
goals=c(rep(0,225),rep(1,293),rep(2,224),rep(3,114),rep(4,41),rep(5,15),rep(6,9),7,8,8) 
barplot(soccer[,3],space=0,names=soccer[,1],main="Soccer Goals",ylim=c(0,310))
for (i in 0:9)lines(c(i,i+1),rep(dpois(i,lambda=mean(goals))*sum(soccer[,3]),2),col=2)
soccnb=glm.nb(goals ~ 1,maxit=100)
nuhat=soccnb$theta
phat=nuhat/(nuhat+exp(coef(soccnb)[1]))
for (i in 0:9)lines(c(i,i+1),rep(dnbinom(i,nuhat,phat)*sum(soccer[,3]),2),col=3)
results1=cbind(0:9,soccer[,3],round(dpois(0:9,lambda=mean(goals))*length(goals),1),round(dnbinom(0:9,nuhat,phat)*sum(soccer[,3]),1))
readline()

passes=c(rep(0,10187),rep(1,6923),rep(2,3611),rep(3,1592),rep(4,608),rep(5,280),rep(6,107),rep(7,33),rep(8,9),rep(9,11))
barplot(soccer[,2],space=0,names=soccer[,1],main="Passing Movements in Soccer")
for (i in 0:9)lines(c(i,i+1),rep(dpois(i,lambda=mean(passes))*sum(soccer[,2]),2),col=2)
soccnb=glm.nb(passes ~ 1,maxit=100)
nuhat=soccnb$theta
phat=nuhat/(nuhat+exp(coef(soccnb)[1]))

for (i in 0:9)lines(c(i,i+1),rep(dnbinom(i,nuhat,phat)*sum(soccer[,2]),2),col=3)
results2=cbind(0:9,soccer[,2],round(dpois(0:9,lambda=mean(passes))*length(passes),1),round(dnbinom(0:9,nuhat,phat)*sum(soccer[,2]),1))

gofresults1=rbind(results1[1:6,2:4],c(sum(results1[7:10,2]),sum(results1[,2])-sum(results1[1:6,3]),sum(results1[,2])-sum(results1[1:6,4])))
poisgofstat=sum((gofresults1[,1]-gofresults1[,2])**2/gofresults1[,2])
negbingofstat=sum((gofresults1[,1]-gofresults1[,3])**2/gofresults1[,3])
