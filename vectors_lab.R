########## 1

taylorElems <- (3^(0:10)) / factorial(0:10)

########## 2

nums <- seq(from = -100, to = 100)

myLogicals <- (nums %% 2 == 0)

totalEven <- sum(myLogicals)

evens <- nums[myLogicals]

reverse <- rev(nums)

########## 3

sumThese <- exp(rep(1000, 10))

sumThese == Inf

# These elements aren't finite

sum(sumThese)

# You can't sum them and get a finite result

allGood <- FALSE

# log(10 * exp(1000)) = log(10) + 1000

(log(10) + 1000) < .Machine$double.xmax

isTheoreticallyCalculable <- TRUE

naiveLogSum <- log(sum(sumThese))

naiveLogSum == Inf

# The naive log sum isn't finite

log_values <- rep(1000, 10)

m <- max(log_values)

betterSum <-  log(sum(exp(log_values - m))) + m

whichBetter <- "logs"
