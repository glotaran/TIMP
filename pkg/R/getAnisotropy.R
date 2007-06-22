"getAnisotropy" <- function (model) 
{
	ani <- model@anispec
	if(length(ani$angle) > 0) {
		#non-associative, or associative w/same func. per comp
		if(ani$anifunc %in% c("const", "exp", "expvar"))
			ani$anifunc <- rep(ani$anifunc, 
			max(model@ncolc))
		model@ncolc <- model@ncolc + length(ani$super)
		ani$calcani <- TRUE
        }
	else {
	     ani$calcani <- FALSE
	     ani$useparperp <- FALSE
	}
	model@anispec <- ani
	model
}


