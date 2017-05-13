x <- c(10,25,40)
y1 <- c(70.3,465.7,359.0)
y2 <- c(70.7,333.0,252.3)
y3 <- c(408.0,274.7,243.0)
y4 <- c(331.0,311.7,230.7)
y <-cbind(y1,y2,y3,y4)

postscript("u:/meth2/psfiles/shrimpprofiles.ps",horizontal=FALSE)
par(lab=c(3,15,4))
matplot(x,y,type="b",xlab="SALINITY LEVELS",ylab="MEAN WEIGHT GAIN PER SHRIMP (mg)",
        main="TRENDS IN WEIGHT GAIN FOR SALINITY LEVELS",cex=.99,col="black",
        ylim=c(0,600),lab=c(3,15,4),pch=c("#*@+"),xaxt="n")
axis(side=1,at=c(10,25,40),labels=c("10%","25%","40%"))
legend(10,600,pch=c("#*@+"),legend=c("T=25,D=80","T=25,D=160","T=35,D=80","T=35,D=160"))

graphics.off()

