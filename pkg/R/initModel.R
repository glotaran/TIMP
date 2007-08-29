"initModel" <-
function (...) 
{
    dots <- list(...)
    if ("mod_type" %in% names(dots)) {
        if (dots$mod_type == "kin") 
            model <- kin(...)
        if (dots$mod_type == "spec") 
            model <- spec(...)
	if (dots$mod_type == "mass") 
            model <- mass(...)
    }
    model@datCall <- append(model@datCall, match.call())   
    model@weight <- length(model@weightpar) != 0
    model@lclp0 <- length(model@clp0) != 0
    model@lclpequ <- length(model@clpequspec) != 0
    model <- initModelClass(model)
    model@clpCon <- getClpConstr(
			 if (model@mod_type == "spec")
			 clp = model@x else clp = model@x2,
			clp0 = model@clp0, 
			 clpequspec = model@clpequspec, 
			 ncomp = model@ncomp)
    model@x <- model@x * model@scalx
    model@fvecind <- getFixed(model)
    model@pvecind <- getPrel(model)
    model <- getConstrained(model)
    model <- addPrel(model)
    model
}
