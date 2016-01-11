\name{Fis}
\alias{Fis}
\alias{Fis_core}

\title{
Fis
}

\description{
\command{Fis} computes observed Heterozygosity (\command{Hobs}), expected 
Heterozygosity (\command{Hexp}; Nei, 1978) and \command{Fis} from ramets or genets.
}

\usage{
Fis(data1, vecpop, genet = FALSE, RR = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column for diploid data.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.\cr
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{genet}{
option, if \command{TRUE}, \command{data1} is reduced to genets.
}
  \item{RR}{
option, if \command{TRUE}, \command{Fis} and allelic frequencies are computed
with Round-Robin method.
}
}

\details{
Allelic frequencies are computed:\cr
\itemize{
\item on ramet level,  
\item on genet level (\command{genet = TRUE}),  
\item with Round-Robin method (\command{RR = TRUE}, see \code{\link{freq_RR}}).
}
}

\value{
a table with \command{Hobs}, \command{Hexp} and \command{Fis} for each locus.


If \command{RR = TRUE}, a list of the \command{Hobs/Hexp/Fis} table and another 
table with Round-Robin frequencies.

If \command{data1} is a multi-population table, a list of table(s) for each population.
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{freq_RR}}, \code{\link{pgen}}, \code{\link{pgen_Fis}}, \code{\link{psex}} 
and \code{\link{psex_Fis}}
}

\examples{
data(posidonia)

Fis(posidonia)
Fis(posidonia, genet = TRUE)
Fis(posidonia, RR = TRUE)
}

\keyword{documentation}
