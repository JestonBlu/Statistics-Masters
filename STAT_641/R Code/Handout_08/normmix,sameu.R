#generate mixtures of normal distributions having same mean
#but different standard deviations.
par(cex=1.1)
#postscript("u:/meth1/psfiles/normmix_equalu1.ps")

x <- seq(73,127,len=5000)
y1n <- dnorm(x,100,5.385164807)
y2n <- dnorm(x,100,2.720294102)
y3n <- dnorm(x,100,8.062257748)
y4n <- dnorm(x,100,6.016643583)
y1 <- dnorm(x,100,1)
y2 <- dnorm(x,100,3)
y3 <- dnorm(x,100,5)
y4 <- dnorm(x,100,9)
PDF1 <- .25*y1+.25*y2+.25*y3+.25*y4
PDF1 <- cbind(PDF1,y1n)
matplot(x,PDF1,type="l",col="black",xlab="x",ylab="PDF ",
main = expression(paste("Equal Mixture of 4 normal pdfs with   ",
 sigma == "1, 3, 5, 9")))
text(107,0.13,"Mixture pdf")
text(115,0.05,"N(100,(5.385)^2 pdf")
arrows(104,.126,101.5,.11)
arrows(111,.046,107.4,.03)

#postscript("u:/meth1/psfiles/normmix_equalu2.ps")

par(cex=1.1)
PDF2 <- .75*y1+.15*y2+.05*y3+.05*y4
PDF2 <- cbind(PDF2,y2n)
matplot(x,PDF2,type="l",col="black",xlab="x",ylab="PDF",
main=expression(paste("Unequal Mixture of 4 normal pdfs with  ",
 sigma == "1(75%), 3(15%), 5(5%), 9(5%)" )))
text(107,0.24,"Mixture pdf")
text(115,0.09,"N(100,(2.720)^2) pdf")
arrows(106,.235,101.4,.19)
arrows(112,.084,104,.05)



#postscript("u:/meth1/psfiles/normmix_equalu3.ps")

par(cex=1.1)

PDF3 <- .05*y1+.05*y2+.15*y3+.75*y4
PDF3 <- cbind(PDF3,y3n)
matplot(x,PDF3,type="l",col="black",xlab="x",ylab="PDF",,
main=expression(paste("Unequal Mixture of 4 normal pdfs with  ",  
sigma == "1(5%), 3(5%), 5(15%), 9(75%)")))
text(107,0.07,"Mixture pdf")
text(118,0.04,"N(100,(8.062)^2) pdf")
arrows(106,.068,102,.055)
arrows(117,.038,109.8,.025)


#postscript("u:/meth1/psfiles/normmix_equalu4.ps")

par(cex=1.1)

PDF4 <- .40*y1+.1*y2+.1*y3+.4*y4
PDF4 <- cbind(PDF4,y4n)
matplot(x,PDF4,type="l",col="black",xlab="x",ylab="PDF",
main=expression(paste("Unequal Mixture of 4 normal pdfs with  ",
sigma == "1(40%), 3(10%), 5(10%), 9(40%)")))
text(106,0.12,"Mixture pdf")
text(114,0.05,"N(100,(6.017)^2) pdf")
arrows(105,.118,102,.09)
arrows(113,.046,107.8,.03)
 

#graphics.off()
