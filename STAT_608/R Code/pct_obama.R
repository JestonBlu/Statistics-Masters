library(gdata)  #This library contains the trim function; if you don't want to install this package right now, there 
#are other options for running this code below.

#Read in the data from the .csv file:  (header=TRUE is the default for read.csv)
election<-read.csv("/Users/Elizabeth/Documents/TAMU/stat608/sp13/pct_obama.csv",header=TRUE)  #Mac code: Use SHIFT+ENTER to run
election<-read.csv("U:\\608\\sp13\\Notes\\pct_obama.csv", header=TRUE)                        #Windows code:  use CTRL+R to run

#Now I'd like to plot the data on a scatterplot.  To be able to add the regression line, first I create the regression:
my.lm<-lm(election$Obama_12~election$Obama_08)  
#If you want to see the results, type summary(my.lm) or anova(my.lm).  
#The response variable comes first; explanatory variables are separated by a plus sign.
#mar vector is of form c(bottom, left, top, right).  Default is (5.1, 4.1, 4.1, 2.1).

par(cex.axis = 2, cex.main=2, cex.lab=2, mar=c(9,5,1,3))  
#These options change the plotting parameters; I like to always run something similar 
#because the default selections result in type face that's too small for the average person.
plot(election$Obama_08,election$Obama_12,xlab="% Obama 2008", ylab="% Obama 2012")  
#Here the x-variable is listed first.
abline(my.lm)  #This adds the regression line to the existing plot; it won't work if you've closed the plot window already.


#Notice that D.C. is a huge outlier!  90% voted for Obama!  Drop D.C. out of the data set for now:
#states50<-subset(election,State!='D.C. ')  
#D.C. had a space after it.  Eliminating the pound sign from the beginning of this line of code will just give you the subset of data you need.  Or learn the trim function:
election<-trim(election)
states50<-subset(election, State!='D.C.')

#Now we can run the plot again, this time without D.C.
my.lm2<-lm(states50$Obama_12~states50$Obama_08) 
par(cex.axis = 2, cex.main=2, cex.lab=2, mar=c(5,5,1,1))  
plot(states50$Obama_08,states50$Obama_12,xlab="% Obama 2008", ylab="% Obama 2012")
abline(my.lm2)

#Let's check this model using some residual plots; the lm command has residuals stored in my.lm2$residuals.
#Depending on what platform you work on, you don't have to keep using this par command.  I always forget and close the plot window on my Mac, so I keep writing it out.  
par(cex.axis = 2, cex.main=2, cex.lab=2, mar=c(9,5,1,3))
plot(states50$Obama_08,my.lm2$residuals,xlab="% Obama 2008", ylab="Residuals")
#Or plot residuals against predicted values:
par(cex.axis = 2, cex.main=2, cex.lab=2, mar=c(9,5,1,3))
plot(my.lm2$fitted.values,my.lm2$residuals,xlab="Predicted values", ylab="Residuals")

#And check normality of the residuals:
par(cex.axis = 2, cex.main=2, cex.lab=2, mar=c(9,5,2.5,3))  #Here I am changing the top margin.
qqnorm(my.lm2$residuals,pch=16) #The pch command changes the plotted character to a solid circle - better for slides.
qqline(my.lm2$residuals)


