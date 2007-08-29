"compModelMass" <-
function (theta, model)
{
	peakpar <- theta@peakpar
	ncomp <- model@ncomp
	if(model@peakfunct == "expmodgaus") {
		widths <- vector()
		locations <- vector()
		rates <- vector() 
		amp <- vector()
		for(i in 1:ncomp) {
			locations <- append(locations, peakpar[[i]][1])
			widths <- append(widths, peakpar[[i]][2])
			rates <- append(rates, peakpar[[i]][3])
			if(length(peakpar[[i]]) > 3)
				amp <- append(amp, peakpar[[i]][4])        
	        	else amp <- append(amp, 1)
		}
		massm <- rep(0, model@nt * ncomp) 
		massm <- as.matrix(.C("calcCirf_multi", 
		     cmat = as.double(massm), 
		     as.double(rates), as.double(model@x), 
		     as.double(widths), 
		     as.double(locations), 
		     as.integer(ncomp), 
            	     as.integer(model@nt), PACKAGE="TIMP")$cmat)
           	dim(massm) <- c(model@nt, ncomp)
		massm <- t(t(massm)*amp)
	}
	
	massm
}
