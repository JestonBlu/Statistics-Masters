 

#The following R program generates various graphical comparisons of the
#Ozone data. The ozone data is in the files ozone1.DAT and ozone2.DAT
#The code is in Files/Rcode/ozonecompare.R
#------------------------------------------------------------------------------

#input data:
 
          y1 = scan("u:/meth1/Rfiles/ozone1.DAT")
          y2 = scan("u:/meth1/Rfiles/ozone2.DAT")
          n1=length(y1)
          i=seq(1,n1,1)
          n2=length(y2)
          j=seq(1,n2,1)
          u1=(i-.5)/n1
          u2=(j-.5)/n2
          w1 = sort(log(y1))
          w2 = sort(log(y2))
          QZ1 = log(-log(1-u1))

          QZ2 = log(-log(1-u2))

#creates side-by-side box plots:
 
#postscript("u:meth1/psfiles/ozonecomparebox.ps",height=8,horizontal=FALSE)          

          boxplot(y1,y2,
                  names=c("Stamford","Yonkers"),
                  main="Box Plots of Ozone Data Sets",
                  ylab="Ozone Concentration (ppb)",plot=TRUE  )

#graphics.off()

#creates a quantile by quantile (q-q) plot:
  
#postscript("u:meth1/psfiles/ozonecompareqq.ps",height=8,horizontal=FALSE)          

          qqplot(y1,y2,
                 main="Empirical quantile-quantile Plot",cex=.75,
                 ylab="Yonkers Ozone Concentration(ppb)",
                 xlab="Stamford Ozone Concentration(ppb)",ylim=c(0,140),
                 xlim=c(0,250),lab=c(7,10,7))
 
#graphics.off()

         

#creates a normal quantile plot:
  
#postscript("u:meth1/psfiles/ozonecomparenormalSamford.ps",height=8,horizontal=FALSE)          


          qqnorm(y1,main="Normal Prob Plots of Samford Data",
                 xlab="normal quantiles",ylab="ozone concentration(ppb)",
                 ylim=c(0,250),xlim=c(-3,3),lab=c(7,7,7),cex=.75)
          qqline(y1)

#graphics.off()

  
#postscript("u:meth1/psfiles/ozonecomparenormalYonkers.ps",height=8,horizontal=FALSE)          


          qqnorm(y2,main="Normal Prob Plots of Yonkers Data",
                 xlab="normal quantiles",ylab="ozone concentration(ppb)",
                 ylim=c(0,140),xlim=c(-3,3),lab=c(7,7,7),cex=.75)
          qqline(y2)
 
#graphics.off()

 
#postscript("u:meth1/psfiles/ozonecompareWeibullSamford.ps",height=8,horizontal=FALSE)          



          plot(QZ1,w1,main="Weibull Reference Plots of Samford Data",
                 xlab="Standard Log(Weibull) quantiles",
                 ylab="Log(ozone concentration(ppb))",
                 ylim=c(2,6),xlim=c(-5,3),lab=c(7,10,7),cex=.75)
           abline(lm(w1~QZ1))

#graphics.off()

 
#postscript("u:meth1/psfiles/ozonecompareWeibullYonkers.ps",height=8,horizontal=FALSE)          


          plot(QZ2,w2,main="Weibull Reference Plots of Yonkers Data",
                 xlab="Standard Log(Weibull) quantiles",
                 ylab="Log(ozone concentration(ppb))",
                 ylim=c(2,6),xlim=c(-5,3),lab=c(7,10,7),cex=.75)
           abline(lm(w2~QZ2))

#graphics.off()

