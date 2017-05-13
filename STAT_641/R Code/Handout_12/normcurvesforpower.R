#postscript("u:/meth1/psfiles/normalcurvesforpower.ps",height=9,

horizontal=FALSE)


 x=seq(24,41,.001)
  y0=dnorm(x,30,1.8)
  y1=dnorm(x,33,1.8)
  y=cbind(y0,y1)
  matplot(x,y,"l",ylab="Normal pdf",xlab=expression(mu),xaxt="n")
  axis(1,at=c(25,30,33,35,40),labels=c("25","30","33","35","40"))
  title("Pdf's of Sample Mean under Null and Alternative Hypotheses")
  abline("h"=c(15,0))
  lines(c(34.19,34.19),c(0,.18))
 text(25,.17, expression(H[o]:   mu <=   30))   
text(25,.15,  expression(H[1]:   mu > 30))   
text(27.5,.21,"N(30, 3.24) pdf")
text(35.5,.21,"N(33, 3.24) pdf")



 #graphics.off()


