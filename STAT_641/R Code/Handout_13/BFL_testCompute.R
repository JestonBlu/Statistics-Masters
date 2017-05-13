 

y1=c(4.2,2.9,.2,25.7,6.3,7.2,2.3,9.9,5.3,6.5)
y2=c(.2,11.3,.3,17.1,51,10.1,.3,.6,7.9,7.2)
y3=c(7.2,6.4,9.9,3.5,10.6,10.8,10.6,8.4,6,11.9)
n1 = length(y1)
n2 = length(y2)
n3 = length(y3)
y = c(y1,y2,y3)
grp = c(rep(1,n1),rep(2,n2),rep(3,n3))
grp = as.factor(grp)

#Levene's Median Test on Raw Data

 m1 = median(y1)
 z1 = abs(y1-m1) 
 m2 = median(y2)
 z2 = abs(y2-m2) 
 m3 = median(y3)
 z3 = abs(y3-m3) 
 z = c(z1,z2,z3)
 lev1  =  aov(z~grp)
 z1
 m1
 z2
 m2
 z3
 m3
 summary(lev1)
