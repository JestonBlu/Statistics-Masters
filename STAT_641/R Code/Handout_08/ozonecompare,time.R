


#The following R program produces plots which take into account the
#time element in the ozone data. The file is contained in 
# Dostat folders:    Files/Rcode/ozonetime.R
#------------------------------------------------------------------------
#input data:
         y1 = scan("u:/meth1/Rfiles/ozone1.DAT")
          y2 = scan("u:/meth1/Rfiles/ozone2.DAT")

          y1na = scan("u:/meth1/Rfiles/ozone1,na.DAT")
          y2na = scan("u:/meth1/Rfiles/ozone2,na.DAT")

#create time index

          t1 = c(1:136)
          t2 = c(1:148)

#classify data by month

          y1m = rep(0,26)
          y1jn= rep(0,27)
          y1jl= rep(0,26)
          y1a = rep(0,,28)
          y1s = rep(0,29)
          y2m = rep(0,28)
          y2jn= rep(0,30)
          y2jl= rep(0,30)
          y2a = rep(0,31)
          y2s = rep(0,29)
for (i in 1:26) {  y1m[i] = y1[i]}
for (i in 27:53) {  y1jn[i-26] = y1[i]}
for (i in 54:79) { y1jl[i-53] = y1[i]}
for (i in 80:107) {  y1a[i-79] = y1[i]}
for (i in 108:136) {  y1s[i-107] = y1[i]}
for (i in 1:28) { y2m[i] = y2[i]}
for (i in 29:58) { y2jn[i-28] = y2[i]}
for (i in 59:88) { y2jl[i-58] = y2[i]}
for (i in 89:119) { y2a[i-88] = y2[i]}
for (i in 120:148) { y2s[i-119] = y2[i]}

#ozone vs time plot:
  
# postscript("u:/meth1/psfiles/ozonetime1.ps",height=8,horizontal=F)          
 
       plot(y1na,type="b",ylab="Ozone Conc-Stamford (ppb)",xlab="DAY",
          main="Time Series Plot of Stamford Data",cex=.9)
          abline(h=mean(y1))
#graphics.off()

# postscript("u:/meth1/psfiles/ozonetime2.ps",height=8,horizontal=F)          

         plot(y2na,type="b",ylab="Ozone Conc-Yonkers (ppb)",xlab="DAY",
          main="Time Series Plot of Yonkers Data",cex=.9)
         abline(h=mean(y2))
#graphics.off()


#postscript("u:/meth1/psfiles/ozonetime1a.ps",height=8,horizontal=F)          
 
       plot(y1na,type="b",ylim=c(0,250),
          ylab="Ozone Conc-Stamford (ppb)",xlab="DAY",
          main="Time Series Plot of Stamford Data",cex=.9)
          abline(h=mean(y1))
#graphics.off()


#postscript("u:/meth1/psfiles/ozonetime2a.ps",height=8,horizontal=F)          

         plot(y2na,type="b",ylim=c(0,250),
          ylab="Ozone Conc-Yonkers (ppb)",xlab="DAY",
          main="Time Series Plot of Yonkers Data",cex=.9)
         abline(h=mean(y2))
#graphics.off()


#side by side boxplots for the various months:

#postscript("u:/meth1/psfiles/ozonetimebox1.ps",height=8,horizontal=F)          

          boxplot(y1m,y1jn,y1jl,y1a,y1s,xlab="Month",ylab="Ozone Conc. (ppb)",
          main="Boxplots of Ozone Conc. for Stamford by Month",
               names=c("May","June","July","Aug","Sep"))  
#graphics.off()

   
#postscript("u:/meth1/psfiles/ozonetimebox2.ps",height=8,horizontal=F)          

          boxplot(y2m,y2jn,y2jl,y2a,y2s,xlab="Month",ylab="Ozone Conc. (ppb)",
          main="Boxplots of Ozone Conc. for Yonkers by Month",  
               names=c("May","June","July","Aug","Sep"))      
#graphics.off() 
     
# postscript("u:/meth1/psfiles/ozonetimebox1a.ps",height=8,horizontal=F)          

          boxplot(y1m,y1jn,y1jl,y1a,y1s,xlab="Month",ylab="Ozone Conc. (ppb)",
          main="Ozone Conc. for Stamford",ylim=c(0,250),
               names=c("May","June","July","Aug","Sep"),cex=.75)  
#graphics.off()

   
# postscript("u:/meth1/psfiles/ozonetimebox2a.ps",height=8,horizontal=F)            

          boxplot(y2m,y2jn,y2jl,y2a,y2s,xlab="Month",ylab="Ozone Conc. (ppb)",
          main="Ozone Conc. for Yonkers", ylim=c(0,250), 
               names=c("May","June","July","Aug","Sep"))      
 
#graphics.off()

