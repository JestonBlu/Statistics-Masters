x =  c(3,5,7,18,43,85,91,98,100,130,230,487)
x = sort(x)
n =  length(x)
thest  =  mean(x)
V  =  thest**2/n
R  =  9999
Z  =  numeric(R)
Z  =  rep(0,times =R)
W  =  numeric(R)
W  =  rep(0,times =R)
for (i in 1:R) 
W[i]  =  mean(sample(x,replace=TRUE))
Z  =  sqrt(n)*(W-thest)/W
Z  =  sort(Z)
L  =  Z[250]
U  =  Z[9750]
thL  =  thest-U*sqrt(V)
thU  =  thest-L*sqrt(V)

thL
thU

