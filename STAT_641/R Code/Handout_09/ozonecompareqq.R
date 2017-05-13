#postscript("u:meth1/psfiles/ozonecompareqq.ps",height=8,horizontal=F)          
          y1 = scan("u:/meth1/Rfiles/ozone1.DAT")
          y2 = scan("u:/meth1/Rfiles/ozone2.DAT")
 
          qqplot(y1,y2,
                 main="Empirical quantile-quantile Plot",cex=.75,
                 ylab="Yonkers Ozone Concentration(ppb)",
                 xlab="Stamford Ozone Concentration(ppb)",ylim=c(0,250),
                 xlim=c(0,250),lab=c(10,10,7))
          
#graphics.off()