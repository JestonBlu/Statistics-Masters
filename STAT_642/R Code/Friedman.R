# Example of application of Friedman's test on the Skin Potential Data


library(stats)

y = c(26.1, 81.0, 10.5, 26.6, 12.9, 57.2, 25.0, 20.3,
      22.7, 53.2,  9.7, 19.6, 13.8, 47.1, 13.6, 23.6,
      22.5, 53.7, 10.8, 21.1, 13.7, 39.2, 13.7, 16.3,
      22.6, 53.1,  8.3, 21.6, 13.3, 37.0, 14.8, 14.8)

trt =c(rep("F",8), rep("H",8), rep("D",8), rep("C",8)) 


subj = c(seq(1:8), seq(1:8), seq(1:8), seq(1:8))

friedman.test(y,trt,subj,y~trt+subj)

#Output from program run:

#        Friedman rank sum test

# data:  y, trt and subj 
# Friedman chi-squared = 6.45, df = 3, p-value = 0.09166
