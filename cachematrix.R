## Put comments here that give an overall description of what your
## functions do

## Programming assignment for Coursera R week 3
## The two functions will demonstrate caching of potentially time-consuming 
## operation to compute inverse of a square matrix.	This will avoid 
## recomputation if inverse of a matrix is already calculated and cached.
## 


## Function makeCacheMatrix will compute and save the inverse of a given matrix
## set and get functions facilitate setting and getting the value of 
## matrix to be inverted.
## function solve() is used to calculate the inverse of the given matrix.
##

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y){
    x <<- y
    s <<- NULL
  }
  get         <- function()x
  setinverse  <- function(solve) s <<- solve 
  getinverse  <- function() s
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)

}


## function cacheSolve will return the inverse of a matrix.
## makeCacheMatrix() is used to compute and cache the inverse matrix.
## if inverse of matrix x has not been calculated yet, it will be calculated 
## and saved using the setinverse function in makeCacheMatrix.
##

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m  <- x$getinverse()
  if(!is.null(m)){
    message("getting cached inverse")
    return(m)
  }
  data <- x$get()
  m    <- solve(data)
  x$setinverse(m)

  m
		
}
