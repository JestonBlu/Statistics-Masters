#Normal Reference Distribution Plot for Example on Page 36 of Handout 11 :
x  =  c(14.2,5.3,2.9,4.2,1.2,4.3,1.1,2.6,6.6,7.8,25.9,43.8,2.7,
5.6,7.8,3.9,4.7,6.5,29.5,2.1,34.8,3.6,5.8,4.5,6.7)
n =  length(x)
x =  sort(x)
i =  seq(1:n)
ui =  (i-.5)/n
QZ =  qnorm(ui)

#par(mfrow=c(1,2))
#postscript("u:/meth1/psfiles/hand11exnorm.ps",height=8,horizontal=F)

plot(QZ,x,xlab="QZ=Normal Quantile",ylab="Recyclable Wastes(lbs/wk)",
abline(lm(x~QZ)),
       lab=c(7,8,7),main="Normal Ref. Plot - Recyclable Wastes",cex=.95)
legend(-2,40,"SW=.667,p=.000003")

 

#postscript("u:/meth1/psfiles/hand11exbox.ps",height=8,horizontal=F)

boxplot(x,ylab="Recyclable Wastes (lbs/week)",main="Box Plot -Recyclable Wastes",cex=.95)

#graphics.off()
