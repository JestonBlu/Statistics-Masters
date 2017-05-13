
#postscript("u:/meth1/psfiles/boxplot100.ps",height=8,horizontal=F)

wei = rweibull(100,0.7,4)

par(lab=c(10,4,4))
boxplot(wei,ylim=c(-3,35),horizontal=TRUE)
title("Box Plot of 100 Data Values",cex=.75)

#graphics.off()


