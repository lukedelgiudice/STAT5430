########## Examining a vector

prices <- c(100.10, 95.98, 100.01, 99.87)

logReturns <- (log(prices[-length(prices)]) - log(prices[-1])) * 100

arithReturns <- ((prices[-length(prices)] - prices[-1]) / prices[-1]) * 100

########## More Monte Carlo

xSamps <- rt(5000, 1)

xSamps <- abs(xSamps)

ySamps <- rnorm(n = 5000, mean = 0, sd = xSamps)

approxProbDev1 <- mean(abs(ySamps) > 1)

integratingOutResp <- c('When we integrate out x it means removing the dependence of y on x. Without x in the equation we no longer consider any of its information, which is equavalent to ignoring it.')


rao_estimates <- numeric(5000)

rao_function <- function(i) {
  estimate <- rnorm(n = 1, mean = 0, sd = xSamps[i])
  return(estimate)
}

for (i in 1:5000) {
  rao_estimates[i] <- rao_function(i)
}

approxProbDev2 <- mean(abs(rao_estimates) > 1)

# 6
# No


# Playing Around with Some Letters
myUpcaseLetters <- seq('A', 'Z')
