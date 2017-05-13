
# gofweibozone.R
# The following program computes the Anderson-Darling Statistics 
# for testing goodness of the fit of a
# Weibull Distribution 
# with unspecified parameters (need to supply MLE's). 
# The statistics include the modification needed to use the Tables included 
# in the GOF handout.
# This example is based on the ozone data:

x1 = scan("u:/meth1/Rfiles/ozone1.DAT")
x2 = scan("u:/meth1/Rfiles/ozone2.DAT")

n1 <- length(x1)
y1 <- -log(x1)
y1 <- sort(y1)
i <-  seq(1,n1,1)
# Anderson-Darling: For Weibull Model

a   <- -4.6189       #mle of location in Extreme Value Dist. Form
b   <-  0.5452       #mle of scale in Extreme Value Dist. Form
z1   <- exp(-exp(-(y1-a)/b))  
A11i <- (2*i-1)*log(z1)
A21i <- (2*n1+1-2*i)*log(1-z1)
s11  <- sum(A11i)
s21  <- sum(A21i)
AD1  <- -n1-(1/n1)*(s11+s21)
AD1  <- AD1*(1+.2/sqrt(n1))

n2 <- length(x2)
y2 <- -log(x2)
y2 <- sort(y2)
i <-  seq(1,n2,1)
# Anderson-Darling: For Weibull Model

a   <- -4.1266  #mle of location in Extreme Value Dist. Form
b   <-  0.4805       #mle of scale in Extreme Value Dist. Form
z2   <- exp(-exp(-(y2-a)/b))  
A12i <- (2*i-1)*log(z2)
A22i <- (2*n2+1-2*i)*log(1-z2)
s12  <- sum(A12i)
s22  <- sum(A22i)
AD2  <- -n2-(1/n2)*(s12+s22)
AD2  <- AD2*(1+.2/sqrt(n2))


