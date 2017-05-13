
#The following R code uses data from GOF for the two ozone data sets and then
#plots a Weibull Ref plot using log(W) transformation.
# This program is ~longneck/meth1/weibgofplotozone.R
#-------------------------------------------------------------------------------

x1 = scan("u:/meth1/Rfiles/ozone1.DAT")
x2 = scan("u:/meth1/Rfiles/ozone2.DAT")

y1 = sort(x1)
weib1 = log(y1)
n = length(weib1)
i = 1:n
ui = (i-.5)/n
QW1 = log(-log(1-ui))

#postscript("u:/meth1/psfiles/weibgofSam.ps",height=6,horizontal=FALSE)

plot(QW1,weib1,abline(lm(weib1~QW1)),
       main="Weibull Reference Plot for Stamford",cex=.75,lab=c(7,11,7),
       xlab="Q(u) = log(-log(1-u))",ylim=c(2.5,5.5),
       ylab="log(MaxOzone)")
legend(-5.4,5.3,"y = 4.5947+.4794Q(u)")
legend(-5.4,4.9,"AD = .698, .05<p-value<.10")

y2 = sort(x2)
weib2 = log(y2)
n = length(weib2)
i = 1:n
ui = (i-.5)/n
QW2 = log(-log(1-ui))

#postscript("u:/meth1/psfiles/weibgofYonk.ps",height=6,horizontal=FALSE)

plot(QW2,weib2,abline(lm(weib2~QW2)),
       main="Weibull Reference Plot for Yonkers",cex=.75,lab=c(7,11,7),
       xlab="log(-log(1-u))",ylim=c(2.0,5.0),xlim=c(-6,2),
       ylab="log(MaxOzone)")
legend(-5.5,4.7,"y = 4.1080 + .4338Q(u)")
legend(-5.5,4.4,"AD = .572, .10<p-value<.25")


#graphics.off()


