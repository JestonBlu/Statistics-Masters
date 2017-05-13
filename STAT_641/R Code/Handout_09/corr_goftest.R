# Correlation Test vs Shapiro-Wilks 

x = c(156,162,168,182,186,190,190,196,202,210,214,220,226,
      230,230,236,236,242,246,270)
y = sort(x)
n = length(x)
i = seq(1,n,1)
u = (i-.375)/(n+.25)
q = qnorm(u)
r = cor.test(q,y)
SW = shapiro.test(y)

#R = 0.990681 with p-value = .95 (from page 29 in Handout 9) 

#        Shapiro-Wilk normality test


#data:  y 
#W = 0.9757, p-value = 0.8667

#From Minitab, RJ = .992 with p-value > .10