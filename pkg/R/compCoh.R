"compCoh" <-
function (irfpar, x, cohspec, coh, dataset, cohirf, mirf = FALSE, 
measured_irf = vector(), convalg = 1, shiftmea = vector(), lamb = 1) 
{
	type <- cohspec$type 
	if(type == "irf") {
		if(mirf) {
			 if (length(shiftmea) != 0) {
			    if (length(shiftmea) == 1) 
			       lamb <- 1
			   xspace <- x[2] - x[1]
			   measured_irf <- .C("ShiftCurve", 
			   source = as.double(measured_irf), 
			   as.double(measured_irf), 
			   as.double(shiftmea[lamb]/xspace), 
			   as.integer(length(x)), PACKAGE="TIMP")$source
			 }
			 cohcols <- measured_irf
	        }
		else
			cohcols <- dnorm(x, irfpar[1], irfpar[2])
	        
	
	}
	if(type == "freeirfdisp") 
		cohcols <- dnorm(x, cohirf[1], cohirf[2])
	if(type == "irfmulti") { 
		cohcols <- matrix(0, nrow = length(x), 
		           ncol = cohspec$numdatasets)
		cohcols[, dataset] <- dnorm(x, irfpar[1], irfpar[2])
	}
	if(type == "seq") 
		cohcols <- calcCirf(coh, x, irfpar) %*% calcB(coh) 
	if(type == "mix") 
		cohcols <- cbind(dnorm(x, irfpar[1], 
			   irfpar[2]), calcCirf(coh, x, irfpar) %*% calcB(coh))
	
	cohcols
}

