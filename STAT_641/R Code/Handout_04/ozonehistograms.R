#The following R code generates various graphical representations of the
#Ozone data. The ozone data is in the files ozone1.DAT and ozone2.DAT
#The following file can be found in ~longneck/meth1/sfiles/ozoneplot.s
#------------------------------------------------------------------------------

#input the data from data files:

          y1   =   scan("u:/meth1/Rfiles/ozone1.DAT")
          y2   =   scan("u:/meth1/Rfiles/ozone2.DAT")
          y1na   =   scan("u:/meth1/Rfiles/ozone1,na.DAT")
          y2na   =   scan("u:/meth1/Rfiles/ozone2,na.DAT")

#creates a ps file for the following plots:

#          postscript("ozoneplot.ps",height = 8,horizontal = F)          

#The following R code generates various estimates of the density
#function for the Ozone Data

          hist(y1,plot = TRUE,prob = T,
          main = "Samford Ozone Data(Default Setting)",
          ylab = "Rel.Freq./ClassWidth",
          xlab = "Ozone Concentration (ppb)",cex = .70,xlim = c(0,250),ylim = c(0,.012))

          hist(y1,nclass = 5,plot = TRUE,prob = T,
          main = "Samford Ozone Data(5 Bins)",
          ylab = "Rel.Freq./ClassWidth",
          xlab = "Ozone Concentration (ppb)",cex = .70,xlim = c(0,250),ylim = c(0,.010))

          hist(y1,nclass = 25,plot = TRUE,
          main = "Samford Ozone Data(25 Bins)",
          ylab = "Frequency",
          xlab = "Ozone Concentration (ppb)",cex = .70,xlim = c(0,250),ylim = c(0,20))

          hist(y1,nclass = 25,plot = TRUE,prob = T,
          ylab = "Rel.Freq./ClassWidth",
          main = "Samford Ozone Data(25 Bins)",
         xlab = "Ozone Concentration (ppb)",cex = .70,xlim = c(0,250),ylim = c(0,.014))


          y2p   =   c(y2,243,357,425,567,780,870)   
                               
               
          hist(y2,plot = TRUE,prob = T,
          main = "Yonkers Ozone(Default Setting)",
          ylab = "Rel.Freq./ClassWidth",
         xlab = "Ozone Concentration (ppb)",cex = .75,xlim = c(0,150),ylim = c(0,.020))

          hist(y2p,plot = TRUE,prob = T,
          main = "Yonkers Ozone With Outliers(Default Setting)",
          ylab = "Rel.Freq./ClassWidth",
        xlab = "Ozone Concentration (ppb)",cex = .75,xlim = c(0,1000),ylim = c(0,.020))

    
          breaks2   =   seq(0,140,20)
          breaks2   =   c(breaks2,500,1000)

          hist(y2p,breaks = breaks2,plot = TRUE,freq = T,lab = c(6,10,7),
          main = "Yonkers Ozone With Outliers(Unequal Class Widths)",
          ylab = "Frequency",
       xlab = "Ozone Concentration (ppb)",cex = .75,xlim = c(0,1000),ylim = c(0,45))

       
          hist(y2p,breaks = breaks2,prob = T,plot = TRUE,lab = c(6,8,7),
          main = "Yonkers Ozone With Outliers(Unequal Class Widths)",
          ylab = "Rel.Freq./ClassWidth",
        xlab = "Ozone Concentration (ppb)",cex = .75,xlim = c(0,1000),ylim = c(0,.015))


# graphics.off()



