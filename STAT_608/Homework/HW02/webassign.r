data = 
  as.data.frame(
    matrix(c(1071.9,  825.81,
             715.82,  376.61,
             445.93,	375.81,
             602.48,	408.32,
             565.88,	457,
             1047.4,	756.22,
             640.27,	384.69,
             491.47,	275.37,
             1165,	809.98,
             1347,	909.92,
             1037.6,	667.68,
             1991.6,	1274.4,
             626.48,	378.14,
             306.05,	252.1,
             1752.7,	1162.4,
             1948.9,	1335.2,
             1545.3,	1057.4,
             1945.7,	1264.7,
             495.53,	312.6,
             328.05,	300.27),
           byrow = TRUE, ncol = 2)
    )

colnames(data) = c("gbo_current", "gbo_previous")

mdl = lm(gbo_current ~ gbo_previous, data = data)

0.9774 / (1 - 0.9774)
1.50226/.05239
2.101^2

1.50226 + (2.1009 * .05239); 1.50226 - (2.1009 * .05239)

new = data.frame(gbo_previous = 539)
predict(mdl, new, interval="confidence", level=0.95)
predict(mdl, new, interval="prediction", level=0.95)
