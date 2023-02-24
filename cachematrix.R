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
  # Set inverted matrix to null
  invertedMatrix <- NULL
  
  # set function to modify matrix and its inverse set to NULL
  set <- function(mat) {
    x <<- mat
    invertedMatrix <<- NULL
  }
  
  # get matrix
  get <- function() x
  
  # set inverted matrix
  setInvertedMatrix <- function(invMat) invertedMatrix <<- invMat
  
  # get inverted matrix
  getInvertedMatrix <- function() invertedMatrix
  
  # put all in a list
  list(get=get, set=set, getInvertedMatrix=getInvertedMatrix, 
       setInvertedMatrix=setInvertedMatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## try to get the matrix
  m <- x$getInvertedMatrix
  
  # check if inverted matrix is null or not
  if (!is.null(m)) {
    message("Getting cached data....")
    
    # if not null, return inverted matrix instead of calculating
    return(m)
  }
  
  # Otherwise, get the original matrix
  data <- x$get()
  
  # compute the inverse of the matrix
  m <- solve(data, ...)
  
  # set the inverted matrix 
  x$setInvertedMatrix(m)
  
  # return the inverted matrix
  m
}
