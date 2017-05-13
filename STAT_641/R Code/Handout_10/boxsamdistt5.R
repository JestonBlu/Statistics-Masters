r=1000

x =  rep(0,10)
m10 =  rep(0,r)
q10 =  rep(0,r)
sq = rep(0,r)
s10 = rep(0,r)
for (i in 1:r){
  x =  rt(10,5)
   m10[i] =  mean(x)
   q10[i] =  median(x)
   s10[i] =  sd(x)
}
    
x =  rep(0,25)
m25 =  rep(0,r)
q25 =  rep(0,r)
s2 = rep(0,r)
s25 = rep(0,r)
for (i in 1:r){
  x=  rt(25,5)
   m25[i] =  mean(x)
   q25[i] =  median(x)
   s25[i] =  sd(x)
}

x= rep(0,100)
m100 =  rep(0,r)
q100 =  rep(0,r)
sq = rep(0,r)
s100 = rep(0,r)
for (i in 1:r){
  x=  rt(100,5)
   m100[i] =  mean(x)
   q100[i] =  median(x)
  s100[i] =  sd(x)
}


outmean10 = c(mean(m10), mean(q10), mean(s10))
outmean25 = c(mean(m25), mean(q25), mean(s25))
outmean100 = c(mean(m100), mean(q100), mean(s100))
outmean = cbind(outmean10,outmean25,outmean100)
outmean
outsd10 = c(sd(m10), sd(q10), sd(s10))
outsd25 = c(sd(m25), sd(q25), sd(s25))
outsd100 = c(sd(m100), sd(q100), sd(s100))
outsd = cbind(outsd10,outsd25,outsd100)
outsd



#postscript("u:/meth1/psfiles/box1sampdistt5.ps",height=8,horizontal=F)

boxplot(m10,m25,m100,xlab="Sample Size",lab=c(10,10,7),
                  ylab="Sample Mean",
          main="Boxplots of 1000 Sample Means from t dist., df=5",
                  names=c("10","25","100"),cex=.75)  

 
#postscript("u:/meth1/psfiles/box2sampdistt5.ps",height=8,horizontal=F)
   
boxplot(q10,q25,q100,xlab="Sample Size",lab=c(10,10,7),
                  ylab="Sample Median",
          main="Boxplots of 1000 Sample Medians from t dist., df=5",
                  names=c("10","25","100"),cex=.75)   

  
#postscript("u:/meth1/psfiles/box3sampdistt5.ps",height=8,horizontal=F)

 
boxplot(s10,s25,s100,xlab="Sample Size",lab=c(10,10,7),
                  ylab="Sample Standard Deviation",
          main="Boxplots of 1000 of Sample Std Dev from t dist., df=5",
                  names=c("10","25","100"),cex=.75)      


#graphics.off()
