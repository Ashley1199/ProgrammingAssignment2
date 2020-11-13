## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

    makeCacheMatrix <- function(x = matrix()) {  ## This function takes a matrix as an argument
                                                 ## And cache the inverse of the matrix
        inv <- NULL                              
        set <- function(y) {
            x <<- y                             
            inv <<- NULL                         ## Inverse is set to NULL incase of new matrix
        }
        get <- function() {x}                    
        
        setinverse <- function(inverse) {inv <<- inverse}
        getinverse <- function() {inv}                     
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
    }
    
    cacheSolve <- function(x, ...) {            ## This function checks if inverse is already calculated
        inv <- x$getinverse()                   ## If so then prints the message along with the inverse
        if(!is.null(inv)) {                     ## If not then solves the inverse returns it and set it as new cache
            message("getting cached data")
            return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
    }
