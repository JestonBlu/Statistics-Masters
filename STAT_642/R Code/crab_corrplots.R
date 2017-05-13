# R CODE FOR DISPLAYING CORRELATION PLOTS FOR HERMIT CRAB DATA EXAMPLE
#crab_corrplots.R
 data = matrix(0,150,2)
 y  = matrix(0,150,1)
 data  = scan("u:/meth2/kuehl/expl4-1.dat",list(a = 0,b = ""))
 y  = data$a
 site  = data$b
 d = data.frame(y,site)
 anal1  = aov(y ~ site,data = d)
 rs1  = resid(anal1,type = "response")
 rstime1  = ts(rs1,start = 1,frequency = 1)
 abline(h = 0,lty = 2)
 rsraw  = rs1[2:150]
 rsrawl1  = rs1[1:149]
 plot(rstime1,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order")
 plot(rsrawl1,rsraw,main = "Resid_Raw Lag Plot")

#Calculation of Durbin-Watson Statistics

dif1  = (rsraw-rsrawl1)^2
num1  = sum(dif1)
rs12  = rs1^2
den1  = sum(rs12)
DW1  = num1/den1
prd1  = rsraw*rsrawl1
prdsum1  = sum(prd1)
rho1  = prdsum1/den1
