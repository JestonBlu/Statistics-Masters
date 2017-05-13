  r=10000
  d <- .5
  n <- 10
  df <- n-1
  x <- matrix(0,n,r)
   xb <- rep(0,r)
   s  <- rep(0,r)
   t  <- rep(0,r)
   lt <- rep(0,r)


  for (i in 1:r) {
 
        x[,i] <- rgamma(n,d,1) 
 
        xb[i] <- mean(x[,i]) 
        s[i] <- sqrt(var(x[,i]))
        t[i] <- (xb[i]-d)*sqrt(n)/s[i]}
        t <- sort(t)
        x <- sort(x)
        ll<- t[250]
        ul<- t[9750]

  #postscript("simt_skewed30.ps",height=7,horizontal=F)

         par(lab=c(20,10,4))
          plot(density(t,window="g",width="nrd"),type="l",xlab="t",ylab="PDF",
          main="Sampling Dist. of t Under Gamma(.5,1), n=10",ylim=c(0,.4),cex=.5)

#graphics.off()

