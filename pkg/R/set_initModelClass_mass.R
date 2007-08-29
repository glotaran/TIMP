"set_initModelClass_mass" <- 
function(){
  setMethod("initModelClass", signature(model="mass"), 
    function (model) 
    {
	model@clpdep <- (model@weight || model@lclp0 || model@lclpequ)
	model@ncomp <-length(model@peakpar)
	model
   }) 
}
