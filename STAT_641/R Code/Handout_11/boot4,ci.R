x<- c(1354,1552,1766,1325,2183,1354,1299,627,695,2586,
      2420,71,2195,1825,159,1577,3725,884,1014,965)
n <- 20
mn<- mean(x)
thhat <- exp(-1200/mn)
S2 <- var(x)
Vest<- ((1200/(mn**2))**2)*(exp(-2400/mn))*(S2/n)
R <- 9999
z <- numeric(R)
z <- rep(0,times =R)
for (i in 1:R) 
{t<- sample(x,replace=TRUE)
V<- ((1200/(mean(t)**2))**2)*(exp(-2400/mean(t)))*(var(t)/n)
z[i] <- (exp(-1200/mean(t))-thhat)/sqrt(V)}
z <- sort(z)
L <- z[250]
U <- z[9750]
thL <- thhat-U*sqrt(Vest)
thU <- thhat-L*sqrt(Vest)

thL
thU



