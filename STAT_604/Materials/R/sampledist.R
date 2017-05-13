samplexbars <- function(pop, n) {
  N <- length(pop)
  inds <- combn(1:N, n)
  xbars <- rep(0, choose(N,n))
  for(i in 1:choose(N,n)) xbars[i] <- mean(x[inds[1:n,i]])
  par(col = "darkblue", bg = "aliceblue")
  hist(xbars, freq = F, xlab = expression(bar(x)), 
       ylab = "Sampling Distribution", col = "darkgreen", 
       border = "gold", col.axis = "darkblue",
       main = "Histogram of Sample Means")
  box(col="darkblue")
  return(list(xbars = xbars, mean = mean(xbars), se = ((N-n)*sd(xbars)/(N-1)) ))
}
