x<- 1:20
y<- x^6/100000
e<- rnorm(20,0,3)
y<- y+e
xr<- rank(x)
yr<- rank(y)
#postscript("u:/meth1/psfiles/spearman.ps",horizontal=F)
plot(x,y,xlab="X-var",ylab="Y-var",ylim=c(-200,600),xlim=c(0,20),
     main="Figure 1: Nonlinear Relationship Y vs X",lab=c(10,15,7))
box()
points(x,y)
text(4,550,"Pearson Correlation = 0.79")
text(4,500,"Spearman Correlation = 0.95")
abline(lm(y~x))
#graphics.off()

x2<- rnorm(19,0,1)
y2<- rnorm(19,0,1)
x2 <- c(x2,10)
y2 <- c(y2,5)
xr2<- rank(x2)
yr2<- rank(y2)
#postscript("u:/meth1/psfiles/spearman2.ps",horizontal=F)
plot(x2,y2,xlab="x-var",ylab="y-var",xlim=c(-3,10),
     main="Figure 2: One Influential X Value",lab=c(10,15,7))
box()
points(x2,y2)
text(0,4.5,"Pearson Correlation = 0.72")
text(0,4,"Spearman Correlation = 0.06")
abline(lm(y2~x2))
#graphics.off()


