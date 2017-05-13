Confint.plot=
function(nint, nsam)
{
        plot(c(1., nint), c(-2*qt(.995,nsam-1)/sqrt(nsam), 2*qt(.995,nsam-1)/sqrt(nsam)), type = "n", xlab =
                "realization", ylab = "mu", main = paste(nint,
                " Confidence Intervals for the Mean", sep = ""))
        for(i in 1.:nint) {
                x <- rnorm(nsam)
                xbar <- mean(x)
                hwidth <- (qt(0.975, nsam - 1.) * sd(x))/sqrt(nsam)
                lines(c(i, i), c(xbar - hwidth, xbar + hwidth))
        if(xbar-hwidth> 0)points(i,xbar+hwidth*1.1,pch="*",col=2)
        if(xbar+hwidth < 0)points(i,xbar-hwidth*1.1,pch="*",col=2)

        }
        lines(c(0., nint), c(0., 0.), lty = 2.)
}

