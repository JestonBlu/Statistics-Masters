x = c(3.52,4.23,3.92,2.22,2.30,2.54)  
y = c(3.92,4.83,4.68,2.86,2.99,3.14) 
postscript("u:/meth2/output/crabpowertrans.ps",height=8,horizontal=F)
reg.fit = lm(y~x)
summary(reg.fit)
z = .656+.98574*x
plot(x,y,type="p",main="Log(Sample St Dev) versus Log(Sample Mean)",
xlab="Log( Sample Mean)",ylab="Log(Sample St Dev)") 
matlines(x,z,type="l",main="Log(Sample St Dev) versus Log(Sample Mean)",
xlab="Log( Sample Mean)",ylab="Log(Sample St Dev)") 
legend(2.3,4.5,c("Fitted Line:","Log(S)=.656+.98574*Log(Mean)"),cex=.75)
graphics.off()


