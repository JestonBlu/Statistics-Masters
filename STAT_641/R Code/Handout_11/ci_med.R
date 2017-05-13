n = 50
cov = .95
r = 0
imin = 0
i = 0
ans = 0
anst = 0
m = 1:n
ans = pbinom(n-m,n,.5)-pbinom(m-1,n,.5)
while(i<n)
{
i = i+1
if(ans[i]<cov)  anst[i] = 2
if(ans[i]>=cov) anst[i] = ans[i]
}
ansmin = min(anst)
imin = which(anst==ansmin)
r = imin
coverage = ans[r]
r
coverage


