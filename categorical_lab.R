
normSamps <- rnorm(100)

withinOrNot <- factor(ifelse((abs(normSamps) > 1), "outside 1 sd", "within 1 sd"))