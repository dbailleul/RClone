\name{freq_RR}
\alias{freq_RR}
\alias{freq_RR_core}
\alias{freq_finder}

\title{
Allelic Frequencies
}

\description{
\command{freq_RR} returns a table of allelic frequencies computed with or 
without Round-Robin method.
}

\usage{
freq_RR(data1, haploid = FALSE, vecpop = NULL, genet = FALSE, RR = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option,\command{haploid} indicates the ploidy level of \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{genet}{
option, if \command{TRUE}, \command{data1} is reduced to genets.
}
  \item{RR}{
option, if \command{TRUE}, indicates frequencies are computed with Round-Robin 
method.
}
}

\details{
Round-Robin method (Parks & Werth 1993) is a sub-sampling approach which avoids 
overestimation of rare alleles. \cr
Each locus frequency is estimated on MLG lists constructed without the locus 
sampled. \cr
This calculation is repeated for all loci.
}

\value{
a table (one population) or a list of tables (several populations) with three columns:
\itemize{
\item a first column with the number of the locus considered (written as \emph{"locus_1")},
\item a second column with the list of the unique alleles of the locus,
\item a last column with the frequency of the allele in row.
}
}

\references{
Parks & Werth, 1993, A study of spatial features of clones in a population of 
Bracken fern, \emph{Pteridium aquilinum} (Dennstaedtiaceae).
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\seealso{
\code{\link{pgen}} and \code{\link{pgen_Fis}}
}

\examples{
data(posidonia)

freq_RR(posidonia, RR = TRUE)
freq_RR(posidonia)
}

\keyword{documentation}
