

          y1 <- scan("u:/meth1/Rfiles/ozone1.DAT")

          y2 <- scan("u:/meth1/Rfiles/ozone2.DAT")
                      
 #         postscript("u:/meth1/Rfiles/ozonekern4p1.ps",height=7,horizontal=F)          

          par(mfrow=c(2,2))

          hist(y1,breaks=10, plot=TRUE, prob=T, xlim=c(0,250),
          main="Stamford Ozone Data",
          xlab="Ozone Concentration", cex=.75)

          plot(density(y1,window='g',bw=4),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=4",cex=.5)

          plot(density(y1,window='g',bw=8),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=8",cex=.5)
 
          plot(density(y1,window='g',bw="nrd"),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=nrd",cex=.5)

#          postscript("u:/meth1/Rfiles/ozonekern4p2.ps",height=7,horizontal=F)          

          par(mfrow=c(2,2))



          hist(y2,breaks=10, plot=TRUE, prob=T, xlim=c(0,150),
          main="Yonkers Ozone Data",
          xlab="Ozone Concentration", cex=.75)


          plot(density(y2,window='g',bw=4),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Yonkers Data, Gaussian, bw=4",cex=.5)

          plot(density(y2,window='g',bw=8),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Yonkers Data, Gaussian, bw=8",cex=.5)

          plot(density(y2,window='g',bw="nrd"),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Yonkers Data, Gaussian, bw=nrd",cex=.5)

 #         graphics.off()





