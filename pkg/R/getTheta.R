"getTheta" <- function (mod) 
{
   modelspec <- mod@modelspec
   modellist <- mod@modellist
   datasetind <- mod@datasetind 
   th <- vector()
   parorder <- list()
   for(i in 1:length(modelspec)) {
	 ds <- which(datasetind == i)
	 model <- modellist[[ds[1] ]]
	 fixed <- model@fvecind
	 prel <- model@pvecind
	 mrel <- model@mvecind 
	 ppars <- append(model@parnames, "prel")
	 for (p in ppars) {
	     if(length(slot(modelspec[[i]], p)) != 0) {  
		removepar <- sort(unique(c(fixed[[p]], prel[[p]])))
		rmpar <- sort(unique(c(fixed[[p]], prel[[p]], mrel[[p]])))
		parapp <- if (length(rmpar) != 0) 
			  unlist(slot(model, p))[-rmpar]
			  else unlist(slot(model, p))
	     if(length(parapp) != 0) {
		ind <- (length(th) + 1):(length(th) + length(parapp))
	     }
	     else {
		  ind <- vector()
	     }
	     parorder[[length(parorder)+1]] <- list(name=p, ind=ind, 
	     dataset = ds, rm=rmpar)
	     if(p %in% model@positivepar && length(parapp) != 0) 
		  th <- append(th, log(parapp))
	     else 
		  th <- append(th, parapp)
           }
	}  
    }
   .currModel@parorder <<- processOrder(parorder, mod) 
   getDiffTheta(th, mod)
       
}
    