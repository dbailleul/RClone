\name{zostera}
\alias{zostera}
\docType{data}

\title{
Zostera Dataset
}

\description{
A sub-sample table of a large dataset of \emph{Zostera marina} sampled in Brittany, France.
}

\usage{data("zostera")}
\format{
  A data frame with 59 observations on the following 12 variables.
  \describe{
    \item{\code{population}}{a character vector indicating the population}
    \item{\code{x}}{a character vector indicating the population}
    \item{\code{y}}{a character vector indicating the population}
    \item{\code{GA12}}{first locus}
    \item{\code{GA16}}{second locus}
    \item{\code{GA17D}}{third locus}
    \item{\code{GA17H}}{fourth locus}
    \item{\code{GA19}}{fifth locus}
    \item{\code{GA2}}{sixth locus}
    \item{\code{GA20}}{seventh locus}
    \item{\code{GA23}}{eighth locus}
    \item{\code{GA35}}{ninth allele of locus}
  }
}

\source{
Becheler R, Benkara E, Moalic Y, Hily C, Arnaud-Haond S (2013) 

Data from: Scaling of processes shaping the clonal dynamics and genetic mosaic 
of seagrasses through temporal genetic monitoring. 

Dryad Digital Repository. \doi{10.5061/dryad.1vp70}
}

\references{
Becheler R, Benkara E, Moalic Y, Hily C, Arnaud-Haond S (2013) Scaling of processes 
shaping the clonal dynamics and genetic mosaic of seagrasses through temporal genetic 
monitoring. Heredity 112(2): 114-121. 

\doi{10.1038/hdy.2013.82}
}

\examples{
data(zostera)
popvec <- zostera[,1]
coord_zostera <- zostera[,2:3]
zostera <- convert_GC(zostera[,4:ncol(zostera)], 3)
}

\keyword{datasets}
