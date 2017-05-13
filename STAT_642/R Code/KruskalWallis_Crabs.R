

# R CODE FOR THE COMPUTATION OF TRANSFORMATION
# FOR DATA IN EXAMPLE 4.1 IN TEXTBOOK
#
# (file is in longneck/meth2/crabtrans.s)
#
# ----------------------------------------------------------------------------
# Read data from an external file:

# data =  matrix(0,150,2)
# y =  matrix(0,150,1)
# data =  scan("u:/meth2/Rfiles/expl4-1.dat",list(a=0,b=""))
# site =  data$b
# y =  data$a
# t=  length(levels(factor(site)))
# d=data.frame(y,site)
# y = matrix(y,6,25,byrow=TRUE)

# Directly input the data and create factor variable Site:

 data =  matrix(0,150,2)
 y =  matrix(0,150,1)

yhab1 = c(0,0,22,3,17,0,0,7,11,11,73,33,0,65,13,44,20,27,48,104,233,81,22,9,2)
yhab2 = c(0,0,56,0,8,0,3,1,16,55,142,10,2,145,6,4,5,124,24,204,415,466,6,14,12)
yhab3 = c(0,0,4,13,5,1,1,4,4,36,407,0,0,18,4,14,0,24,52,314,245,107,5,6,2)
yhab4 = c(0,0,0,4,2,2,5,4,2,1,0,12,1,30,0,3,28,2,21,8,82,12,10,2,0)
yhab5 = c(0,1,1,2,2,1,2,29,2,2,0,13,0,19,1,3,26,30,5,4,94,1,9,3,0)
yhab6 = c(0,0,0,2,3,0,0,4,0,5,4,22,0,64,4,4,43,3,16,19,95,6,22,0,0)
y = c(yhab1,yhab2,yhab3,yhab4,yhab5,yhab6)
s1 = rep("h1",25)
s2 = rep("h2",25)
s3 = rep("h3",25)
s4 = rep("h4",25)
s5 = rep("h5",25)
s6 = rep("h6",25)
hab = c(s1,s2,s3,s4,s5,s6)
site = as.factor(hab)
d=data.frame(y,site)

kruskal.test(y,site,y~site)

library(pgirmess)
kruskalmc(y~site)




