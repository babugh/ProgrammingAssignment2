## This function makeCacheMatrix creates a matrix, a list containing a 
## function to 

## Set the value of the matrix
## get the value of the matrix
## set the value of inverse matrix
## get the value of inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  invmat <- NULL
  set <- function(y) {
    x <<- y
    invmat <<- NULL
  }
  get <- function() x
  setinv <- function(inv) invmat <<- inv
  getinv <- function() invmat
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## The following function calculates the inverse of matrix created with 
## the above function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invmat <- x$getinv()
  if(!is.null(invmat)) {
    message("getting cached data")
    return(invmat)
  }
  data <- x$get()
  invmat <- solve(data, ...)
  x$setinv(invmat)
  invmat
}
