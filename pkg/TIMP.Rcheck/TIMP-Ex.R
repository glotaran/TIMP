### * <HEADER>
###
attach(NULL, name = "CheckExEnv")
assign("nameEx", 
       local({
	   s <- "__{must remake R-ex/*.R}__"
           function(new) {
               if(!missing(new)) s <<- new else s
           }
       }),
       pos = "CheckExEnv")
## Add some hooks to label plot pages for base and grid graphics
assign("base_plot_hook",
       function() {
           pp <- par(c("mfg","mfcol","oma","mar"))
           if(all(pp$mfg[1:2] == c(1, pp$mfcol[2]))) {
               outer <- (oma4 <- pp$oma[4]) > 0; mar4 <- pp$mar[4]
               mtext(sprintf("help(\"%s\")", nameEx()), side = 4,
                     line = if(outer)max(1, oma4 - 1) else min(1, mar4 - 1),
              outer = outer, adj = 1, cex = .8, col = "orchid", las=3)
           }
       },
       pos = "CheckExEnv")
assign("grid_plot_hook",
       function() {
           pushViewport(viewport(width=unit(1, "npc") - unit(1, "lines"),
                                 x=0, just="left"))
           grid.text(sprintf("help(\"%s\")", nameEx()),
                     x=unit(1, "npc") + unit(0.5, "lines"),
                     y=unit(0.8, "npc"), rot=90,
                     gp=gpar(col="orchid"))
       },
       pos = "CheckExEnv")
setHook("plot.new",     get("base_plot_hook", pos = "CheckExEnv"))
setHook("persp",        get("base_plot_hook", pos = "CheckExEnv"))
setHook("grid.newpage", get("grid_plot_hook", pos = "CheckExEnv"))
assign("cleanEx",
       function(env = .GlobalEnv) {
	   rm(list = ls(envir = env, all.names = TRUE), envir = env)
           RNGkind("default", "default")
	   set.seed(1)
   	   options(warn = 1)
	   .CheckExEnv <- as.environment("CheckExEnv")
	   delayedAssign("T", stop("T used instead of TRUE"),
		  assign.env = .CheckExEnv)
	   delayedAssign("F", stop("F used instead of FALSE"),
		  assign.env = .CheckExEnv)
	   sch <- search()
	   newitems <- sch[! sch %in% .oldSearch]
	   for(item in rev(newitems))
               eval(substitute(detach(item), list(item=item)))
	   missitems <- .oldSearch[! .oldSearch %in% sch]
	   if(length(missitems))
	       warning("items ", paste(missitems, collapse=", "),
		       " have been removed from the search path")
       },
       pos = "CheckExEnv")
assign("ptime", proc.time(), pos = "CheckExEnv")
grDevices::postscript("TIMP-Ex.ps")
assign("par.postscript", graphics::par(no.readonly = TRUE), pos = "CheckExEnv")
options(contrasts = c(unordered = "contr.treatment", ordered = "contr.poly"))
options(warn = 1)    
library('TIMP')

assign(".oldSearch", search(), pos = 'CheckExEnv')
assign(".oldNS", loadedNamespaces(), pos = 'CheckExEnv')
cleanEx(); nameEx("baseIRF");
### * baseIRF

flush(stderr()); flush(stdout())

### Name: baseIRF
### Title: Baseline subtraction from a vector, usually representing an IRF.
### Aliases: baseIRF
### Keywords: file

### ** Examples
 
irfvec <- rnorm(128, mean=1) 
plot(irfvec,type="l") 
irfvec_corrected <- baseIRF(irfvec, 1, 10)
lines(irfvec_corrected, col=2)



cleanEx(); nameEx("dat-class");
### * dat-class

flush(stderr()); flush(stdout())

### Name: dat-class
### Title: Class "dat" for model and data storage
### Aliases: dat-class dat
### Keywords: classes

### ** Examples

# simulate data 

 C <- matrix(nrow = 51, ncol = 2)
 k <- c(.5, 1)
 t <- seq(0, 2, by = 2/50)
 C[, 1] <- exp( - k[1] * t)
 C[, 2] <- exp( - k[2] * t) 
 E <- matrix(nrow = 51, ncol = 2)
 wavenum <- seq(18000, 28000, by=200)
 location <- c(25000, 20000)
 delta <- c(5000, 7000)
 amp <- c(1, 2)
 E[, 1] <- amp[1] * exp( - log(2) * (2 * (wavenum - location[1])/delta[1])^2)
 E[, 2] <- amp[2] * exp( - log(2) * (2 * (wavenum - location[2])/delta[2])^2)
 sigma <- .001
 Psi_q  <- C 

 # initialize an object of class dat 
 Psi_q_data <- dat(psi.df = Psi_q, x = t, nt = length(t), 
 x2 = wavenum, nl = length(wavenum))

 # initialize an object of class dat via initModel 
 # this dat object is also a kin object
 kinetic_model <- initModel(mod_type = "kin", seqmod = FALSE, 
 kinpar = c(.1, 2))



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
