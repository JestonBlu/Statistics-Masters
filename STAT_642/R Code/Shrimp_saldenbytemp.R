ms2580 <- c(70.3,465.7,359.0)
ms25160 <- c(70.7,333.0,252.3)
ms3580 <- c(408,274.7,243)
ms35160 <- c(331,311.7,230.7)
ms25 <- cbind(ms2580,ms25160)
ms35 <- cbind(ms3580,ms35160)
s <- c(10,25,40)

postscript("u:/meth2/psfiles/shrimpsaldent25.ps",horizontal=FALSE)

matplot(s,ms25,type="b",xlab="salinity Level %",ylab="Weight Gain (mg)",
        main="Profile Plot of Salinity by Density with Temp=25",cex=.75,
col="black",
        ylim=c(0,500),xlim=c(10,40),lab=c(3,10,5),pch=c("#*"),xaxt="n")
axis(side=1,at=c(10,25,40),labels=c(10,25,40))
legend(10,500,pch=c("#*"),legend=c("DEN=80","DEN=160"))

postscript("u:/meth2/psfiles/shrimpsaldent35.ps",horizontal=FALSE)


matplot(s,ms35,type="b",xlab="salinity Level %",ylab="Weight Gain (mg)",
        main="Profile Plot of Salinity by Density with Temp=35",cex=.75,
col="black",
        ylim=c(0,500),xlim=c(10,40),lab=c(3,10,5),pch=c("#*"),xaxt="n")
axis(side=1,at=c(10,25,40),labels=c(10,25,40))
legend(10,500,pch=c("#*"),legend=c("DEN=80","DEN=160"))

graphics.off()

