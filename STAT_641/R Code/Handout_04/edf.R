#R code for plotting the edf for a data set, n=8

#postscript("u:\\meth1\\psfiles\\edf.ps",height=8,horizontal=F)

y =   c(  -4, -1, 6  , 9, 13 ,  17,   25, 28  )
edf = c(.125,.25,.375,.5,.625, .75, .875, 1.00)
par(cex=.99)
plot(y,edf,ylab="F(y)",xlab="y",lab=c(8,17,4),ylim=c(0,1.0),xlim=c(-6,30),
yaxt="n",xaxt="n",pch=16)
par(cex=.95)
axis(side=2,at=c(0,.125,.25,.375,.5,.625,.75,.875,1),
labels=c("0","1/8","2/8","3/8","4/8","5/8","6/8","7/8","1.0"))
par(cex=.70)
axis(side=1,at=c(-4,       -1,     6,      9,     13,         17,     25, 28),
labels=        c("Y_(1)","Y_(2)","Y_(3)","Y_(4)","Y_(5)","Y_(6)","Y_(7)","Y_(8)"))
segments(-6,  0,-4,0  )
segments(-4,.125,-1,.125)
segments(-1,.25,6,.25)
segments(6,.375,9,.375)
segments(9,.5,13,.5)
segments(13,.625,17,.625)
segments(17,.75,25,.75)
segments(25,.875,28,.875)
segments(28,1.00,30,1.00)
par(cex=.99)
title("Empirical Distribution Function, edf")

#graphics.off()


