########## Examining a vector

prices <- c(100.10, 95.98, 100.01, 99.87)

logReturns <- log(prices[-1]) - log(prices[-length(prices)])

arithReturns <- ((prices[-1] - prices[-length(prices)]) / prices[-length(prices)]) * 100

########## More Monte Carlo

xSamps <- rt(5000, 1)

xSamps <- abs(xSamps)

ySamps <- rnorm(n = 5000, mean = 0, sd = xSamps)

approxProbDev1 <- mean(abs(ySamps) > 1)

integratingOutResp <- c("In Monte Carlo, the fraction of samples that come from each X converges to its distribution. Averaging over all Y samples without explicitly using xSamps automatically weights by the distribution of X, which is exactly what integrating out X means (considering all x's given their corresponding probability).")

rao_values <- 2 * pnorm(q = 1, mean = 0, sd = xSamps, lower.tail = FALSE)

approxProbDev2 <- mean(rao_values)

# Are you able to calculate an exact solution to P[|Y | > 1]?
# No, there isn't an exact closed-form solution (the full integral for P(|Y| > 1) can't be done manually).

# Playing Around with Some Letters
myUpcaseLetters <- toupper(letters)

withReplacements <- gsub("[AEIOU]", "---", myUpcaseLetters)

consonant <- !(myUpcaseLetters %in% c("A", "E", "I", "O", "U"))
