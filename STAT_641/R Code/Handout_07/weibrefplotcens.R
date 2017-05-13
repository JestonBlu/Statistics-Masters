
#The following R code evaluates is cord strength data is from a 
Weibull Distribution and then
#plots a Weibull Ref plot using log(W) transformation.
# This program is ~longneck/meth1/weibcensored.R
#-------------------------------------------------------------------------------

s =  c(36.3 , 52.4,  54.8 , 57.1,  60.7 , 41.7 , 52.6 , 54.8 , 57.3,  
43.9 , 52.7 , 55.1 , 57.7 , 49.4 , 53.1 , 55.4 , 57.8, 
50.1 , 53.6 , 55.9 , 58.1 , 50.8 , 53.6 , 56.0 , 58.9 ,
51.9 , 53.9 , 56.1 , 59.0 , 52.1 , 53.9 , 56.5 , 59.1 ,
52.3 , 54.1 , 56.9 , 59.6 , 52.3,  54.6 , 57.1 , 60.4)

sc =  c(26.8 , 29.6 , 33.4 , 35.0 , 40.0 , 41.9 , 42.5) 

y =  c(s,sc)


s =  sort(s)
w =  log(s)
n  =  41
i =  1:n
ui =  (i-.5)/n
QW =  log(-log(1-ui))

#postscript("u:/meth1/psfiles/refplotweicens.ps",height=6,horizontal=F)

plot(QW,w,
       main="Weibull Reference Plot",cex=.75,
       xlab="Qw(ui)=ln(-ln(1-ui))",
       ylab="W(i)=ln(T(i))")
abline(lm(w~QW))
text(0,3.75,"Fitted Line is")
text(0,3.7,"W=4.0296+0.07452 Qw")

#graphics.off()


