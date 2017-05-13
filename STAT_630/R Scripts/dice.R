sample(1:6,1)  #  Take a sample of size one from 1,2,...,6

x=sample(1:6,10,replace=TRUE)  #  Take 10 samples of size 1 from 1,2,...,6
x   #  Print the sample

sum(x==6) #  How many equal 6?


x=sample(1:6,60000,replace=TRUE) # Toss a die 60000 times

for (i in 1:6) print(c(i,sum(x==i)))  # Count how many of each value

plot(1:60000,cumsum(x==1)/(1:60000),type="l") # Look at the cumulative proportion of 1s
plot(1:60000,cumsum(x==1)/(1:60000),type="l",main="Proportion of Ones",xlab="trials",ylab="proportion")


tosses=rep(0,10000)  # Form a vector of 10000 zeroes

for (i in 1:10000) tosses[i]=sum(sample(1:6,2,replace=TRUE)) # Compute 10000 sums of tosses of 2 dice

hist(tosses,breaks=(1:12)+.5)  # Draw a histogram of the tosses

trueprobs=c(1:6,5:1)/36
cbind(table(tosses)/10000,trueprobs) # compare proportions to probabilities


hist(tosses,breaks=(1:12)+.5,freq=FALSE)  # Draw a rel. freq. histogram of the tosses
for(i in 2:12)lines(c(i-1/2,i+1/2),c(trueprobs[i-1],trueprobs[i-1]),col=2)



plot(c(0,10000),c(6.5,7.5),type="n",xlab="tosses",ylab="sample mean",main="Sample Mean as a Function of Number of Tosses")
lines(1:10000,cumsum(tosses)/(1:10000)) # plot mean as function of n
lines(c(0,10000),c(7,7),col=2)


sum(tosses==7)+sum(tosses==11) #  Count how many wins on the first toss