## The following two functions can compute the inverse of a matrix and store the result in
## the cache for later use.

## This function turns a matrix into a special matrix object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  
  set <- function(y) {
    x <<- y
  }
  
  get <- function() {x}

  setinverse <- function(inverse) {i <<- inverse}
  
  getinverse <- function() {i}
  
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
}


## This function computes the inverse of the special matrix object returned by the function above.
## If the inverse has already been calculated, it is retrieved from the cache.

cacheSolve <- function(x, ...) {
  
  i <- x$getinverse()
  
  if(!is.null(i)) {
    message("Getting cached data")
    return(m)
  }
  
  i <- solve(x$get(), ...)
  x$setinverse(i)
  i
  
}


## These commands can be used to test the functions on an example matrix.

ExampleMatrix <- matrix(rnorm(16),4,4)

CacheMatrix <- makeCacheMatrix(ExampleMatrix)

cacheSolve(CacheMatrix)
