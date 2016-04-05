\name{kinship}
\alias{kinship_Loiselle}
\alias{kinship_Ritland}
\alias{kinship_Loiselle_core}
\alias{kinship_Ritland_core}
\alias{kinship}

\title{
Loiselle and Ritland kinship coefficients
}

\description{
\command{kinship_Loiselle} and \command{kinship_Ritland} compute average genetic
 distances or kinship coefficients.
}

\usage{
kinship_Loiselle(data1, haploid = FALSE, vecpop = NULL)
kinship_Ritland(data1, haploid = FALSE, vecpop = NULL)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
}

\value{
a \command{dist} object (or a list of \command{dist} objects for multi-population
\command{data1}) with genetic distances between pairs of units.
}

\references{
Loiselle et al., 1995, Spatial genetic structure of a tropical understory shrub, 
\emph{Psychotria officinalis} (Rubiaceae).


Ritland, 1996, A marker-based method for inferences about quantitative 
inheritance in natural populations.


Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{autocorrelation}}
}

\examples{
data(posidonia)

#kinship_Loiselle(posidonia)
#kinship_Ritland(posidonia)
}

\keyword{documentation}
