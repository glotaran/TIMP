"getAniA" <- function (A, dataset, ani, phi) 
{
	
	if(ani$angle[dataset] != "MA" && !ani$useparper) {
	   dA <- dim(A)[1]
	   if(ani$angle[dataset] == "PAR") 
		gamma <- 2
	   if(ani$angle[dataset] == "PERP")
		gamma <- -1
	    for(i in 1:dA) {
		for(j in 1:dA) {
	        if(ani$anifunc[i] == "const" ||
		   ani$anifunc[i] == "exp") 
		   A[j,i] <- A[j,i] * (1+(gamma * phi[ani$parperm[[i]][2]])) 
		if(ani$anifunc[i] == "expvar") 
		   A[j,i] <- A[j,i] * (1 + (gamma * (phi[ ani$parperm[[i]][2]]
		   - phi[ ani$parperm[[i]][3]]))) 
			
	     }
	   }
        }
	A
}