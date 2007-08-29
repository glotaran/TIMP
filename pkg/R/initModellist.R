"initModellist" <-
function (m) 
{
    for (i in 1:length(m)) {
        m[[i]]@parnames <- sort(intersect(
	          setdiff(slotNames(theta()), c("prel","drel")), 
	          slotNames(m[[i]])))
        m[[i]]@weight <- length(m[[i]]@weightpar) != 0
	m[[i]]@lclp0 <- length(m[[i]]@clp0) != 0
        m[[i]]@lclpequ <- length(m[[i]]@clpequspec) != 0
        m[[i]] <- initModelClass(m[[i]])
	m[[i]]@clpCon <- getClpConstr(
			 if (m[[i]]@mod_type == "spec")
			 clp = m[[i]]@x else clp = m[[i]]@x2,
			clp0 = m[[i]]@clp0, 
			 clpequspec = m[[i]]@clpequspec, dataset = i, 
			 ncomp = m[[i]]@ncomp)
        m[[i]]@x <- m[[i]]@x * m[[i]]@scalx
        m[[i]]@fvecind <- getFixed(m[[i]])
        m[[i]]@pvecind <- getPrel(m[[i]])
	m[[i]]@mvecind <- m[[i]]@nvecind <- getMvec(m[[i]])
	m[[i]] <- getConstrained(m[[i]])
        m[[i]] <- addPrel(m[[i]])
    }
    m
}