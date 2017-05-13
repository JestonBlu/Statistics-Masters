CLT.sim <- function(n = 30, dist = "normal", params = c(0, 1), 
                    reps = 10000) {
#------------------------------------------------------------------------
#  R function to investigate the behavior of the sampling distribution
#  of the sample mean via Monte Carlo simulation.
#
#
#  ARGUMENTS:
#    n = a positive integer scalar containing the size of the samples.
#        The default value is n = 30.
#    dist = a character variable indicating the distribution of the
#           population from which the samples are to be generated.
#           Allowed values of dist are "normal", "uniform", and 
#           "gamma".  The default is dist = "normal".
#    params = a real vector of length two containing the values of the
#             parameters for the distribution specified in dist.  The
#             default value is params = c(0, 1), in accordance with the
#             standard normal distribution (mean of zero, and standard
#             deviation one).  If dist = "uniform", the default value
#             remains c(0, 1), corresponding to the lower and upper 
#             bounds of a uniform(0, 1) distribution.  If dist = "gamma",
#             the default value will be changed (within the program)
#             to c(1, 1), corresponding to a gamma distribution with
#             shape = 1 and scale = 1 (an exponential(1) distribution).
#    reps = a positive integer scalar indicating the number of samples
#           of size n from distribution specified in dist.  The default
#           value is reps = 10000.
#
#  DETAILS: Regarding the parameter values for the three distributions,
#           refer to the details in the help files for the respective
#           distributions.
#
#  VALUE: The function CLT.sim opens a graphics window that contains
#         two plots.  The plot on the left is a graph of the shape of
#         the distribution of the population from which the samples are
#         generated.  The plot of the right is of a histogram of the
#         reps values of the sample mean with the normal theory curve
#         superimposed in red, and returns a list containing the
#         following scalar objects:
#         pop.mean = the mean of the population,
#         pop.stdev = the standard deviation of the population,
#         sterr.xbar = the theoretical standard error of the sample
#                      mean (= pop.stdev/sqrt(n)), 
#         xbar.mean = the mean of the reps sample means, and
#         stdev.xbar = the standard deviation of the reps sample means.
#
#  SEE ALSO: rnorm, runif, rgamma, and apply
#
#  EXAMPLES: 
#     CLT.sim()  
#     CLT.sim(n = 15, dist = "uniform", params = c(-1,1))
#     CLT.sim(n = 10)
#     CLT.sim(n = 100, dist = "gamma", reps = 25000)
#
#  Written: 07/28/2012 Jane L. Harvill 
#------------------------------------------------------------------------
  eps <- 1e-08
#
#  Check validity of input:
#
#  Sample size and reps first:
#
  if(abs(n - as.integer(n)) > 0) stop("\n n must be an integer.\n")
  if(n < 1) stop("\n n must be an integer greater than 0.\n")
  if(abs(reps - as.integer(reps)) > 0) stop("\n reps must be an integer.\n")
  if(reps < 1) stop("\n reps must be an integer greater than 0.\n")
#
#  Value of dist:
#
  if(dist != "normal" && dist != "uniform" && dist != "gamma")
    stop("\n Please specify an allowable name for dist.\n")
#
#  Check for parameters passed if dist = "gamma".  If defaults are
#  not changed, then change them.
#
  if(dist == "gamma" && abs(params[1]) < eps && abs(params[2] - 1) < eps)
    params <- c(1, 1)
#
#  Parameter values based on value of dist.
#
  if(dist == "normal") {
    if(params[2] < eps) {
      stop("\n The standard deviation must be positive.\n")
    }
  }
  if(dist == "uniform") {
    if((params[2] - params[1]) < eps) {
      stop("\n The lower bound must exceed the upper bound.\n") 
    }
  }
  if(dist == "gamma") {
    if(params[1] < eps || params[2] < eps) {
      stop("\n The parameters of a gamma distribution are positive.\n")
    }
  }
#
#  Compute population parameters and generate samples.
#  
  if(dist == "normal") {
    distn <- "Normal"
    mu    <- params[1]
    sigma <- params[2]
    x     <- matrix(rnorm(n = n*reps, mean = mu, sd = sigma), nrow = n, ncol = reps)
    y     <- seq(from = mu - 3.5*sigma, to = mu + 3.5*sigma, length = 101)
    fy    <- dnorm(y, mean = mu, sd = sigma)
    prtxt <- bquote(group("(",list(mu, sigma),")") == group("(",list(.(mu),.(sigma)),")") )
  }
  if(dist == "uniform") {
    distn <- "Uniform"
    mu    <- (params[1] + params[2])/2
    sigma <- (params[2] - params[1])/sqrt(12)
    x     <-  matrix(runif(n = n*reps, min = params[1], max = params[2]), nrow = n, ncol = reps)
    y     <- c(params[1], params[2])
    fy    <- rep(1/(params[2] - params[1]), times = 2)
    prtxt <- bquote(group("(",list(a, b),")") == group("(",list(.(params[1]),.(params[2])),")") )
  }
  if(dist == "gamma") {
    distn <- "Gamma"
    mu    <- params[1]*params[2]
    sigma <- sqrt(params[1])*params[2]
    x     <- matrix(rgamma(n = n*reps, shape = params[1], scale = params[2]), nrow = n, ncol = reps)
    y     <- seq(from = eps, to = 8*sigma, length = 101)
    fy    <- dgamma(y, shape = params[1], scale = params[2])
    prtxt <- bquote(group("(",list(alpha, beta),")") == group("(",list(.(params[1]),.(params[2])),")") )
  }

  xbars  <- apply(x, 2, mean) 
  mm     <- mean(xbars)
  sxbar  <- sd(xbars)
  sexbar <- sigma/sqrt(n)
#
#  Set up normal theory curve.
#
  xx     <- seq(from = min(xbars), to = max(xbars), length = 101)
  yy     <- dnorm(xx, mean = mu, sd = sexbar)
#
#  Set up plotting objects.
#
  ht     <- hist(xbars, plot = FALSE)
  to.y   <- seq(from = 0, to = max(yy, ht$density), length = 11) 
  par(mfrow = c(1, 2), bg = "aliceblue", col = "darkblue", 
      col.sub = "darkblue")
  del    <- 2*(ht$breaks[2] - ht$breaks[1])
#
#  Create graph of distribution of population from which samples
#  are generated.
#
  plot(y, fy, xlab = "x", ylab = "f(x)", type = "l", col = "darkblue")
  mtext(paste("Distribution of",distn,"Parent Population"), side = 3, 
        line = 2, cex = 1.25, col = "darkblue")
  mtext(prtxt, side = 3, line = 0.54, cex = 1.00, col = "darkblue")
# 
#  Create histogram with normal theory curve superimposed.
#
  plot(ht, freq = FALSE, ylim = c(0, max(yy, ht$density)), 
       xlim = c(min(ht$breaks, xx), max(ht$breaks, xx)), 
       xlab = expression(bar(x)), ylab = expression(f(bar(x))),
       main = " ", col = "darkgreen", border = "gold", axes = FALSE)
  box(col = "darkblue")
  lines(xx, yy, col = "red")
  axis(side = 1, at = ht$breaks, labels = TRUE, tick = TRUE, 
       col = "darkblue", cex = 0.75)
  axis(side = 2, labels = TRUE, tick = TRUE, col = "darkblue", cex = 0.75,
       at = round(to.y, 3))
  mtext(paste("Sampling Distribution of Sample Means, n =",n), side = 3, 
        line = 2, cex = 1.25, col = "darkblue")
  mtext(bquote(group("(",list(mu[bar(x)], sigma[bar(x)]),")") == 
               group("(",list(.(mu),.(round(sexbar,4))),")") ),
        side = 3, line = 0.5)

#
#  Return list of values.
#
  return(list(pop.mean = mu, pop.stdev = sigma, sterr.xbar = sexbar, 
              xbar.mean = mm, stdev.xbar = sxbar))
}