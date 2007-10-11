"ftest" <-
function ()
{
  ## we want to solve A * X = B  SUBJECT TO X .GE. 0 
  
  t <- seq(0, 2, by = 2/50) 
  A <- matrix(nrow=51,ncol=2)
  A[,1] <- exp(-2 * t)
  A[,2] <- exp(-1 * t)

  B <-  A %*% c(2,1) ## the real A are thus c(2,1)

  sigma <- .001
  B <- B + sigma * rnorm(1)

  MDA <- nrow(A)
  M <- nrow(A) 
  N <- ncol(A)

  X <- rep(0, 2)

  RNORM <- 0
  W <- rep(0, N)
  ZZ <- rep(0, M)
  INDEX <- rep(0, N)
  MODE <- 0
  
  sol <- .Fortran("nnls",
         A = as.numeric(A),
         MDA = as.integer(MDA),
         M = as.integer(M),
         N = as.integer(N),
         B = as.numeric(B),
         X = as.numeric(X),
         RNORM = as.numeric(RNORM),
         W = as.numeric(W),
         ZZ = as.numeric(ZZ),
         INDEX = as.integer(INDEX),
         MODE = as.integer(MODE), 
         PACKAGE="TIMP")$X 
  sol

}
