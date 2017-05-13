
run = c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,
15,15,16,16,17,17,18,18)
Res = c(
 156,154,
 151,154,
 154,161,
 148,150,
 154,157,
 147,149,
 125,125,
 94,97,
 98,103,
 118,124,
 112,117,
 98,110,
 184,184,
 172,186,
 181,191,
 172,176,
 181,184,
 175,177)
spec = seq(1,6)

postscript("u:/meth1/Rfiles/chemplot_original.ps",horizontal=F)

plot(run,Res,type="p",xlab="Operators",ylab="Chemical Level",
        main="Figure 3: Chemical Variation Plot ",cex=.99,
        ylim=c(80,200),xaxt="n")
rect(0.75,149,3.25,163)
segments(1,154,1,156)
segments(2,151,2,154)
segments(3,154,3,161)
text(1,147,"R1",cex=.55)
text(2,147,"R2",cex=.55)
text(3,147,"R3",cex=.55)
text(2,143,"SPEC1",cex=.75)

rect(3.75,145,6.25,159)
segments(4,148,4,150)
segments(5,154,5,157)
segments(6,147,6,149)
text(4,143,"R4",cex=.55)
text(5,143,"R5",cex=.55)
text(6,143,"R6",cex=.55)
text(5,139,"SPEC2",cex=.75)

rect(6.75,92,9.25,127)
segments(7,125,7,125)
segments(8,94,8,97)
segments(9,98,9,103)
text(7,90,"R7",cex=.55)
text(8,90,"R8",cex=.55)
text(9,90,"R9",cex=.55)
text(8,86,"SPEC3",cex=.75)

rect(9.75,96,12.25,126)
segments(10,118,10,124)
segments(11,112,11,117)
segments(12,98,12,110)
text(10,94,"R10",cex=.55)
text(11,94,"R11",cex=.55)
text(12,94,"R12",cex=.55)
text(11,90,"SPEC4",cex=.75)

rect(12.75,170,15.25,193)
segments(13,184,13,184)
segments(14,172,14,186)
segments(15,181,15,191)
text(13,168,"R13",cex=.55)
text(14,168,"R14",cex=.55)
text(15,168,"R15",cex=.55)
text(14,164,"SPEC5",cex=.75)

rect(15.75,170,18.25,186)
segments(16,172,16,176)
segments(17,181,17,184)
segments(18,175,18,177)
text(16,168,"R16",cex=.55)
text(17,168,"R17",cex=.55)
text(18,168,"R18",cex=.55)
text(17,164,"SPEC6",cex=.75)


axis(side=1,at=c(3.5,9.5,15.5),
labels=c("Operator 1","Operator 2","Operator 3"))
segments(6.5,147.8,19,147.8)
text(12,150,"mean of 36 chemical analyses")
graphics.off()

