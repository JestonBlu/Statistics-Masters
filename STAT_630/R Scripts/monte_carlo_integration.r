integrand=function(x){sin(x)*exp(-x^2/2)}
integrate(integrand, lower = 0, upper = Inf)  # numeric integration

n=1000000
 x=rnorm(n)  
temp=sqrt(2*pi)*sin(x[x>0])
sum(temp)/n   #  Monte Carlo integral using normal distribution


temp=sqrt(2*pi)*sin(x)*as.numeric(x>0)
mean(temp)
sd(temp)
mean(temp)-3*sd(temp)/sqrt(n)  # confidence bounds  
mean(temp)+3*sd(temp)/sqrt(n)

xn=abs(x)
temp=sqrt(pi/2)*sin(xn)
mean(temp)             # Monte Carlo integral using half normal distribution
sd(temp)
mean(temp)-3*sd(temp)/sqrt(n)
mean(temp)+3*sd(temp)/sqrt(n)


