
#The following R program plots the quantile function for 
#an exp dist with scale 1

x <- seq(0.0001,.9999,length=5000)
y  = -log(1-x)

postscript("u:/meth1/psfiles/quanexp.ps",height=8,horizontal=F)

plot(x,y,main="Quantile Function for Exp with scale=1 ",
type="l",ylim=c(0,10),
     xlim=c(0,1),lab=c(9,8,7),cex=.5,lty=c(1,2))
abline(v=1)
graphics.off()


