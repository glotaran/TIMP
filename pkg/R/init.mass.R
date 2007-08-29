"init.mass" <-
function(){
setClass("mass", 
representation("kin", 
peakpar = "list", 
peakfunct = "character",
lzerofile = "character"),
prototype = list( 
peakpar = list(), 
peakfunct = "expmodgaus", 
lzerofile = "", 
getX=TRUE)
)
}

