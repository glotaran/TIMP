".onLoad" <- function (lib, pack)
{

	init.dat()
	init.theta()
	init.kin()
	init.mass()
	init.spec()	
	
	init.res()
	init.fit()
	init.multitheta()
	init.multimodel()
	
	init.opt()
	init.kinopt()
	init.specopt()
	init.massopt()
	
	setGenerics()
	setMethods() 

	library.dynam(pack, pack, lib)

}
