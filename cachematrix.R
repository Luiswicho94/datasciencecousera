## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { ## Define the argument with default mode of "matrix"
    inv <- NULL                             ## Initialize inv as empty 
    set <- function(y) {                    ## Define the set function to assign new values 
      x <<- y                             ## Move value to parent environment
      inv <<- NULL                        ## Reset inv value to empty
    }
    get <- function() x                     ## Get the value of the matrix 
    
    setinverse <- function(inverse) inv <<- inverse  ## Move value to parent environment
    getinverse <- function() inv                     ## Gets value of INV
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)  ## Define object names to use the pointer and get specific values
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()    ##Get value of inverse matrix
    if(!is.null(inv)) {     ## Check if inv has a value or its empty
    message("getting cached data")    ##Display message
    return(inv)             ##Return value of INV
  }
    data <- x$get()           ## get value of x into DATA
    inv <- solve(data, ...)   ## Make inverse of data
    x$setinverse(inv)         ## Set inverse value into x 
    inv                       # Display value of inv
}