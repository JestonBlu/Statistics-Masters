par(ask=TRUE)

site1=c(0,0,22,3,17,0,0,7,11,11,73,33,0,65,13,44,20,27,48,104,233,81,22,9,2)
site2=c(0,0,56,0,8,0,3,1,16,55,142,10,2,145,6,4,5,124,24,204,415,466,6,14,12)
site3=c(0,0,4,13,5,1,1,4,4,36,407,0,0,18,4,14,0,24,52,314,245,107,5,6,2)
site4=c(0,0,0,4,2,2,5,4,2,1,0,12,1,30,0,3,28,2,21,8,82,12,10,2,0)
site5=c(0,1,1,2,2,1,2,29,2,2,0,13,0,19,1,3,26,30,5,4,94,1,9,3,0)
site6=c(0,0,0,2,3,0,0,4,0,5,4,22,0,64,4,4,43,3,16,19,95,6,22,0,0)

site = c(site1,site2,site3,site4,site5,site6)


data6 = matrix(site,nrow=6,byrow=T)
resid = matrix(0,6,25)
residl1 = matrix(0,6,24)
resid1 = matrix(0,6,24)
dif1 = matrix(0,6,24)
prd1 = matrix(0,6,24)
DW     = c(0,0,0,0,0,0)
rho    = c(0,0,0,0,0,0)
means6 = c(0,0,0,0,0,0)

for (i in 1:6) {
  means6[i] = mean(data6[i,])
   resid[i,]   = data6[i,]-means6[i]
   resid1[i,]  = resid[i,2:25]
   residl1[i,] = resid[i,1:24]

  for (j in 1:24){
    
    dif1[i,j] = (resid1[i,j]-residl1[i,j])^2
    prd1[i,j] = resid1[i,j]*residl1[i,j]

  }
   rho[i] = sum(prd1[i,])/sum((resid[i,])^2)

   DW[i] = sum(dif1[i,])/sum((resid[i,])^2)

  } 

 rstime1  = ts(resid[1,],start = 1,frequency = 1)
plot(rstime1,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=1")
 abline(h = 0,lty = 2)
 rstime2  = ts(resid[2,],start = 1,frequency = 1)
plot(rstime2,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=2")
 abline(h = 0,lty = 2)
 rstime3  = ts(resid[3,],start = 1,frequency = 1)
plot(rstime3,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=3")
 abline(h = 0,lty = 2)
 rstime4  = ts(resid[4,],start = 1,frequency = 1)
plot(rstime4,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=4")
 abline(h = 0,lty = 2)
 rstime5  = ts(resid[5,],start = 1,frequency = 1)
plot(rstime5,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=5")
 abline(h = 0,lty = 2)
 rstime6  = ts(resid[6,],start = 1,frequency = 1)
plot(rstime6,type = "b",ylab = "res_raw",main = "Resid_Raw vs Order Habitat=6")
 abline(h = 0,lty = 2)




plot(residl1[1,],resid1[1,],main = "Resid_Raw Lag Plot - Habitat 1")
plot(residl1[2,],resid1[2,],main = "Resid_Raw Lag Plot - Habitat 2")
plot(residl1[3,],resid1[3,],main = "Resid_Raw Lag Plot - Habitat 3")
plot(residl1[4,],resid1[4,],main = "Resid_Raw Lag Plot - Habitat 4")
plot(residl1[5,],resid1[5,],main = "Resid_Raw Lag Plot - Habitat 5")
plot(residl1[6,],resid1[6,],main = "Resid_Raw Lag Plot - Habitat 6")




n.neg = rep(0,6)
n.pos = rep(0,6)
for (i in 1:6) {
  n.neg[i] = length(resid[i,][resid[i,]<0])
  n.pos[i] = length(resid[i,][resid[i,]>0])
  }
 
numb.runs = rep(1,6)
for (i in 1:6) {
  for (j in 2:25) {
    if (sign(resid[i,j]) != sign(resid[i,j-1])) {numb.runs[i] <- numb.runs[i] + 1}
    }
  }
  
residruns.result <- as.data.frame(cbind(numb.runs, n.pos, n.neg))
names(residruns.result) <- c("No. runs", "N+", "N-")








