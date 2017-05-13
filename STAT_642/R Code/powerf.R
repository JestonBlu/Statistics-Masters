library(ggplot2)

treatments = 3
reps = 5
variance = 12
df = t * (r - 1)
D = seq(0, 20, 1)
Lambda = (D^2) * reps * treatments / variance^2
Power = 1 - pf(qf(.95, treatments - 1, df), treatments - 1, df, Lambda)
qplot(Lambda, Power, geom = 'line', main = 'Power Curve', xlab = "Lambda", ylab = "Power")
