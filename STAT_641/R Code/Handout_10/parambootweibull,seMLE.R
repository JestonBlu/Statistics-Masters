x =  c(15.321, 9.008, 20.104, 7.729, 45.154, 8.404, 5.332, 0.577, 4.305, 4.517,
  12.594, 6.829, 3.291, 37.175, 0.841, 1.317, 7.613, 20.582, 2.030, 10.001,
  4.666, 12.933, 0.591, 39.454,  8.875)
n =  length(x)
library(MASS)
fitdistr(x,"weibull")
#  OUTPUT from R:
#
#       shape        scale
#    0.9839245   11.4852981
#  ( 0.1512936) ( 2.4660607)
#gamma = 0.9839245
#alpha = 11.4852981
gamma = fitdistr(x,"weibull")$estimate[1]
alpha = fitdistr(x,"weibull")$estimate[2]

B  =  1000
W  =  matrix(0,B,n)
A =  numeric(B)
A =  rep(0,B)
G =  numeric(B)
G =  rep(0,B)
S = numeric(B)
S = rep(0,B)
{
for (i in 1:B) 
W[i,]  =  rweibull(n,gamma,alpha)
}

{
for (i in 1:B) 
G[i] = fitdistr(W[i,],"weibull")$estimate[1]
}
{
for (i in 1:B) 
A[i] = fitdistr(W[i,],"weibull")$estimate[2]
}
{
for (i in 1:B) 
S[i] = exp(-(20/A[i])^G[i])
}
summary(S)
sd(S)
boxplot(S,ylab="S(20)",main="Boxplot of 1000 values of S(20)")
out=c(mean(G),sd(G),mean(A),sd(A))

