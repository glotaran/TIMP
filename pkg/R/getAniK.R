"getAniK" <- function (k, dataset, ani, phi)
{
	if(ani$angle[dataset] != "MA") {
	    for(i in 1:length(k)) {
	        if(ani$anifunc[i] == "exp" ||
		   ani$anifunc[i] == "expvar") 
		   k[i] <- k[i] + phi[ ani$parperm[[i]][1] ]
			
	    }
	}
	k 
}
