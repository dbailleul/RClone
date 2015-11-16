\name{pgen}
\alias{pgen}
\alias{pgen_core}
\alias{pgen_Fis}
\alias{pgen_Fis_core}

\title{
Probability of a Genotype
}

\description{
\command{pgen} and \command{pgen_Fis} compute the probability of a genotype 
under the Hardy-Weinberg equilibrium assumption (with or without taking account 
of departures from H-W equilibrium).
}

\usage{
pgen(data1, haploid = FALSE, vecpop = NULL, genet = FALSE, RR = FALSE)
pgen_Fis(data1, vecpop = NULL, genet = FALSE, RR = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
Not edible for \command{pgen_Fis}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{genet}{
option, if \command{genet = TRUE}, computes \command{pgen} on genet level.
}
  \item{RR}{
option, if \command{RR = TRUE}, computes \command{pgen} with Round-Robin method.
}
}

\value{
a table (one population) or a list of tables (several populations) with \command{pgen}
 computed for each genotype.
}

\note{
We strongly recommand to use \command{RR = TRUE} option to compute allelic 
frequencies for clonal data.  
Otherwise, we let the options to work with frequencies at genet level 
(\command{genet = TRUE}) or ramet level (\command{RR = FALSE} and 
\command{genet = FALSE}).
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{freq_RR}}, \code{\link{psex}} and \code{\link{psex_Fis}}
}

\examples{
data(posidonia)

pgen(posidonia, RR = TRUE)
pgen_Fis(posidonia, RR = TRUE)
}

\keyword{documentation}
