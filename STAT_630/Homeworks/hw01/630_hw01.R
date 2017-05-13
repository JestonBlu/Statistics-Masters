
ss.match = function(sims, N, n) {
  
  ## create an empty object
  results = NULL
  
  for (i in 1:sims){
    
    ## create a random sample of 10000 possibilities
    random.event = sample(N, size = n, replace = TRUE)
    
    ## sort and take the difference of each number
    difference = diff(sort(random.event))
    
    ## search for zero to find a match
    match = any(difference == 0)
    
    ## bind results to tabulate the probabily
    results = rbind(results, match)
  }
  
  ## devide the number of matches by the total simulations
  output = length(results[results == TRUE])/sims
  
  ## return the estimated probability
  return(output)
  
}

## function for estimating the probability of matching
## the last 4 digits of a social security number in a
## group of 100 people
ss.match(sims = 20000, N = 10000, n = 100)

## actual probability
1 - exp(lfactorial(10000) - lfactorial(10000 - 100) - 100 * log(10000))


table = NULL

for (i in 100:125) {
  
  ## estimate the probability for 100 students through 125 students
  results = data.frame("obs" = i, "probability" = ss.match(5000, 10000, i))
  table = rbind(table, results)
  
}

print(table)


