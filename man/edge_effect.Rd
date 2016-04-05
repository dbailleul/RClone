\name{edge_effect}
\alias{edge_effect}
\alias{edge_effect_core}

\title{
Edge Effect
}

\description{
\command{edge_effect} tests the occurrence of Edge Effect.
}

\usage{
edge_effect(data1, coords = NULL, center = NULL, vecpop = NULL, nbrepeat = 1, 
		bar = FALSE, listMLL = NULL)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column, haploid or diploid data.
}
  \item{coords}{
a table with coordinates of every units in \command{data1}.
}
  \item{center}{
a vector or a list of vectors, with \command{c(x,y)} coordinates of the 
centre of the sampling area.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{nbrepeat}{
numeric, option, the number of repeats.
}
  \item{bar}{
logical, option, if \command{TRUE}, adds a progression bar.
}
  \item{listMLL}{
option, a custom list of MLL.
}
}

\details{
The index of edge effect \command{Ee} estimates the effect of sampling (scheme 
and strategy) on genotypic richness estimation and in particular overestimation 
due to large clones sampled only once at the edge of the sampling area.


\command{Ee} is estimated as \command{Ee=(Du-Da)/Da} with \command{Du} average
 geographic distances between unique MLG/MLL and the centre, and \command{Da}
  between all sampling units and the centre. 
  
  
As for the aggregation index \command{Ac}, coordinates of units are randomly 
permuted \command{nbrepeat} times to provide a upper p-value (Monte Carlo).
}

\value{
a list (one population) or list of lists (several populations) with 
\itemize{
\item results a table with \command{Ee} value, pvalue and the number of permutations.
\item simulations a vector of \command{nbrepeat} values of \command{sim-Ee}.
}
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
\code{\link{autocorrelation}}, \code{\link{clonal_sub}} and \code{\link{agg_index}}
}

\examples{
data(posidonia)
data(coord_posidonia)

center1 <- c(40,10)
#Our sample quadra ranges from 0 to 80 and 0 to 20

edge_effect(posidonia, coords = coord_posidonia, center = center1, nbrepeat = 1000, 
	bar = TRUE)

#But if, for some reasons you don't know where the middle of the sampling 
##area is, you can try some of these:
center <- c(mean(coord_posidonia[,1]), mean(coord_posidonia[,2])) #or
center <- c(mean(c(min(coord_posidonia[,1]), max(coord_posidonia[,1]))), 
mean(c(min(coord_posidonia[,2]), max(coord_posidonia[,2])))) #or
center <- c((max(coord_posidonia[,1])-min(coord_posidonia[,1]))/2, 
(max(coord_posidonia[,2])-min(coord_posidonia[,2]))/2)
}

\keyword{documentation}
