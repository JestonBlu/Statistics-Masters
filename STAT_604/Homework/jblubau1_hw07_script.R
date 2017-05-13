# name: jblubau1_hw07_script.r
# path: ~/Projects/learning/Statistics/STAT_604/Homework
# created by: Joseph Blubaugh
# created on: 24 Sept 2016
# purpose: Homework 07
# last ran:
Sys.time()

# Clean the workspace
ls(); rm(list = ls())

# 1) Read in file
dta <- read.csv("/home/jeston/Projects/learning/Statistics/STAT_604/Data/cisco.csv")

# 2) Define PDF device
pdf(file = "/home/jeston/Projects/learning/Statistics/STAT_604/Homework/jblubau1_hw07_graph.pdf", 
    width = 11, height = 8.5, onefile = TRUE)

# 3) 
## a) assign alpha value
N <- 30; alpha <- 2 / (1 + N)

## b) create empty vector of 0s
results <- rep(0, nrow(dta))

## c) put the 30 day avg of the first 30 days into the 30th position on results
results[30] <- mean(dta$Adj.Close[1:30])

## d) use a loop to fill in the moving average formula
for (i in 31:6655) {
  results[i] <- (dta$Adj.Close[i] * alpha) + (results[i-1] * (1 - alpha))
}

## e) graph the last 260 days
plot(x = 1:260, y = results[6396:6655], type = "l", col = "purple", ylim = c(0, 35),
     xlab = "Days", ylab = "Adjusted Closing Price", main = "30 Day EMA and Daily Stock Prices")

## f) add formula for EMA
text(x = 0, y = 2, adj = 0,
     labels = bquote(paste("EMA")[i] == (paste("P")[i] %*% alpha) + 
                           (paste("EMA")[i-1] %*% (1 - alpha)) ~ ~ paste("where") ~ ~ 
                           alpha == frac(2,1+.(N))))

## g) add actual values
lines(x = 1:260, y = dta$Adj.Close[6396:6655], col = "green2")

# 4) Turn code into function
plt.fun <- function(x, n = 30, limit = 35) {
  N <- n; alpha <- 2 / (1 + n)
  results <- rep(0, length(x))
  results[n] <- mean(dta$Adj.Close[1:n])
  for (i in (n+1):length(x)) {
    results[i] <- (dta$Adj.Close[i] * alpha) + (results[i-1] * (1 - alpha))
  }
  plot(x = 1:260, y = results[(length(results)-259):length(results)], 
       type = "l", 
       col = "purple", 
       ylim = c(0, limit),
       xlab = "Days", 
       ylab = "Adjusted Closing Price", 
       main = paste(N, "Day EMA and Daily Stock Prices"))
  
  text(x = 0, y = 2,adj = 0,
       labels = bquote(paste("EMA")[i] == (paste("P")[i] %*% alpha) + 
                             (paste("EMA")[i-1] %*% (1 - alpha)) ~ ~ paste("where") ~ ~ 
                             alpha == frac(2,1+.(N))))
  lines(x = 1:260, y = dta$Adj.Close[(length(x)-259):length(x)], col = "green2")
}

# 5) Fix Margins
par(mfrow = c(1, 2),
    omi = c(.5, .5, 1.5, .5),
    mar = c(4, 4, 2, 0))

# 6) Call Plots
plt.fun(x = dta$Adj.Close)
plt.fun(x = dta$Adj.Close, n = 100)

# 7) Write system time
mtext(text = Sys.time(), side = 1, adj = 0, outer = TRUE)

dev.off()








