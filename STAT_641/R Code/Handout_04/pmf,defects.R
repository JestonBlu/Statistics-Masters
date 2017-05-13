#R code for plotting a bar chart for discrete data and
# a line chart for the estimated pmf
#postscript("u:/meth1/Rfiles/defectsp1.ps",height=8,horizontal=F)

defects.f <- c(402,321,151,82,20,10,5,3,3,2,1)
defects.n <- c("0","1","2","3","4","5","6","7","8","9","10")
barplot(prop.table(defects.f),names=defects.n,ylab="Proportions",xlab="Number of Defects",beside=F)
title("Histogram for Defectives Data")
defects <- c(0,1,2,3,4,5,6,7,8,9,10)

#postscript("u:/meth1/Rfiles/defectsp2.ps",height=8,horizontal=F)

zero<-c(0,0,0,0,0,0,0,0,0,0,0)
plot(defects,defects.f/1000,ylab="Sample Estimator of pmf, 
f(y)",xlab="Number of Defects",lab=c(11,17,4))
segments(defects,zero,defects,defects.f/1000)
title("Sample Estimator of pmf for Defectives Data")

#graphics.off()
