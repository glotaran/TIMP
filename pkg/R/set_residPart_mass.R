			    "set_residPart_mass" <-
function () 
{
    setMethod("residPart", signature(model = "mass"), function(model,
        group, multimodel, thetalist, clpindepX, finished, returnX, 
	rawtheta) {
	psi <- vector()
        concen <- matrix()
	if(returnX) 
		 thetalist <-  getThetaCl(rawtheta, multimodel)
	if (finished)
	    rlist <- list(irfvec=vector("list",length(group)))
        for (i in 1:length(group)) {
            m <- multimodel@modellist[[group[[i]][2]]]
            t <- thetalist[[group[[i]][2]]]
            psi <- append(psi, m@psi.weight[,group[[i]][1]])
            if(m@getX) {
		concen_i <- clpindepX[[group[[i]][2]]]
	    }
	    else concen_i <- compModelMass(t, m)
	    if (m@clpdep) {
                d1<<-concen_i
		concen_i <- doClpConstr(concen_i, clp_ind = group[[i]][1], 
                  clpCon = m@clpCon, clpequ = t@clpequ, 
		  dataset = group[[i]][2])
		d2<<-concen_i
                if (m@weight) 
                  concen_i <- weightNL(concen_i, m, group[[i]][1])
                if (dim(concen_i)[2] != 0) {
                  concen <- if (!identical(concen, matrix())) 
                    rbind(concen, concen_i)
                  else concen_i
                }
            }
            else {
                if (identical(concen, matrix())) 
                  concen <- clpindepX[[group[[i]][2]]]
                else concen <- rbind(concen, clpindepX[[group[[i]][2]]])
            }
            if (finished) {
	      rlist$irfvec[[i]] <- c(0,0)
	    }
        }
	T1<<-concen
	if(returnX)  
		    retval <- as.vector(concen) 
        else {
	   QR.temp <- qr(concen)
	   if(finished) {
		       rlist$QR <- QR.temp 
		       rlist$psi <- psi 
		       return(rlist) 
	   }
	   T2 <<- psi 
	   
	   qty.temp <- qr.qty(QR.temp, psi)
           residQspace <- qty.temp[-(1:dim(concen)[2])]
           retval <- residQspace
      }
      retval 
    })
}
