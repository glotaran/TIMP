"init.anispec" <-
function () 
{
    setClass("anispec", 
	representation(angle = "vector", 
			anifunct = "list", 
			anistart = "vector", 
			useparper = "logical", 
			rammanest = "logical",
			super = "list"
			), 
        prototype = list(angle = vector(), 
			anifunct = list(), 
			anistart = vector(), 
			useparper = FALSE, 
			rammanest = FALSE,
			super = list()
			))
}

