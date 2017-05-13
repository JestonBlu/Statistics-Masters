y= c(1600,4100,5700,7600,12400,12900,19300,21500,28000,36300,91400)
mhat= median(y)
n = length(y)
M= 20000
d= numeric(M)
for(i in 1:M)
{ d[i]= median(sample(y,replace=TRUE))
}
hist(d)
bootmean= mean(d)
bootstd= sd(d)
bootquant= quantile(d)
#par(mfrow=c(2,2))
#postscript("bootexample20000",height=8,horizontal=F)
probs= seq(0,1,.01)
Qd= quantile(d,probs)

         boxplot(d,main="Sample Median",
                    ylab="Median Life Lengths of Engine Part",plot=T)

          plot(probs,Qd,type="l",ylab="Q(u) for Median",xlab="u",
          xlim=c(0,1),lab=c(10,11,7),main="Empirical Quantile for Sample Median",cex=.75)
 
 
    
          plot(density(d),type="l",
          xlab="Median Life Lengths",ylab="PDF of Sample Median",main=
        "Empirical pdf for Sample Median",cex=.75)


          qqnorm(d,main="Normal Prob Plot of Sample Median",
                 xlab="normal quantiles",ylab="Sample Medians",
                 lab=c(7,7,7),cex=.75)
          qqline(d)
 
#graphics.off()

y = c(1600,4100,5700,7600,12400,12900,19300,21500,28000,36300,91400)
n = length(y)
K = 20
sam = matrix(0,K,n)
for(i in 1:K)
{
sam[i,] = sample(y,replace=TRUE)
}
