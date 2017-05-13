#The following R code generates various graphical representations of the
#Ozone data. The ozone data is in the files ozone1.DAT and ozone2.DAT
#------------------------------------------------------------------------------

#input the data from data files:

          y1 <- scan("u:/meth1/Rfiles/ozone1.DAT")
          y2 <- scan("u:/meth1/Rfiles/ozone2.DAT")
          y1na <- scan("u:/meth1/Rfiles/ozone1,na.DAT")
          y2na <- scan("u:/meth1/Rfiles/ozone2,na.DAT")

#output stemleaf plots to file stemozone:

         # sink("stemozone")
          stem(y1)
          stem(y2)
          y1
          y2
          y1s<-sort(y1)
          y2s<-sort(y2)
          sink()

       


#creates an empirical cdf (edf) plot for the two locations:

#postscript("u:/meth1/psfiles/StamfordEdfUn.ps",height=8,horizontal=F)

          Q1<-quantile(y1,probs<-seq(0,1,.01))
          plot(Q1,probs,type="l",xlab="y (ppb)",ylab="F(y)",
               ylim=c(0,1),lab=c(12,20,7),cex=.75)
          title("Empirical Distribution Function of Stamford Data",cex=.75)

#postscript("u:/meth1/psfiles/YonkersEdfUn.ps",height=8,horizontal=F)

          Q2<-quantile(y2,probs<-seq(0,1,.01))
          plot(Q2,probs,type="l",xlab="y (ppb)",ylab="F(y)",
               ylim=c(0,1),lab=c(12,20,7),cex=.75)
          title("Empirical Distribution Function of Yonkers Data",cex=.75)

#postscript("u:/meth1/psfiles/StamfordEdf.ps",height=8,horizontal=F)

          Q1<-quantile(y1,probs<-seq(0,1,.01))
          plot(Q1,probs,type="l",xlab="y (ppb)",ylab="F(y)",xlim=c(0,250),
               ylim=c(0,1),lab=c(12,20,7),cex=.75)
          title("Empirical Distribution Function of Stamford Data",cex=.75)

#postscript("u:/meth1/psfiles/YonkersEdf.ps",height=8,horizontal=F)

          Q2<-quantile(y2,probs<-seq(0,1,.01))
          plot(Q2,probs,type="l",xlab="y (ppb)",ylab="F(y)",xlim=c(0,250),
               ylim=c(0,1),lab=c(12,20,7),cex=.75)
          title("Empirical Distribution Function of Yonkers Data",cex=.75)


#creates an empirical quantile plot for the two locations:


#postscript("u:/meth1/psfiles/StamfordQuan.ps",height=8,horizontal=F)


 
          Q1<-quantile(y1,probs<-seq(0,1,.01))
          plot(probs,Q1,type="l",ylab="Q(u) (ppb)",xlab="u",ylim=c(0,250),
               xlim=c(0,1),lab=c(10,11,7))
          title("Empirical Quantile of Stamford Data",cex=.75)

#postscript("u:/meth1/psfiles/YonkersQuan.ps",height=8,horizontal=F)


          Q2<-quantile(y2,probs<-seq(0,1,.01))
          plot(probs,Q2,type="l",ylab="Q(u) (ppb)",xlab="u",ylim=c(0,250),
               xlim=c(0,1),lab=c(10,11,7))
          title("Empirical Quantile of Yonkers Data",cex=.75)




#graphics.off()


