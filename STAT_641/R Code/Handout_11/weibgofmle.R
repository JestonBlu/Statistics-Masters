
#The following R code uses data from GOF example in Handout 10 and then
#plots a Weibull Ref plot using log(W) transformation.
# This program is ~longneck/meth1/weibgofplot.R
#-------------------------------------------------------------------------------
library(MASS)
x <- c(
17.88 , 28.92 ,  33.00 ,   41.52 ,  42.12 ,  45.60 ,  48.40,  51.84 ,
51.96 , 54.12 ,  55.56   , 67.80 ,  68.64  , 68.64 ,  68.88 , 84.12 ,
93.12 , 98.64 , 105.12  , 105.84 , 127.92 , 128.04 , 173.40 )
fitdistr(x,"weibull")
y <- sort(x)
weib <- log(y)
n <- length(weib)
i<- 1:n
ui<- (i-.5)/n
QW<- log(-log(1-ui))


#postscript("u:/meth1/psfiles/weibgofmle.ps",height=6,horizontal=F)


plot(QW,weib,abline(lm(weib~QW)),
       main="Weibull Reference Plot",cex=.75,lab=c(7,11,7),
       xlab="Q(u) = log(-log(1-u))",
       ylab="log(W(i))" )
legend(-3.5,5.0,"y = 4.388+.4207 Q(u)")
legend(-3.5,4.7,"ADM = .3413, pvalue > .25")


#graphics.off()


