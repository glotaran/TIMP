"getAutoClp0" <-
function (model) {
  # autoclp0 is list with elements
  # oldRes: the output of the fitModel
  # ind: the index in the result to use. defaults to 1.  
  oldRes <- model@autoclp0[[1]]
  ind <- if(length(model@autoclp0$ind) < 1) 1 else
  model@autoclp0$ind
  clp <- getSpecList(oldRes$currModel, oldRes$currTheta)[[ind]]
  toConstr <- which(x<0, arr.ind=TRUE)
  clpval <- slot(model, model@clpType)
  getConstr <- function(r) list(from = clpval[ r[1] ], to = clpval[ r[1] ],
                                comp = r[2])
  clp0 <- vector("list", nrow(clp))
  for(i in 1:nrow(clp)) {
    clp0[[i]] <- getConstr(clpval[i,])
  }
  clp0
}
