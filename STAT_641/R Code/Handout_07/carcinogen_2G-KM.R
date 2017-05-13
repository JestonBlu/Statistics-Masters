
library(survival)
T = c( 143,164,188,188,190,192,206,209,213,216,
       220,227,230,234,246,265,304,216,244,
       142,156,163,198,205,232,232,233,233,233,
       233,239,240,261,280,280,296,296,323,204,
       344) 
ST = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,
       1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0)
G = c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
      2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)

out = cbind(T,ST,G)
Surv(T, ST)

carcin <- survfit(Surv(T, ST) ~ G)
summary(carcin)
print(carcin, print.rmean=TRUE,rmean="individual")



#postscript("u:/meth1/psfiles/carcin_surv.ps",height=8,horizontal=F)

plot(carcin,ylab="Survival Function",xlab="Time to Death",
main="Cancer Treatment - Estimated S(t)",lty=1:2 )
legend(25,.8,c("Group 1","Group 2"),lty=1:2,lwd=2)

#graphics.off()


