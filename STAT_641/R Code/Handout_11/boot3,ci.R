x= c(1354,1552,1766,1325,2183,1354,1299,627,695,2586,
2420,71,2195,1825,159,1577,3725,884,1014,965)
n = length(x)
mn= mean(x)
thest = exp(-1200/mn)
R = 9999
thestS = numeric(R)
thestS = rep(0,times =R)
for (i in 1:R)
thestS[i] = exp(-1200/mean(sample(x,replace=TRUE)))
RS = sort(thestS-thest)
LRS = RS[250]
URS = RS[9750]
thL = thest-URS
thU = thest-LRS

thL
thU

