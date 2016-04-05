\name{agg_index}
\alias{agg_index}
\alias{agg_index_core}
\alias{nearest_unit}
\alias{id_clonal}
\alias{id_clonal_MLL}

\title{
Aggregation of clones
}

\description{
\command{agg_index} computes \command{Ac} (aggregation of clonal lineages) assessed 
by comparing the probability of clonal identity between nearest units pairs.
}

\usage{
agg_index(data1, coords = NULL, vecpop = NULL, nbrepeat = 1, bar = FALSE, 
listMLL = NULL)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column, haploid or diploid data.
}
  \item{coords}{
a table with coordinates of every units in \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{nbrepeat}{
numeric, the number of repeats.
}
  \item{bar}{
option, if \command{TRUE}, adds a progression bar.
}
  \item{listMLL}{
option, a custom list of MLL.
}
}

\details{
The probability of clonal identity is set as 0 if ramets belong to the same 
MLG/MLL and 1 otherwise.


\command{Ac} is computed as \command{Ac=(Psg-Psp)/Psg} with \command{Psg} the 
average probability of clonal identity of all pairs and \command{Psp} among pairwise
 nearest neighbours.
 
 
Coordinates of units are randomly permuted \command{nbrepeat} times to provide 
a upper pvalue for \command{Ac} (Monte Carlo).
}

\value{
a list (one population) or a list of lists (multi-populations) of:
\itemize{
\item results a table with \command{Ac} value, pvalue and the number of permutations.
\item simulations a vector of \command{nbrepeat} values of \command{sim-Ac}.
}
}

\references{
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
\code{\link{autocorrelation}}, \code{\link{clonal_sub}} and \code{\link{edge_effect}}
}

\examples{
data(posidonia)
data(coord_posidonia)

agg_index(posidonia, coords = coord_posidonia)
#agg_index(posidonia, coords = coord_posidonia, nbrepeat = 1000, bar = TRUE) #takes time
}

\keyword{documentation}
