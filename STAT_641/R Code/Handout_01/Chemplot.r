
run =  seq(1,18)
Res =  c(137.8,147.8,157.8,187.8,137.8,117.8,
147.8,147.8,147.8,177.8,157.8,107.8,
167.8,157.8,117.8,177.8,147.8,117.8)
spec =  seq(1,6)

postscript("u:/meth1/homework/hw1_chemplot1.ps")

plot(run,Res,type="p",xlab="Specimen",ylab="Chemical Level",
        main="Variation Due Only to R(S,O)",cex=.99,
        ylim=c(100,200),xaxt="n")
segments(0.75,136.6,3.25,136.6)
segments(0.75,160,3.25,160)
segments(0.75,136.6,0.75,160)
segments(3.25,136.6,3.25,160)

segments(3.75,116.6,6.25,116.6)
segments(3.75,190,6.25,190)
segments(3.75,116.6,3.75,190)
segments(6.25,116.6,6.25,190)

segments(6.75,141.6,9.25,141.6)
segments(6.75,155,9.25,155)
segments(6.75,141.6,6.75,155)
segments(9.25,141.6,9.25,155)

segments(9.75,106.6,12.25,106.6)
segments(9.75,180,12.25,180)
segments(9.75,106.6,9.75,180)
segments(12.25,106.6,12.25,180)

segments(12.75,116.6,15.25,116.6)
segments(12.75,170,15.25,170)
segments(12.75,116.6,12.75,170)
segments(15.25,116.6,15.25,170)

segments(15.75,116.6,18.25,116.6)
segments(15.75,180,18.25,180)
segments(15.75,116.6,15.75,180)
segments(18.25,116.6,18.25,180)
axis(side=1,at=c(2,5,8,11,14,17),labels=c(1,2,3,4,5,6))
segments(0,147.8,19,147.8)

graphics.off()

