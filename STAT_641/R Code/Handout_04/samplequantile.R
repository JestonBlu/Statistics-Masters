#R code for plotting the sample quantile function  for a data set, n=8

#postscript("u:\\meth1\\psfiles\\quan.ps",height=8,horizontal=F)


y =   c(  -4, -1, 6  , 9, 13 ,  17,   25, 28  )
edf = c(.125,.25,.375,.5,.625, .75, .875, 1.00)
#plot(edf,y,ylab="Q(u)",xlab="u",lab=c(17,8,4),xlim=c(0,1),ylim=c(0,30),
#yaxt="n",xaxt="n",pch=16)
#par(cex=.99)
plot(edf,y,ylab="Q(u)",xlab="u",lab=c(8,17,4),xlim=c(-.05,1.0),ylim=c(-6,30),
yaxt="n",xaxt="n",pch=16)
par(cex=.95)
axis(side=1,at=c(0,.125,.25,.375,.5,.625,.75,.875,1),
labels=c("0","1/8","2/8","3/8","4/8","5/8","6/8","7/8","1.0"))
par(cex=.65)
axis(side=2,at=c(-4,       -1,     6,      9,     13,         17,     25, 28),
labels=        c("Y_(1)","Y_(2)","Y_(3)","Y_(4)","Y_(5)","Y_(6)","Y_(7)","Y_(8)"))

segments(0  , -4,.125,-4)
segments(.125,-1, .25,-1)
segments(.25 ,6,.375,6)
segments(.375,9,.5, 9)
segments(.5,  13,.625,13)
segments(.625, 17,.75,17)
segments(.75, 25,.875,25)
segments(.875,28,1.0,28)
par(cex=.99)
title("Sample Quantile Function")


#graphics.off()


