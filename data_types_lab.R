########## Q1

questionOne <- c("character", "logical", "integer", "double")

########## Q2

a <- 2 / 3
print(a)
aPrint <- 0.6666667

numDigitsStart <- options()$digits

options(digits = 22)

print(a)

aPrintv2 <- 0.6666666666666666296592

numDigitsEnd <- options()$digits

options(digits = numDigitsStart)

########## Q3

mySqrt <- sqrt(2)

print(mySqrt**2)

isTwoRecoverable <- (2 == (mySqrt**2))

closeEnough <- !is.character(all.equal(mySqrt^2, 2))

########## Q4

flips <- rbinom(n = 1000, size = 1, prob = 0.5)

isHeads <- flips == 1

numHeads <- sum(isHeads)

acceptanceRate <- (sum(flips[-1] != flips[-length(flips)]) / (length(flips) - 1)) * 100