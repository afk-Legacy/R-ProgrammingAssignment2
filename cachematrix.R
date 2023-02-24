## Matrix inversion can be computationally expensive when the 
## matrix is very large. To prevent long processing times, we
## can cache the result of inversion of smaller matrices to 
## prevent recalculation, hence saving time

## This function creates a list which contains 
## helper function for the matrix, which include:
##  set the value of the matrix
##  get the value of the matrix
##  set the value of the inverted matrix
##  get the value of the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
    invertedMatrix <- NULL
    
    set <- function(mat) {
      x <<- mat
      invertedMatrix <<- mat
    }
    
    get <- function() x
    
    setInvertedMatrix <- function(invMat) invertedMatrix <<- invMat
    
    getInvertedMatrix <- function() invertedMatrix
    
    list(get=get, set=set, getInvertedMatrix=getInvertedMatrix, 
         setInvertedMatrix=setInvertedMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInvertedMatrix
    
    if (!is.null(m)) {
      message("Getting cached data....")
      return(m)
    }
    
    data <- x$get()
    m <- solve(data, ...)
    x$setInvertedMatrix(m)
    
    m
}
