

          y1 = scan("u:/meth1/Rfiles/ozone1.DAT")

          y2 = scan("u:/meth1/Rfiles/ozone2.DAT")
                      
         # postscript("u:/meth1/psfiles/ozonepdfs2a.ps",height=7,horizontal=F)          

          par(mfcol=c(2,2))
 
          #plot(density(y1,window='g',bw="nrd",from=0),type="l",
          #xlab="Ozone Concentration",ylab="PDF",
          #main="Stamford Ozone Concentration ",cex=.95)

          plot(density(y1,kernel='g',bw="nrd",n=500,from=0),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Ozone Concentration ",cex=.95)


          plot(density(y2,window='g',bw="nrd",from=0),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Yonkers Ozone Concentration",cex=.9)

         #postscript("u:/meth1/psfiles/ozonepdf_Stam.ps",height=7,horizontal=F)          



          plot(density(y1,window='g',bw="nrd",from=0),type="l",
          xlab="Ozone Concentration",ylab="PDF",xlim=c(0,310),ylim=c(0,.014),
          main="Stamford Ozone Concentration ",cex=.95)

       #postscript("u:/meth1/psfiles/ozonepdf_Yonk.ps",height=7,horizontal=F)          



          plot(density(y2,window='g',bw="nrd",from=0),type="l",
          xlab="Ozone Concentration",ylab="PDF",xlim=c(0,310),ylim=c(0,.014),
          main="Yonkers Ozone Concentration",cex=.9)

          #graphics.off()

