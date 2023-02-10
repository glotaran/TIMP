# TIMP

TIMP is an R package developed by [Mullen and van Stokkum](https://doi.org/10.18637/jss.v018.i03) for fitting models to data arising from time-resolved [spectroscopy](https://doi.org/10.18637/jss.v018.i03/), Fluorescence Lifetime Imaging Microscopy ([FLIM](https://doi.org/10.18637/jss.v018.i08)) and [mass spectroscopy](https://doi.org/10.1016/j.chemolab.2008.10.004) experiments.

The package provides a comprehensive problem solving environment ([PSE](https://doi.org/10.1002/cpe.916)) for fitting separable nonlinear models to a variety of datasets. It is used for modeling multiway spectroscopic measurements, and allows users to simultaneously analyze datasets collected under a range of experimental conditions. To do this efficiently it implements the [partitioned variable projection algorithm](https://doi.org/10.1007/s11075-008-9235-2).

## Installation

[TIMP is available from CRAN](https://cran.r-project.org/package=TIMP). To install, from an R Console type:

```R
install.packages("TIMP")
```

[![](https://cranlogs.r-pkg.org/badges/TIMP)](https://cran.r-project.org/package=TIMP)

## The Glotaran Ecosystem

TIMP is part of the Glotaran ecosystem (glotaran.org). It functions as the computational back-end of [glotaran-legacy](https://github.com/glotaran/glotaran-legacy), the original Java-based GUI for TIMP, released under the name Glotaran. Additionally it is used as the backend for [paramGUI](github.com/glotaran/paramGUI/), a R Shiny web app for teaching parameter estimation by examples.

## Cite

TIMP can be cited as:

> Mullen KM, van Stokkum IHM (2007). TIMP: An R Package for Modeling Multi-way Spectroscopic Measurements. Journal of Statistical Software, 18(3). URL https://doi.org/10.18637/jss.v018.i03/.

*See also [citation.html on CRAN](https://cran.r-project.org/web/packages/TIMP/citation.html)*

## Contributors

TIMP has its origins in more than 15 years of software development for applications in computational physics by [Ivo van Stokkum](https://github.com/ism200).

[Katharine Mullen](https://github.com/k-m-m) created the package during her PhD studies and was the primary developer for many years. She's now at [UCLA](https://www.ucla.edu/).

[Sergey Laptenok](https://github.com/SerLap) has contributed options for FLIM data and invaluable experience and testing on the MS Windows OS, co-creator of the Glotaran GUI.

David Nicolaides has contributed options for modeling reaction kinetics as described by kinetic theory models.

[Alessandro Marin](https://github.com/aless80) has contributed testing and ideas for new options.

Ilya Stepanenko has implemented [PPViewer](https://glotaran.github.io/TIMP/ppviewer.html), a LabVIEW application for interactive exploration of data and model fit that is useful for examining TIMP datafiles and model fit output.

The members of the [biophysics group](https://vu.nl/en/research/more-about/biophysics-of-photosynthesis) of the Department of [Physics and Astronomy](https://vu.nl/en/about-vu/faculties/faculty-of-science/departments/physics-and-astronomy) of the Vrije Universiteit Amsterdam have motivated much of the development of TIMP.

The package is currently maintained by [Joris Snellenburg](https://github.com/jsnel), who also created and maintains the [Glotaran GUI for TIMP]((https://github.com/glotaran/glotaran-legacy)).

## Package statistics

| TIMP        | Downloads |
| ---         | ---:      |
| Last day    | [![](https://cranlogs.r-pkg.org/badges/last-day/TIMP)](https://cran.r-project.org/package=TIMP) |
| Last week   | [![](https://cranlogs.r-pkg.org/badges/last-week/TIMP)](https://cran.r-project.org/package=TIMP) |
| Last month  | [![](https://cranlogs.r-pkg.org/badges/last-month/TIMP)](https://cran.r-project.org/package=TIMP) |
| Total       | [![](https://cranlogs.r-pkg.org/badges/grand-total/TIMP)](https://cran.r-project.org/package=TIMP) |
| Citations   | [![Citation Badge](https://img.shields.io/endpoint?color=dark-green&url=https%3A%2F%2Fapi.juleskreuer.eu%2Fcitation-badge.php%3Fshield%26doi%3D10.18637%2Fjss.v018.i03)](https://scholar.google.com/scholar?cites=1580993763699246806&as_sdt=2005&sciodt=0,5) |

Download count thanks to the [cranlogs.app](https://github.com/r-hub/cranlogs.app) service.

Citations thanks to Jules Kreuer's [Citation Badge](https://juleskreuer.eu/projekte/citation-badge/).

### Notes
- [TIMP 1.0](https://www.jstatsoft.org/index.php/jss/article/view/v018i03/1547) was published January 10th 2007.
- [TIMP 1.2](https://cran.r-project.org/src/contrib/Archive/TIMP/TIMP_1.2.tar.gz) is the earliest version on CRAN, published 1st of May 2007.
- The grand-total download count, is only from from _October 2012_ (5 year of stats missing).
