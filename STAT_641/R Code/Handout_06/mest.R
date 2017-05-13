# mest1.R:
x  =  scan("u:/meth1/Rfiles/ozone1w.DAT")
t  =  1.345
mx  =  median(x)
y  =  abs(x-mx)
my  =  median(y)
v  =  my/.6745
n  =  length(x)
k  =  30
r  =  k+1
mest1  =  matrix(0,r,1)
s =  matrix(0,r,1)
p =  matrix(0,r,1)
mest1[1]  =  median(x)
w  =  matrix(0,n,1)
for(j in 1:k)
{ 
m  =  mest1[j]
for(i in 1:n)
{
if               (x[i] < m-t*v)  w[i]  =  -t*v/(x[i]-m)
if (m-t*v <= x[i] && x[i] <= m+t*v)      w[i]  =  1
if               (x[i] > m+t*v)  w[i]  =  t*v/(x[i]-m)
}
s[j]  =  sum(w)
p[j]  =  t(x)%*%w
mest1[j+1]  =  p[j]/s[j] 
}


#mest2.s:

x  =  scan("u:/meth1/Rfiles/ozone1w.DAT")
t  =  1.345
mx  =  median(x)
y  =  abs(x-mx)
mad  =  median(y)
v  =  mad/.6745
n  =  length(x)
mest2  =  median(x)
m  =  mest2
lastm  =  2*m 
w  =  matrix(0,n,1)
nit  =  1
while(abs((mest2-lastm)/lastm)>1.e-8)
{ 
lastm  =  mest2
m  =  mest2
for(i in 1:n)
{
if               (x[i] < m-t*v)  w[i]  =  -t*v/(x[i]-m)
if (m-t*v <= x[i] && x[i] <= m+t*v)      w[i]  =  1
if               (x[i] > m+t*v)  w[i]  =  t*v/(x[i]-m)
}
s  =  sum(w)
p  =  t(x)%*%w
mest2  =  p/s 
nit  =  nit+1

}

