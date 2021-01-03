##Set seed
set.seed(1234)

##Set distribution parameters, number of simulations
lambda <- 0.2
n <- 40
sims <- 1000

##Calculate theoretical mean and sd
mu <- 1/lambda
sd <- 1/lambda

##Create matrix of 40 columns (variables) and 1000 rows (simulations)
sample.distr <- matrix(data = rexp(n*sims,lambda), nrow = sims)

##Calculate mean of 40 variables for each simulation
x <- apply(sample.distr, 1, mean)

mean(x)

##Plot histogram of sample means, vertical line at mean for visual
hist(x)
abline(v = mean(x), col = "red", lty = 1, lwd = 5)

##print theoretical mean and sample mean
print(c(mu,mean(x)))

##Visual Comparison
set.seed(1234)
par(mfrow=c(1,2))
hist(rexp(n*sims,lambda),main = "Exponential Distribution", xlab = "x")
abline(v = mu, col = "red", lwd = 5)
hist(x, main = "Sample Mean, n = 40")
abline(v=mean(x), col = "red", lwd = 5)

##Calculate variance of 40 varaibles for each simulation
y <- apply(sample.distr,1,var)
