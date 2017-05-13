n = 130
G =  .95
P =  .90
m =  0
imin =  0
i =  0
ans =  0
anst =  0
r =  1:n
ans =  pbinom(r-1,n,1-P)
while(i<n)
{
i =  i+1
if(ans[i]<=1-G)  anst[i] =  ans[i]
if(ans[i]>1-G) anst[i] =  -1
}
ansmax =  max(anst)
imax =  which(anst==ansmax)
m =  imax
coverage =  1-ans[m]
out = cbind(m, coverage)
out
