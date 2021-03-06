## The fist function, makeCacheMatrix creates a matrix object that will cache its inverse

makeCacheMatrix <- function(x = matrix()) {   
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse 
  getinverse <- function() i 
  list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)

}


## The second function calculates the inverse of the previously created matrix object.
## if the inverse was already created then it will retrieve the inverse from the cache. 

cacheSolve <- function(x, ...) { 
  i <-x$getinverse()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
  
        
}
