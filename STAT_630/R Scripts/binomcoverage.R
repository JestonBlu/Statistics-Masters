coverage.binom=function(n,p,N,alpha)
{
sumwald=0
sumscore=0
sumac=0
sumscorebetter=0
sumwaldbetter=0
sumbothcorrect=0
sumbothwrong=0

sumacbetterw=0
sumwaldbetterac=0
sumwaldaccorrect=0
sumwaldacwrong=0

sumacbetters=0
sumscorebetterac=0
sumscoreaccorrect=0
sumscoreacwrong=0


for (i in 1:N){
y=rbinom(1,n,p)
phat=y/n
z=qnorm(1-(alpha/2))
lower=phat-z*sqrt(phat*(1-phat)/n)
upper=phat+z*sqrt(phat*(1-phat)/n)
term=z*sqrt(phat*(1-phat)/n+z^2/(4*n*n))
lower1=(phat+z^2/(2*n)-term)/(1+z^2/n)
upper1=(phat+z^2/(2*n)+term)/(1+z^2/n)
nac=n+z^2
phatac=(y+z^2/2)/nac
lowerac=phatac-z*sqrt(phatac*(1-phatac)/nac)
upperac=phatac+z*sqrt(phatac*(1-phatac)/nac)


waldcorrect=(lower<p)*(p<upper)
scorecorrect=(lower1<p)*(p<upper1)
accorrect=(lowerac<p)*(p<upperac)


sumwald=sumwald+waldcorrect
sumscore=sumscore+scorecorrect
sumac=sumac+accorrect

sumbothcorrect=sumbothcorrect+waldcorrect*scorecorrect
sumbothwrong=sumbothwrong+(1-waldcorrect)*(1-scorecorrect)
sumscorebetter=sumscorebetter+scorecorrect*(1-waldcorrect)
sumwaldbetter=sumwaldbetter+(1-scorecorrect)*waldcorrect

sumwaldaccorrect=sumwaldaccorrect+waldcorrect*accorrect
sumwaldacwrong=sumwaldacwrong+(1-waldcorrect)*(1-accorrect)
sumacbetterw=sumacbetterw+accorrect*(1-waldcorrect)
sumwaldbetterac=sumwaldbetterac+(1-accorrect)*waldcorrect

sumscoreaccorrect=sumscoreaccorrect+scorecorrect*accorrect
sumscoreacwrong=sumscoreacwrong+(1-scorecorrect)*(1-accorrect)
sumacbetters=sumacbetters+accorrect*(1-scorecorrect)
sumscorebetterac=sumscorebetterac+(1-accorrect)*scorecorrect



summary=matrix(c(sumbothcorrect,sumwaldbetter,sumscorebetter,sumbothwrong),2,2)
summarywaldac=matrix(c(sumwaldaccorrect,sumwaldbetterac,sumacbetterw,sumwaldacwrong),2,2)
summaryscoreac=matrix(c(sumscoreaccorrect,sumscorebetterac,sumacbetters,sumscoreacwrong),2,2)



rownames(summary)=c("scoreyes","scoreno")
colnames(summary)=c("waldyes","waldno")

rownames(summarywaldac)=c("acyes","acno")
colnames(summarywaldac)=c("waldyes","waldno")

rownames(summaryscoreac)=c("acyes","acno")
colnames(summaryscoreac)=c("scoreyes","scoreno")
}


return(list(sumwald=sumwald,sumscore=sumscore,sumac=sumac,summary=summary,summarywaldac=summarywaldac,summaryscoreac=summaryscoreac))
}
