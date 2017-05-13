islandsum<-read.csv("/Users/Elizabeth/Documents/TAMU/stat608/Data/Island.csv", header=TRUE)

attach(islandsum)


#This division is elementwise.
pext<- Ext/SpeciesRisk


#We're going to transform the predictor as well.
xnew<-log(Area)

#Plotting our new x by the logit should give a linear relationship:
par(cex.axis=2,cex.lab=2, mar=c(5,5,2,5),lwd=2, pch=19)
plot(xnew, logit, xlab="log(Area)", ylab="Logit(p_extinct)", yaxt="n")
axis(2, c(-3, -2, -1, 0))
axis(4,  c(-3, -2, -1, 0), labels=c("0.05", "0.12", "0.27", "0.50"))
mtext("Prop Extinct", side=4, cex=2, line=3)
abline(lm(logit~xnew))



#This code turns our summary into a table where each row is a single observation.
island<-matrix(NA, nrow=sum(SpeciesRisk), ncol=2)
rownum<-dim(islandsum)[1]
k<-1
for(i in 1:rownum){
  for(j in 1:Ext[i]){
    island[k, 1]<-1
    island[k, 2]<-Area[i]
    k<-k+1
  }
  for(l in(Ext[i] + 1):SpeciesRisk[i]){
  island[k, 1] <-0
  island[k, 2]<- Area[i]
  k <- k+1
  }
}

colnames(island)<-c("iExt", "Area2")
island.data<-data.frame(island)
xt<-log(island.data$Area2)

par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2),lwd=2)
boxplot(island.data$Area2 ~ island.data$iExt, ylab="Area (km^2)")
boxplot(xt ~ island.data$iExt, ylab="log(Area)")


#Here's the correct model fit:
not.ext<-SpeciesRisk - Ext
logm<- glm(cbind(Ext, not.ext) ~ xnew, family = binomial())
summary(logm)
#Predicted values from this fit (compare with pext):
logm$fitted


#Jittered Plot of Sugars By Indicator of Child

xx<-seq(-2.5,5,0.01)  #The amount of sugar has a minimum of 0 and a max of 15.
yy<-1/(1 + exp(-1*(logm$coeff[1] + logm$coeff[2]*xx)))
par(cex.axis=2,cex.lab=2, mar=c(5.1,5.1,2,2))
plot(jitter(xt, amount=0.2), jitter(island.data$iExt, amount=0.03), xlab="log(Area)", 
    pch= 19, ylab = "Indicator of Extinct")
lines(xx,yy)

#Keep that window open, and add the nonparametric curve:
myx<-xt
loessfit1 <- loess(island.data$iExt ~ myx, degree=1, span=2/3)
lines(xx,predict(loessfit1,data.frame(myx=xx)),lty=2,col=2)




#Here are residuals for the correct model:
hvalues <- influence(logm)$hat
stanresDeviance <- residuals(logm)/sqrt(1-hvalues)
stanresPearson <- residuals(logm,"pearson")/sqrt(1-hvalues)
par(cex.axis=2,cex.lab=2, mar=c(5,5,2,5),lwd=2, pch=19)
plot(xnew,stanresDeviance,ylab="Stdzd Dev Residuals",xlab="log(Area)",ylim=c(-2.2,2.2))
plot(xnew,stanresPearson,ylab="Stdzd Pearson Residuals",xlab="log(Area)",ylim=c(-2.2,2.2))

#If you try to fit the model this way, you get the wrong df.  Parameter estimates are okay.
wrongm<- glm(island.data$iExt ~ xt, family = binomial()) 


#To calculate the Pearson chi-square goodness-of-fit test:
sum(residuals(logm,type="pearson")^2)


