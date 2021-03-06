## Put comments here that give an overall description of what your
## functions do

## A pair of functions that cache the inverse of a matrix

## Write a short comment describing this function

## Creates a special matrix object that can cache it's inverse

makeCacheMatrix <- function(x = matrix()) {
  
    i <- NULL     ## Initialize the inverse property
  
  ## Method to set the matrix
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  
  ## Method to get the matrix
  get <- function() x
  
  ## Method to set the inverse of the matrix
  setinverse <- function(inv) i <<- inv
  
  ## Method to get the inverse of the matrix
  getinverse <- function() i
  
  ## Return a list of the methods
  list(
    set = set,
    get = get,
    setinverse = setinverse,
    getinverse = getinverse
  )

}


## Write a short comment describing this function

## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  
        ## Just return the inverse if its already set
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  ## Get the matrix from our object 
  m <- x$get()
  
  ## Calculate the inverse of the matrix
  i <- solve(m, ...)
  
  ## Set the inverse to the object
  x$setinverse(i)
  
  ## Return the matrix
  i
}
