

y1 =  c(66,  52,  49,  64,  68,  26,  86,  52,  43,  75,  87, 188, 118, 103,  82,  71, 103, 240,
   31,  40,  47,  51,  31,  47,  14,  71,  61,  47, 196, 131, 173,  37,  47, 215, 230,  69,
   98, 125,  94,  72,  72, 125, 143, 192, 122,  32, 114,  32,  23,  71,  38, 136, 169, 152,
  201, 134, 206,  92, 101, 119, 124, 133,  83,  60, 124, 142, 124,  64,  75, 103,  46,  68,
   87,  27,  73,  59, 119,  64, 111,  80,  68,  24,  24,  82, 100,  55,  91,  87,  64, 170,
   86, 202,  71,  85, 122, 155,  80,  71,  28, 212,  80,  24,  80, 169, 174, 141, 202, 113,
   38,  38,  28,  52,  14,  38,  94,  89,  99, 150, 146, 113,  38,  66,  38,  80,  80,  99,
   71,  42,  52,  33,  38,  24,  61, 108,  38,  28)

            
         
          hist(y1,breaks=10, plot=TRUE, prob=T, xlim=c(0,250),
          main="Stamford Ozone Data",
          xlab="Ozone Concentration", cex=.75)

         

          plot(density(y1,window='g',bw=4),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=4",cex=.5)

          plot(density(y1,window='g',bw=6),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=6",cex=.5)


          plot(density(y1,window='g',bw=8),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=8",cex=.5)


          plot(density(y1,window='g',bw=10),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=10",cex=.5)


          plot(density(y1,window='g',bw=12),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=12",cex=.5)


          plot(density(y1,window='g',bw=14),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=14",cex=.5)
 
          plot(density(y1,window='g',bw="nrd"),type="l",
          xlab="Ozone Concentration",ylab="PDF",
          main="Stamford Data, Gaussian, bw=nrd",cex=.5)

          plot(density(y1),
          ylab="PDF",
          main="Stamford Data, Gaussian, Default Settings",cex=.5)

          



