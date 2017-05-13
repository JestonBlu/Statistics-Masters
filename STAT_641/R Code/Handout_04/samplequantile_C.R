#R code for plotting the sample quantile function  for a data set, n=8

#postscript("u:\\meth1\\psfiles\\quanC.ps",height=8,horizontal=F)


y =   c(  -4, -1, 6  , 9, 13 ,  17,   25, 28  )
y1 =   c(  -4, -1, 6  , 9, 13 ,  17,   25  )
y2 =   c(  -1, 6  , 9, 13 ,  17,   25, 28  )
edf = c(.125,    .25,  .375,   .5, .625,  .75, .875, 1.00)
mid1 = c(.0625, .1875, .3125,.4375,.5625,.6875,.8125)
mid2 = c( .1875, .3125,.4375,.5625,.6875,.8125, .9375)
#plot(edf,y,ylab="Q(u)",xlab="u",lab=c(17,8,4),xlim=c(0,1),ylim=c(0,30),
#yaxt="n",xaxt="n")
par(cex=.99)
plot(edf,y,ylab="Q(u)",xlab="u",lab=c(8,17,4),xlim=c(-.05,1.0),ylim=c(-6,30),
yaxt="n",xaxt="n",pch=16)
par(cex=.65)
axis(side=1,at=c(0,.0625,.125,.1875,.25,.3125,.375,.4375,.5,.5625,.625,.6875,.75,.8125,.875,.9375,1.0),
labels=c("0","1/16","1/8","3/16","2/8","5/16","3/8","7/16","4/8","9/16","5/8",
"11/16","6/8","13/16","7/8","15/16","1.0"),cex=.5)
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

segments(mid1,y1,mid2,y2,lty=2)
par(cex=.99)
title("Sample Quantile Function")


#graphics.off()


