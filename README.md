# TIMP

TIMP is an R package for fitting superposition models that implements the partitioned variable projection algorithm.

The package has been extensively applied to modeling [spectroscopy](https://doi.org/10.18637/jss.v018.i03/) and Fluorescence Lifetime Imaging Microscopy ([FLIM](https://doi.org/10.18637/jss.v018.i08)) datasets.

## Installation

[TIMP is available from CRAN](https://cran.r-project.org/package=TIMP). To install, from an R Console type:

```R
install.packages("TIMP")
```

## The Glotaran Ecosystem

TIMP is part of the Glotaran ecosystem (glotaran.org). It functions as the computational back-end of [glotaran-legacy](https://github.com/glotaran/glotaran-legacy), the original Java-based GUI for TIMP, released under the name Glotaran.

## Cite

TIMP can be cited as:

Mullen KM, van Stokkum IHM (2007). TIMP: An R Package for Modeling Multi-way Spectroscopic Measurements. Journal of Statistical Software, 18(3). URL https://doi.org/10.18637/jss.v018.i03/.

See also [citation.html on CRAN](https://cran.r-project.org/web/packages/TIMP/citation.html)

## Contributors

TIMP has its origins in more than 15 years of software development for applications in computational physics by [Ivo van Stokkum](@ism200).
Katharine Mullen is the creator of the package and was the primary developer for many years.
Sergey Laptenok has contributed options for FLIM data and invaluable experience and testing on the MS Windows OS, co-creator of the Glotaran GUI.
David Nicolaides has contributed options for modeling reaction kinetics as described by kinetic theory models.
Alessandro Marin has contributed testing and ideas for new options.
Ilya Stepanenko has implemented PPViewer, a LabVIEW application for interactive exploration of data and model fit that is useful for examining TIMP datafiles and model fit output.
The members of the biophysics group of the Department of Physics and Astronomy of the Vrije Universiteit Amsterdam have motivated much of the development of TIMP.

The package is currently maintained by Joris Snellenburg, who also created and maintains the [Glotaran GUI for TIMP]((https://github.com/glotaran/glotaran-legacy)).
