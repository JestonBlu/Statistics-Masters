x= c(1354,1552,1766,1325,2183,1354,1299,627,695,2586,
2420,71,2195,1825,159,1577,3725,884,1014,965)
n= length(x)
m= sum(x>1200)
thest = m/n
B = 9999
thestS = numeric(B)
thestS = rep(0,times =B)
for (i in 1:B)
thestS[i] = sum(sample(x,replace=TRUE)>1200)/20
RS = sort(thestS-thest)
LRS = RS[250]
URS = RS[9750]
thL = thest-URS
thU = thest-LRS
thL
thU