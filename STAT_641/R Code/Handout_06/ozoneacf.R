#The following Splus program produces plots which take into account the
#time element in the ozone data. The file is contained in 
#       ~longneck/meth1/sfiles/ozonetime.S
#------------------------------------------------------------------------
#input data:

          y1 = scan("u:/meth1/Rfiles/ozone1.DAT")
          y2 = scan("u:/meth1/Rfiles/ozone2.DAT")

#create time index

          t1 = c(1:136)
          t2 = c(1:148)


#          postscript("ozoneacf.ps",height=8,horizontal=F)          


#ozone vs time plot:
par(mfrow=c(2,2))

         plot.ts(y1na,type="b",ylab="Ozone Conc-Stamford (ppb)",xlab="DAY",
          main="Time Series Plot of Stamford Data",cex=.9)

         plot.ts(y2na,type="b",ylab="Ozone Conc-Yonkers (ppb)",xlab="DAY",
          main="Time Series Plot of Yonkers Data",cex=.9)

#autocorrelations

         sink("autocorr")

         acf(y1,main="ACF for Stamford Ozone Concentration")
         acf(y2,main="ACF for Yonkers Ozone Concentration")

         sink()



 #         graphics.off()

