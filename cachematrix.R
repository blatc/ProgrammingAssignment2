
# A function that inputs a user-defined matrix and outputs a list
# of 3 functions to get the matrix, set its inverse, and
# retrieve its inverse

# Inputs a user-defined matrix
makeCacheMatrix <- function(x = matrix()) {

# Defines an object s that will store the inverse of the matrix
# Sets value as null

        s <- NULL             

# Defines a function 'get' that returns the user-defined matrix

        get <- function() x

# Defines a function 'setinverse' that caches the value for an object solve,
# which will hold the value for the inverse matrix, 
# in an object s that is stored in the global environment

        setinverse <- function(solve) s <<- solve

# Defines a function 'getinverse' that returns the value for s, which will hold
# the value for the inverse matrix or null (as defined above) if not yet calculated 

        getinverse <- function() s

# Creates a list, with each element 1 of the functions defined above 
        list(get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


# A function that returns the inverse of the user-defined matrix passed to
# the makeCacheMatrix function

cacheSolve <- function(x, ...) {

# Passes the value for the inverse matrix to object s

	  s <- x$getinverse()

# Evaluates whether the value for the inverse matrix is null
# if not null, returns value 

        if(!all(is.null(s))) {
                message("getting cached data")
                return(s)
        }

# If value for inverse matrix is null, the following code block is initiated:

# Returns the value for the original user-defined matrix, stores it in matrix data

        data <- x$get()

# Sets objects s to the solution for the inverse of 'data'
 
        s <- solve(data, ...)


# Passes the value for s back to the setinverse function, to cache it in the global environment

        x$setinverse(s)

# Returns the solution for the inverse matrix to the console window

        s
}

