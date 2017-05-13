jeb_prediction = function(dta) {
  
  require(e1071)
  require(randomForest)
  
  ## expecting a dataframe with same column names as the training set
  ## including the response variable
  hof = dta
  
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
  
  ## use principal components object to calculate PCA
  hof.pca = data.frame(as.matrix(hof.scale[, 1:23]) %*% pr$rotation)
  test = cbind(HOF = hof.scale[, 24], hof.pca[, 1:10])
  
  ## create predictions
  x = predict(mdl.svm, test, probability = TRUE)
  
  ## data.frame of results
  results = data.frame(
   RF = predict(mdl.rf, test, type = "prob")[, 2],
   SVM = round(attr(x,"probabilities")[,"Y"], 3),
   GLM = round(predict(mdl.glm, test, type = "response"), 3))
  
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
  results$ANY_DEC[which(results$RF_DEC == 1 | results$SVM_DEC == 1 | results$GLM_DEC == 1)] = 1
  
  results$FINAL = 'N'
  results$FINAL[which(results$ANY_DEC == 1)] = 'Y'
  
  return(results$FINAL)

  ##    RF   SVM   GLM   AVG   ANY 
  ##  0.909 0.898 0.942 0.937 0.948 
    
  ## Final prediction using an ensemble method that predicts HOF if any
  ## of the individual models predicts HOF probability > .6
  ##
  ## Expected Weighted Accuracy: .948
}

final = data.frame(HOF_te$HOF)
final$MODEL = jeb_prediction(HOF_te)

table(final)
