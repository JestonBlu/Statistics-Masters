#R code for plotting a pmf for discrete data 
par(mfrow=c(1,1))

#postscript("u:\\meth1\\psfiles\\pmf_discrete.ps",height=8,horizontal=F)

p = c(.03,.16,.35,.25,.15,.06)
cp = c(.03,.19,.54,.79,.94,1.00)
d = c(0,1,2,3,4,5)
zero = c(0,0,0,0,0,0)
plot(d,p,ylab="f(d)",xlab="d",lab=c(6,17,4))
segments(d,zero,d,p)
title("Probability Mass Function, f(d), for Discrete R.V.")

#postscript("u:\\meth1\\psfiles\\cdf_discrete.ps",height=8,horizontal=F)

plot(d,cp,ylab="F(d)",xlab="d",lab=c(6,17,4))
segments(-1,0,0,0)
segments(0,.03,1,.03)
segments(1,.19,2,.19)
segments(2,.54,3,.54)
segments(3,.79,4,.79)
segments(4,.94,5,.94)
segments(5,1.00,6,1.00)
title("Cumulative Distribution Function, F(d), for Discrete R.V.")

#postscript("u:\\meth1\\psfiles\\quan_discrete.ps",height=8,horizontal=F)

plot(cp,d,ylab="Q(u)",xlab="u",lab=c(17,6,4))
segments(0,0,.03,0)
segments(.03,1,.19,1)
segments(.19,2,.54,2)
segments(.54,3,.79,3)
segments(.79,4,.94,4)
segments(.94,5,1.00,5)
title("Quantile Function, Q(u), for Discrete R.V.")


#graphics.off()



