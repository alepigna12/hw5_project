# Import `dgemv_eigen()`
Rcpp::sourceCpp(file.path(".", "src", "gemv_eigen.cpp"))

set.seed(111)
n_row_out <- 1024L
n_inner <- 2048L
n_col_out <- 512L
A <- matrix(rnorm(n_row_out * n_inner), nrow = n_row_out, ncol = n_inner)
B <- matrix(rnorm(n_inner * n_col_out), nrow = n_inner, ncol = n_col_out)
v <- rnorm(n_inner)
# Benchmark
bench::mark(
  dgemm_eigen(A, B)
)
bench::mark(
  dgemv_eigen(A, v)
)
