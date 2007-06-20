"getPar" <- 
function (model, po, th, theta=theta(), addM=FALSE) 
{
	 removepar <- po$rm 
	 if(length(unlist(slot(model, po$name))) - length(removepar) != 0)
		 parvec <- th[po$ind]
         else 
		parvec <- vector()
	 if(po$name %in% model@positivepar && length(parvec) != 0) 
		parvec <- exp(parvec)
	 if(length(model@clinde[[po$name]] > 0)){ 
		for(i in 1:length(model@clinde[[po$name]])) { 
		    if(!po$name %in% model@positivepar) {
			parvec[i] <- exp(parvec[i])
		    }
		    parvec[i] <- model@lowcon[[po$name]][i] - parvec[i]
		} 
	}
	 if(length(model@chinde[[po$name]]) > 0) {
		for(i in 1:length(model@chinde[[po$name]])) { 
		    if(!po$name %in% model@positivepar) {
			parvec[i] <- exp(parvec[i])
		    }
		    parvec[i] <- model@highcon[[po$name]][i] + parvec[i]
		}
         }
	 for(fx in removepar){
		if(fx %in% model@fvecind[[po$name]])
		    parvec <- append(parvec, unlist(slot(model, po$name))[fx], 
			        after=(fx-1))
                else if(fx %in% model@pvecind[[po$name]] || (
		        fx %in% model@mvecind[[po$name]] && !addM)) 
		    parvec <- append(parvec, 0, after=(fx-1))

	 }
	 parvec
}

