
library(MASS)

x = c(16.20,9.37,25.80,9.55,12.86,15.34,18.08,10.76,14.92,9.75,17.10,13.97,
15.08,9.24,11.99,13.60,8.16,12.82,12.89,13.59,16.23,14.19,9.03,9.58,13.68)


#obtain MLE of the a=location and b=scale parameters in logistic model

mleestD = coef(fitdistr(x,"logistic"))
aD = mleestD[1]
bD = mleestD[2]
cvD =  bD*pi/(sqrt(3)*aD)


n =  length(x)
B  =  9999
W  =  matrix(0,B,n)
cv =  numeric(B)
cv =  rep(0,B)
a =  numeric(B)
a =  rep(0,B)
b =  numeric(B)
b =  rep(0,B)
mleest =  matrix(0,B,2)


{
for (i in 1:B) 
W[i,]  =  rlogis(n,aD,bD)
}

{
for (i in 1:B)
mleest[i,] = coef(fitdistr(W[i,],"logistic"))
}

a = mleest[,1]
b = mleest[,2]
cv =  b*pi/(sqrt(3)*a)


cv =  sort(cv)

R = cv/cvD

L  =  R[250]
U  =  R[9750]

ci = c(cvD/U, cvD/L)

ci


