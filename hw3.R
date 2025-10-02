
# Regression

getLinModEstimates <- function(y, X) {
  XtX <- t(X) %*% X
  XtX_inv <- solve(XtX)
  Xty <- t(X) %*% y
  coefficients <- XtX_inv %*% Xty
  
  fitVals <- X %*% coefficients
  
  residuals <- y - fitVals
  
  return(list(coefficients = as.vector(coefficients), fitVals = as.vector(fitVals), residuals = as.vector(residuals)))
}


# Functions in and functions out

monteCarlo <- function(sim, f) {
  return(function(num_sims) {
    samples <- sim(num_sims)

    f_values <- f(samples)
    
    return(mean(f_values))
  })
}


# Categorical Chess Data

d <- read.csv("kr-vs-kp.data", header=FALSE, stringsAsFactors = TRUE)
# head(d)

allFactors <- isTRUE(all(sapply(d, is.factor)))

ideallyOrdered <- FALSE

currentlyOrdered <- any(sapply(d, is.ordered))

percentF <- (sum(d$V1 == 'f') / nrow(d)) * 100

