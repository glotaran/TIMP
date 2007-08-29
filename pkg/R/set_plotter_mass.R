"set_plotter_mass" <- function () 
{
    setMethod("plotter", signature(model = "mass"), function(model, 
        multimodel, multitheta, plotoptions) {
	if(length(plotoptions@paropt) == 0)
	          plotoptions@paropt <- par(mgp = c(1.5, 1, 0), 
			      mai = c(0.5, 0.6, .5, 0.5),mar=c(3,3,4,1))
	plotoptions@addest <- c("peakpar")
	sumonls <- multimodel@fit@nlsres$sumonls
	onls <- multimodel@fit@nlsres$onls
	resultlist <- multimodel@fit@resultlist
	if(length(plotoptions@superimpose) > 0) {
	    if (!plotoptions@notraces) 
	       plotTracesSuper(multimodel, multitheta, plotoptions)
        }
        else {
            if (!plotoptions@notraces) 
	       plotTraces(multimodel, multitheta, plotoptions)
        }
	if(plotoptions@residplot) {
		if(!plotoptions@FLIM) 
		   plotResids(multimodel, multitheta, plotoptions) 
	}
	if(plotoptions@writefit || plotoptions@writefitivo)
		writeFit(multimodel, multitheta, plotoptions)
        if (length(plotoptions@breakdown)>0) 
            plotKinBreakDown(multimodel, multitheta, 
                plotoptions)           
	get(getOption("device"))()
	par(mgp = c(2, 1, 0), mar=c(3,3,3,2), oma = c(1,0,4,0), 
	mfrow=c(plotoptions@summaryplotrow, plotoptions@summaryplotcol))
        m <- multimodel@modellist
        t <- multitheta
        allx2 <- allx <- vector() 
	for(i in 1:length(m)) {
	  allx2 <- append(allx2, m[[i]]@x2) 
	  allx <- append(allx, m[[i]]@x)
	}
	xmax <- max(allx)
        xmin <- min(allx)
	x2max <- max(allx2)
        x2min <- min(allx2)
        conmax <- list()
	tauList <- list() 
	muList <- list()       
	contoplotList <- list() 
	minc <- maxc <- 0 
	for (i in 1:length(m)) {
	    C <- compModelMass(theta = t[[i]], model = m[[i]])
	      if(plotoptions@writerawcon) 
		 write.table(C, file=paste(plotoptions@makeps,
		 "_rawconcen_dataset_", i, ".txt", sep=""), quote = FALSE,
		  row.names = m[[i]]@x)
            CTil <- doClpConstr(C, 1, m[[i]]@clpCon, t[[i]]@clpequ, 
		     dataset = i)
            
        }
    })
}
