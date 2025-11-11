

vec <- function(myMatrix) {
  output <- numeric(ncol(myMatrix))
  for (i in 1:ncol(myMatrix)) {
    output[i] <- myMatrix[1,]
  }
  return(output)
}

unVec <- function(myVector, nRows) {
  output <- matrix(myVector, nRows)
  return(output)
}

stackUp <- function(m, BMat) {
  output <- matrix(rep(0, nrow(BMat) * m * ncol(BMat)), nrow(BMat) * m, ncol(BMat))
  for (i in 1:(nrow(BMat) * m)) {
    inner_result <- 
    for (j in 1:(ncol(BMat))) {
      output[i, j] <- BMat[]
    }
  }
}

















sameConflict <- TRUE