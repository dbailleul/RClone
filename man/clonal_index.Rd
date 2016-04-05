\name{clonal_index}
\alias{clonal_index}
\alias{clonal_index_core}

\title{
Indices for clonal data
}

\description{
\command{clonal_index} computes main genotypic diversity and richness indices.
}

\usage{
clonal_index(data1, vecpop = NULL, listMLL = NULL)
}

\arguments{
  \item{data1}{
a \command{RClone} table with one allele per column, haploid or diploid data.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{listMLL}{
option, a custom list of MLL.
}
}

\details{
\command{clonal_index} returns:
\itemize{
\item{the number of units \command{N},}
\item{the number of unique genotypes \command{G},}
\item{the clonal diversity index \command{R} (Dorken & Eckert 2001; 
Ellstrand & Roose 1987),}
\item{the Shannon-Wiener index estimator \command{H''} (Pielou 1966),}
\item{the Pielou evenness index \command{J'} (Pielou 1975),}
\item{the Simpson complement unbiased \command{D'} (Pielou 1969 ; Gini 1912 ; Peet 1974),}
\item{the Simpson complement index \command{V} (Hurlbert 1971 ; Fager 1972),}
\item{the reciprocal of Simpson index unbiased \command{Hill} (Hurlbert 1971 ; Hill 1973).}
}
}

\value{
a table (one population) or a list of tables (several population) with genotypic indices.
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{Pareto_index}}
}

\examples{
data(posidonia)

clonal_index(posidonia)
}

\keyword{documentation}
