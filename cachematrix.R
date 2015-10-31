# Synopsis : Caches the inverse of the matrix to avoid recalculating the same for the same set of elements
# Created by: Ramaji
# Crated on: 10/30/2015
# Description : R Program Assignmnet-2 from Coursera. 
# 
# This code is used in conjunction with another function, cachesolve() 
#
# Example to test this code:
#
####  
#
makeCacheMatrix <- function(mxElements=numeric()) #Input to this function is a matrix type
{
  storedInverse<-NULL     		# Initialize the inverse being held by this variable
  fSet <-function(mxNewElements)	# Apparently this function is not important for this course work.However, it provides a good example to demonstrate the need 
  {					#  for such a function in a real life project.
     					# 
     mxElements <<- mxNewElements	# Scoping example. The value of the parameter of this function is set to the parent variable passed through the function, makeCacheMatrix
					# Note that, even if 'mxElements' was not passed through the upper function, this variable would get created within that and outside of fSet function
     storedInverse <<- NULL		# Initialize the cached inverse location
  }

  fGet <- function()
  {
	mxElements			# Matrix elements
  }

  fSetInverse <- function(mxInverse)
  {
	storedInverse <<- mxInverse	# Calculated inverse cached
  }

  fGetInverse <- function()
  {
	storedInverse			# Inverse returned to the calling routine
  }

  list(
	set = fSet,
	get = fGet,
	setinverse = fSetInverse,
	getinverse = fGetInverse
	)				# Methods related to the matrix variable
}

###---------------------------------
# Synopsis : Caclulates the inverse of the matrix( if not cached) and outputs the same
# Created by: Ramaji
# Crated on: 10/30/2015
# Description : R Program Assignmnet-2 from Coursera. No error handlings are incorporated
#
cacheSolve<-function(x, ...) {
    m <- x$getinverse() # Get the stored inverse in the cache
    if(!is.null(m)) {   # If the returned inverse is not null then <makeCacheMatrix> acquired inverse from cache
        message("getting cached data")   # Display appropriate message
        return(m)			# .. and return the inverse from cache
    }
    data <- x$get()  # If no inverse was found in the cache we need to evaluate it. Get the matrix
    m <- solve(data, ...)  # Evaluate inverse using solve() function
			   # To keep things simple we are not doing error checkings
    x$setinverse(m)	   # Store the inverse in the cache
    m			   # Output the inverse
}
##---------------------------------
####
## Source the functions from the files
#  source("makeCacheMatrix.R")
#  source("cachesolve.R")
#
## Create a sample matrix of size 3x3
#  mx <- matrix(c(1,5,10,15,20,25,30,35,40)
#
## Call makeCacheMatrix() function to prepare needed methods
#  mxCache <- makeCacheMatrix(mx)
#
## Call cacheSolve() function to calculate inverse
#  cacheSolve(mxCache)
#
## To test the result mulitply the result of cacheSove() with the matrix to get identity
#  mx %*% cacheSolve(mxCache)
## Note: You may see decimal non-zero values in scientific notation in the product element.Consider them as zeros as they are very close to it.
##	 Make sure the diagonal values are 1.
#



