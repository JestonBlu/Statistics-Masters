
npeople=23

nreps=100000
xdiff=rep(0,nreps)

x=sample(1:365,npeople,replace=TRUE)  # sample npeople birthdays

y=sort(x)  # arrange the npeople birthdays in order

z=diff(y) #compute the number of days apart for adjacent birthdays

min(z) # Find the smallest difference between birthdates 

for ( i in 1:nreps) xdiff[i]= min(diff(sort(sample(1:365,npeople,replace=TRUE)))) 
# Find the smallest difference between birthdates in each of nreps samples

sum(xdiff==0)  #  Count how many samples have at least one duplicated birthdate
sum(xdiff==0)/nreps  # estimate the probability that at least one birthday is duplicated
1-exp(lfactorial(365)-lfactorial(365-npeople)-npeople*log(365)) # compute probability of above
  
# next we compute the probabilities for n=10 to 45
npeople=10:45
probs=rep(0,length(npeople))

for (i in 1:length(npeople)) probs[i]=1-exp(lfactorial(365)-lfactorial(365-npeople[i])-npeople[i]*log(365))

y=cbind(npeople,probs)

y
