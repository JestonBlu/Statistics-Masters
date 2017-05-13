#
# R CODE FOR DISPLAYING CORRELATION PLOTS FOR DATA
# (file is in longneck/meth1/corrplot.s)
# ----------------------------------------------------------------------------

 postscript("u:/meth1/psfiles/corr_p1.ps",height=7,width=6,horizontal=F)

 y  = matrix(0,150,1)
 y  = scan("u:/meth1/Rfiles/corr.dat")


 n  = length(y)
 ytime1  = ts(y,start=1,frequency=1) 
 plot.ts(ytime1,type="b",ylab="Y_t",xlab="Time (t)",main="Y_t  vs  Time (t)")
 ymean  = mean(y)
 abline(h=ymean,lty=2)

postscript("u:/meth1/psfiles/corr_p2.ps",height=7,width=6,horizontal=F)


 yt  = y[2:150]
 ytlag1  = y[1:149]
 plot(ytlag1,yt,main="Lag Plot",ylab="Y_t",xlab="Y_t-1")

#Calculation of von Neumann Statistics

dif1  = (yt-ytlag1)^2
num1  = sum(dif1)
y2  = (y-ymean)^2
den1  = sum(y2) 
Q  = (num1/(n-1))/(den1/n) 
prd1  = (yt-ymean)*(ytlag1-ymean)
prdsum1  = sum(prd1)
rho1  = prdsum1/den1
rho1
Q

graphics.off()

#Output from Corrplot.s:

#[1] 0.7746074

#[1] 0.441409
