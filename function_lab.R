
myDFT <- function(x) {
  n <- length(x)
  outVec <- complex(length.out = n)
  
  for (j in 0:(n-1)) {
    w_j <- j / n

    s <- 0 + 0i

    for (t in 1:n) {
      s <- s + x[t] * exp(-2i * pi * w_j * t)
    }

    outVec[j+1] <- (1 / sqrt(n)) * s
  }
  
  return(outVec)
}
