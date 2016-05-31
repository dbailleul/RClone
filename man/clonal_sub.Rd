\name{clonal_sub}
\alias{clonal_sub}
\alias{clonal_sub_core}
\alias{id_clonal_mod}
\alias{id_clonal_mod_MLL}

\title{
Clonal Subrange
}

\description{
\command{clonal_sub} computes the clonal subrange analysis with spatial distance
 intervals and the corresponding probabilities of clonal identity.
}

\usage{
clonal_sub(data1, coords = NULL, vecpop = NULL, listMLL = NULL, class1 = FALSE, 
		class2 = FALSE, d = NULL, vecdist = NULL)
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
  \item{listMLL}{
option, a custom list of MLL.
}
  \item{class1}{
option, if \command{TRUE}, computes distance classes of \command{d} equidistant classes.
}
  \item{class2}{
option, if \command{TRUE}, computes distance classes of \command{d} classes with
 the same number of units pairs each.
}
  \item{d}{
numeric, number of distance classes.
}
  \item{vecdist}{
option, a custom vector distance intervals to construct distance classes.
}
}

\details{
By default, \command{d = 10} and \command{clonal_sub} computes 10 equidistant 
distance classes for all the ramets pairs.


The function proposes 3 others options: 
\itemize{
\item \command{class1} fixing \command{d} equidistant classes,
\item \command{class2} fixing \command{d} distance classes with the same 
number of units pairs,
\item \command{vecdist != NULL} allowing the user to give a vector, 
\command{vecdist} of intervals. \command{vecdist} must start with 0 and
end with \command{max(dist)}.
}
}

\value{
A list of:
\item{clonal_sub_res}{clonal subrange, i.e. maximum distance between two units 
sharing the same MLG/MLL (Alberto et al., 2005)}
\item{clonal_sub_tab}{table of results with, per class, the number of units pairs, 
the min, max and mean distances between pairs and \command{Fr/log(Fr)} the fraction of pairs of 
ramets sharing the same MLG/MLL}

For multi-population \command{data1}, a list of lists per population.
}

\references{
Alberto et al., 2005, Spatial genetic structure, neighbourhood size and clonal 
subrange in seagrass (\emph{Cymodocea nodosa}) populations.


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
\code{\link{autocorrelation}}, \code{\link{agg_index}} and \code{\link{edge_effect}}
}

\examples{
data(posidonia)
data(coord_posidonia)

distGC <- c(0,10,15,20,30,50,70,76.0411073)

clonal_sub(posidonia, coords = coord_posidonia)
clonal_sub(posidonia, coords = coord_posidonia, vecdist = distGC)
}

\keyword{documentation}
