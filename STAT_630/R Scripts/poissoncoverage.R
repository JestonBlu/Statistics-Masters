coverage.binom=function(n,p,N,alpha)
{
sumwald=0
sumscore=0
sumscorebetter=0
sumwaldbetter=0
sumbothcorrect=0
sumbothwrong=0




for (i in 1:N){
y=rbinom(1,n,p)
phat=y/n
z=qnorm(1-(alpha/2))
lower=phat-z*sqrt(phat*(1-phat)/n)
upper=phat+z*sqrt(phat*(1-phat)/n)
term=z*sqrt(phat*(1-phat)/n+z^2/(4*n*n))
lower1=(phat+z^2/(2*n)-term)/(1+z^2/n)
upper1=(phat+z^2/(2*n)+term)/(1+z^2/n)



waldcorrect=(lower<p)*(p<upper)
scorecorrect=(lower1<p)*(p<upper1)


sumwald=sumwald+waldcorrect
sumscore=sumscore+scorecorrect


sumbothcorrect=sumbothcorrect+waldcorrect*scorecorrect
sumbothwrong=sumbothwrong+(1-waldcorrect)*(1-scorecorrect)
sumscorebetter=sumscorebetter+scorecorrect*(1-waldcorrect)
sumwaldbetter=sumwaldbetter+(1-scorecorrect)*waldcorrect




summary=matrix(c(sumbothcorrect,sumwaldbetter,sumscorebetter,sumbothwrong),2,2)


rownames(summary)=c("scoreyes","scoreno")
colnames(summary)=c("waldyes","waldno")


}


return(list(sumwald=sumwald,sumscore=sumscore,summary=summary))
}
