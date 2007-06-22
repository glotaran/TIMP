"getAniSuper" <- function (c.temp, A, ani) 
{
	A_p <- A
	c.temp_p <- c.temp 
	for(i in 1:length(ani@super)) {
	      A_p <- cbind(A_p, A[, ani@super[[i]]]) 
	      c.temp <- cbind(c.temp, A[, ani@super[[i]]]) 
	}
	list(c.temp = c.temp, A = A) 
}
