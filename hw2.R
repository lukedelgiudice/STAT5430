
### 1

n <- 100
off_diag_value <- (1 - 0.1) / (n - 1)
P <- matrix(off_diag_value, nrow = n, ncol = n)
diag(P) <- 0.1

### 2

X <- matrix(0, nrow = 1000, ncol = 4)

X[, 1] <- 1

X[(251):(2 * 250), 2] <- 1

X[(2 * 250 + 1):(3 * 250), 3] <- 1

X[(3 * 250 + 1):(4 * 250), 4] <- 1

### 3

H <- as.matrix(X %*% solve(t(X) %*% X) %*% t(X))

### 4

n <- 100
variances <- 2
cov_values <- seq(0, 0.09, by = 0.01)

myCovMats <- array(0, dim = c(n, n, length(cov_values)))

for (k in seq_along(cov_values)) {
  rho <- cov_values[k]
  mat <- matrix(rho, n, n)
  diag(mat) <- variances
  myCovMats[, , k] <- mat
}

### 5

n2 <- 10
variances <- 2
cov_values2 <- seq(0, 0.09, length.out = 100)

myCovMats2 <- array(0, dim = c(n2, n2, length(cov_values2)))

for (k in seq_along(cov_values2)) {
  rho <- cov_values2[k]
  mat <- matrix(rho, n2, n2)
  diag(mat) <- variances
  myCovMats2[, , k] <- mat
}

### 6

l1 <- list(first = "a", second = 1)
l2 <- list(first = c(1, 2, 3), second = "statistics")

l3 <- unname(c(l1, l2))

### 7

l4 <- l3[3]

### 8

v1 <- l3[[3]]