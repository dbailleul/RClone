\name{RClone-package}
\alias{RClone-package}
\alias{RClone}
\alias{RClone_quickmanual}
\docType{package}

\title{
RClone
}

\description{
\command{RClone} is a R package gathering all the functions of GenClone program to handle data (haploid and diploid) with clones.
}

\details{
	\tabular{ll}{
		Package: \tab RClone\cr
		Type: \tab Package\cr
		Title: \tab GenClone\cr
		Version: \tab 1.0\cr
		Date: \tab 2015-07-31\cr
		License: \tab GPL (>=2.0)\cr
		LazyLoad: \tab yes\cr
	}

This package contains several types of functions: 
\itemize{
	\item import/export functions to handle data from GenClone (see \code{\link{transcript_GC}}) 
and Adegenet and export \command{RClone} data for Genetix and Arlequin (for example see \code{\link{export_genclone_genetix}}),
	\item functions to help defining MLL (MultiLocus Lineage) as \code{\link{psex}} and \code{\link{genet_dist}},
	\item descriptive functions to compute genotypic richness and diversity: \code{\link{clonal_index}}, \code{\link{genclone}} and \code{\link{Pareto_index}},
	\item functions for spatial analyses of clonal structure (see for example \code{\link{autocorrelation}}).
}
}


\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr>
}

\references{
Review: "Standardizing methods to address clonality in population studies"
2007, Molecular Ecology, S. Arnaud-Haond, C.M. Duarte, F. Alberto and E.A. Serrao
}

\keyword{
package
}
