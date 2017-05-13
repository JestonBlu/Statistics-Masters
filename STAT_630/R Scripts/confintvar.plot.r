Confintvar.plot=
function(nint, nsam)
{
plot(c(1., nint), c(qchisq(.001,nsam-1)/qchisq(.975,nsam-1),qchisq(.999,nsam-1)/qchisq(.025,nsam-1)), type = "n", xlab =
                "realization", ylab = "variance", main = paste(nint,
                " Confidence Intervals for the Variance", sep = ""))
        for(i in 1.:nint) {
                x <- rnorm(nsam)
                v <- var(x)
                lower=(nsam-1)*v/(qchisq(.975,nsam-1))
                upper=(nsam-1)*v/(qchisq(.025,nsam-1))
                lines(c(i, i), c(lower,upper))
                if (lower>1)points(i,upper*1.02,pch="*",col=2)
                if (upper<1)points(i,lower/1.02,pch="*",col=2)

        }
        lines(c(0., nint), c(1., 1.), lty = 2)
        
}

