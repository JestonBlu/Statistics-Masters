# 3)
(Name <- "Joseph Blubaugh")

# 4)
Sys.time()

#5)
help.start()
x <- rnorm(50)
y <-rnorm(x)

plot(x,y)

# 7)
ls()

rm(x, y)

x <- 1:20

w <- 1 + sqrt(x)/2

dummy <- data.frame(x = x, y = x + rnorm(x) * w)

fm <- lm(y ~ x, data = dummy)
summary(fm)

fm1 <- lm(y ~ x, data = dummy, weight = 1 / w^2)
summary(fm1)

attach(dummy)

lrf <- lowess(x, y)

plot(x, y)

lines(x, lrf$y)

abline(0, 1, lty = 3)

abline(coef(fm))

abline(coef(fm1), col = "red")

# 8)
detach()

plot(fitted(fm), resid(fm), xlab = "Fitted Values", ylab = "Residuals", main = "Residuals vs Fitted")

# 10)
qqnorm(resid(fm), main = "Residuals Rankit Plot")

# 11)
rm(fm, fm1, lrf, x, dummy)

# 12)
filepath <- system.file("data", "morley.tab" , package="datasets")
filepath

mm <- read.table(filepath)
mm$Expt <- factor(mm$Expt)
mm$Run <- factor(mm$Run)

attach(mm)

plot(Expt, Speed, main = "Speed of Light Data", xlab = "Experiment No.")

# 14)
fm <- aov(Speed ~ Run + Expt, data = mm)
summary(fm)
fm0 <- update(fm, . ~ . - Run)
anova(fm0, fm)

detach()
rm(fm, fm0)

x <- seq(-pi, pi, len = 50)
y <- x
f <- outer (x, y, function(x, y) cos(y) / (1 + x^2))
oldpar <- par(no.readonly = TRUE)
par(pty = "s")
contour(x, y, f)
contour(x, y, f, nlevels = 15, add = TRUE)

# 15)
fa <- (f - t(f)) / 2
contour(x, y, fa, nlevels = 15)

# 16)
par(oldpar)
image(x, y, f)
image(x, y, fa)

# 17)
objects(); rm(x,y,f,fa)
th <- seq(-pi, pi, len = 100)
z <- exp(1i * th)
par(pty = "s")
plot(z, type = "l")

# 18)
w <- rnorm(100) + rnorm(100) * 1i
w <- ifelse(Mod(w) > 1, 1 / w, w)

plot(w, xlim = c(-1, 1), ylim = c(-1, 1), pch = "+", xlab = "x", ylab = "y")
lines(z)

# 19)
w <- sqrt(runif(100)) * exp(2 * pi * runif(100) * 1i)
plot(w, xlim = c(-1, 1), ylim = c(-1, 1), pch = "+", xlab = "x", ylab = "y")
lines(z)
