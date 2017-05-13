rm(list = ls())

hof = read.csv("STAT_636/Data/HOF_tr.csv")

## required packages
library(randomForest)
library(e1071)

## remove years and position
hof = hof[, -c(2, 3, 5)]

## create some additional metrics
hof$SO.P.AB = round(with(hof, SO / AB) * 100, 1)
hof$BB.P.AB = round(with(hof, BB / AB) * 100, 1)
hof$HR.P.AB = round(with(hof, HR / AB) * 100, 1)
hof$TP.P.H = round(with(hof, TP / H) * 100, 1)
hof$DB.P.H = round(with(hof, DB / H) * 100, 1)
hof$SB.P.H = round(with(hof, SB / (H - HR)) * 100, 1)

## scale the data
hof.scale = data.frame(scale(hof[, 2:24], center = TRUE, scale = TRUE))
hof.scale$HOF = hof$HOF

## Setup data frame for the leave one out cross validation
LOO = data.frame()

## execute the cross validation loop
for (i in 1:677) {

  ## create the training set
  train = hof.scale[-i, ]
  test = hof.scale[i, ]
  
  ## principal compnents
  pr = prcomp(train[, 1:23])

  ## calculate PCA for training and testing sets
  pca.train = data.frame(as.matrix(train[, 1:23]) %*% pr$rotation)
  train = cbind(HOF = train[, 24], pca.train[, 1:10])

  pca.test = data.frame(as.matrix(test[, 1:23]) %*% pr$rotation)
  test = cbind(HOF = test[, 24], pca.test[, 1:10])

  ## Model Building
  ## random forest
  mdl.rf = randomForest(HOF ~ ., data = train, ntree = 50)

  ## SVM
  mdl.svm = svm(HOF ~ ., data = train, probability = TRUE)
  x = predict(mdl.svm, test, probability = TRUE)

  ## Logistic Regression
  mdl.glm = glm(HOF ~ .,
                data = train,
                family=binomial(link='logit'),
                control = list(maxit = 500))

  ## data.frame of results
  results = data.frame(
    RF = predict(mdl.rf, test, type = "prob")[, 2],
    SVM = round(attr(x,"probabilities")[,"Y"], 3),
    GLM = round(predict(mdl.glm, test, type = "response"), 3)
  )

  ## add an average score and decision for all predictions
  results$AVG = rowMeans(results[, 1:3])
  
  ## set up empty vectors
  results$AVG_DEC = 0
  results$RF_DEC = 0
  results$SVM_DEC = 0
  results$GLM_DEC = 0
  
  ## if the probability is higher than the pretermined value then the model
  ## predicts HOF entrance
  results$AVG_DEC[which(results$AVG > .5)] = 1
  results$RF_DEC[which(results$RF   > .6)] = 1  
  results$SVM_DEC[which(results$SVM > .6)] = 1
  results$GLM_DEC[which(results$GLM > .6)] = 1
  
  ## ensemble variable, if any of the individual models predict entrance
  results$ANY_DEC = 0
  results$ANY_DEC[which(results$RF_DEC == 1 | results$SVM_DEC == 1 | 
                          results$GLM_DEC == 1)] = 1

  ## Add the actual data
  results$ACTUAL = test$HOF
  results$ACTUAL = as.character(results$ACTUAL)
  results$ACTUAL[which(results$ACTUAL == "Y")] = 1
  results$ACTUAL[which(results$ACTUAL == "N")] = 0
  results$ACTUAL = as.numeric(results$ACTUAL)

  ## rbind the results
  LOO = rbind(LOO, results)

}

## calcualte the accuracy of the individual, average, and any predictions
## using the weighted accuracy measure in the homework
## (sensitivity + (3 x specificity)) / 4,
models = data.frame(
  RF = ((length(which(LOO$RF_DEC == 1 & LOO$ACTUAL == 1))  /
           sum(LOO$ACTUAL)) + 3 * (length(which(LOO$RF_DEC ==  0 & LOO$ACTUAL == 0)) / 
                                     length(which(LOO$ACTUAL == 0))))/4,
  SVM = ((length(which(LOO$SVM_DEC == 1 & LOO$ACTUAL == 1))/
            sum(LOO$ACTUAL)) + 3 * (length(which(LOO$SVM_DEC == 0 & LOO$ACTUAL == 0)) / 
                                      length(which(LOO$ACTUAL == 0))))/4,
  GLM = ((length(which(LOO$GLM_DEC == 1 & LOO$ACTUAL == 1))/
            sum(LOO$ACTUAL)) + 3 * (length(which(LOO$GLM_DEC == 0 & LOO$ACTUAL == 0)) / 
                                      length(which(LOO$ACTUAL == 0))))/4,
  AVG = ((length(which(LOO$AVG_DEC == 1 & LOO$ACTUAL == 1))/
            sum(LOO$ACTUAL)) + 3 * (length(which(LOO$AVG_DEC == 0 & LOO$ACTUAL == 0)) / 
                                      length(which(LOO$ACTUAL == 0))))/4,
  ANY = ((length(which(LOO$ANY_DEC == 1 & LOO$ACTUAL == 1))/
            sum(LOO$ACTUAL)) + 3 * (length(which(LOO$ANY_DEC == 0 & LOO$ACTUAL == 0)) / 
                                      length(which(LOO$ACTUAL == 0))))/4
  )

models = round(models, 3); print(colMeans(models))

## Build final models to be used in the prediction
train = rbind(train, test)

## Model Building
## random forest
mdl.rf = randomForest(HOF ~ ., data = train, ntree = 50)

## SVM
mdl.svm = svm(HOF ~ ., data = train, probability = TRUE)

## Logistic Regression
mdl.glm = glm(HOF ~ .,
              data = train,
              family=binomial(link='logit'),
              control = list(maxit = 500))


## cleanup workspace
rm(i, x, results, pca.test, pca.train, test, train)

save.image(file = "blubaugh_hw08_rdata.RData")


