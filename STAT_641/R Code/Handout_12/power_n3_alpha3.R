power<-matrix(scan(file="u:/meth1/Rfiles/powerplot.dat"),ncol=11,byrow=TRUE)
powern10<-cbind(power[,3],power[,6],power[,9])
powern18<-cbind(power[,4],power[,7],power[,10])
powern25<-cbind(power[,5],power[,8],power[,11])
powern05<-cbind(power[,3],power[,4],power[,5])
powern01<-cbind(power[,6],power[,7],power[,8])
powern001<-cbind(power[,9],power[,10],power[,11])

#postscript("u:/meth1/psfiles/power1.ps",height=7,horizontal=FALSE)


matplot(power[,2],powern05,type="l",ylim=c(0,1),xlab=expression(mu),
ylab="POWER",cex=.75,lty=c(1,3,5),col="black",lab=c(7,21,15))
text(83.3,.79,expression(H[o]: mu<=84))
text(83.3,.74,expression(H[1] :mu>  84))
title("POWER FUNCTION FOR ALPHA=.05\nN=10,18,25",cex=.5)
legend(83,1,lty=c(1,3,5),legend=c("10","18","25"),cex=.75)
abline("v"=85)
text(84.72,.93,"n=25")
text(85.19,.93,"n=18")
text(85.54,.93,"n=10")


#postscript("u:/meth1/psfiles/power2.ps",height=7,horizontal=FALSE)


matplot(power[,2],powern18,type="l",ylim=c(0,1),xlab=expression(mu),
ylab="POWER",cex=.75,lty=c(1,3,5),col="black",lab=c(7,21,15))
title("POWER FUNCTION FOR N=18\nALPHA=.001,.01,.05",cex=.5)
legend(83,1,lty=c(1,3,5),legend=c(".05",".01",".001"),cex=.75)
text(83.3,.79,expression(H[o]: mu<=84))
text(83.3,.74,expression(H[1] :mu>  84))
abline("v"=85)
text(84.74,.83,".05")
text(85.18,.83,".01")
text(85.48,.83,".001")



#graphics.off()
