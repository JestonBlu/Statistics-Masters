
# gofweibmle.R
# The following program computes the Anderson-Darling Statistics 
# for testing goodness of the fit of a # Weibull Distribution 
# with unspecified parameters. The MLE's are computed. 
# The statistics include the modification needed to use the Tables included 
# in the GOF handout.

#postscript("u:/meth1/psfiles/weibgofmle.ps",height=6,horizontal=FALSE)

x = c(17.88, 28.92, 33.00, 41.52, 42.12, 45.60, 48.40, 51.84, 
51.96, 54.12, 55.56, 67.80, 68.64, 68.64, 68.88, 84.12,
93.12, 98.64, 105.12, 105.84, 127.92, 128.04, 173.40)

n = length(x)
y = -log(x)
y = sort(y)
i= 1:n

# Anderson-Darling: For Weibull Model
library(MASS)
mle <- fitdistr(x,"weibull")
shape = mle$estimate[1]
scale = mle$estimate[2]
a = -log(scale) 
b = 1/shape
z   = exp(-exp(-(y-a)/b))  
A1i = (2*i-1)*log(z)
A2i = (2*n+1-2*i)*log(1-z)
s1  = sum(A1i)
s2  = sum(A2i)

AD  = -n-(1/n)*(s1+s2)
ADM  = AD*(1+.2/sqrt(n))
AD
ADM

n = length(y)
weib= log(x)
weib= sort(weib)
i= 1:n
ui= (i-.5)/n
QW= log(-log(1-ui))
plot(QW,weib,abline(lm(weib~QW)),
       main="Weibull Reference Plot",cex=.75,lab=c(7,11,7),
       xlab=expression(Q(u[i]) == log(-log(1-u[i]))),
       ylab=expression(y == log(W[(i)])))
legend(-3.5,5.0,expression(y == 4.388+.4207*Q(u)))
legend(-3.5,4.7,"ADM=.3413, p-value>.25")

#graphics.off()
