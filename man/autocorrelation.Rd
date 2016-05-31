\name{autocorrelation}
\alias{autocorrelation}
\alias{autocorrelation_core}
\alias{red_MLL}
\alias{red_MLL_mod}
\alias{graph_autocorrelation}

\title{
Spatial Autocorrelation
}

\description{
\command{autocorrelation} computes kinship coefficients (Loiselle or Ritland) 
between pairs of individuals within specific ranges of geographic distance.
}

\usage{
autocorrelation(data1, haploid = FALSE, coords = NULL, vecpop = NULL, listMLL = NULL, 
	Loiselle = FALSE, Ritland = FALSE, 
	genet = FALSE, central_coords = FALSE, random_unit = FALSE, weighted = FALSE, 
	class1 = FALSE, class2 = FALSE, d = NULL, vecdist = NULL, 
	graph = FALSE, nbrepeat = NULL, export = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
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
  \item{Loiselle}{
logical, if \command{TRUE}, Loiselle kinship coefficients are computed.
}
  \item{Ritland}{
logical, if \command{TRUE}, Ritland kinship coefficients are computed.
}
  \item{genet}{
option, \command{TRUE} keeps only MLG of \command{data1}.
}
  \item{central_coords}{
option, if \command{genet = TRUE}, \command{central_coords} computes central 
coordinates for each MLG/MLL.
}
  \item{random_unit}{
option, if \command{genet = TRUE}, \command{random_unit} keeps coordinates of 
only one unit per MLG/MLL.
}
  \item{weighted}{
option, if \command{genet = TRUE}, \command{weighted} computes a weighted 
matrix over ramets.
}
  \item{class1}{
option, if \command{TRUE}, computes distance classes of \command{d} equidistant 
classes.
}
  \item{class2}{
option, if \command{TRUE}, computes distance classes of \command{d} 
classes with the same number of units pairs each.
}
  \item{d}{
numeric, option, number of distance classes. By default, d = 10.
}
  \item{vecdist}{
option, a custom vector distance to construct distance classes.
}
  \item{graph}{
option, if \command{TRUE}, displays kinship coefficient between pairs plotted 
against distance.
}
  \item{nbrepeat}{
numeric, option, if \command{pvalue = TRUE}, \command{nbrepeat} is the number of 
resampling to enable pvalues computation.
}
  \item{export}{
option, if \command{TRUE}, graph is saved as .eps into working directory.
}
}

\details{
By default, \command{d = 10} and \command{autocorrelation} computes 10 
equidistant distance classes for all the ramets pairs.\cr
The function proposes 3 others options: 
\itemize{
\item \command{class1} fixing \command{d} equidistant classes,
\item \command{class2} fixing \command{d} distance classes with the same 
number of units pairs,
\item \command{maxdist = TRUE} allowing the user to give a vector 
\command{vecdist} of intervals.
}


The function computes one of the two average kinship coefficients: Loiselle 
and Ritland.


Autocorrelation can be compute on ramets level, or genet level with:
\itemize{
\item central coordinates of each MLG/MLL,
\item a re-sampling approach which randomly allocates one of the unit's 
coordinates per MLG/MLL (Alberto 2005),
\item keeping all the ramets but weighting the matrix distances by a 
weighted matrix (Wagner 2005) where units of the same MLG/MLL are set to 0.
}

A permutation approach could be perform to assess pvalue and confidence 
intervals by permutation of the geographic coordinates among units.\cr
For the re-sampling approach, a unit of each MLG/MLL is randomly picked at each 
permutation.\cr
The p-value of mean kinship coefficients is related with the overall mean kinship
 coefficient: upper p-value (Monte Carlo) if greater or equal to the overall;
 otherwise, lower p-value.\cr
For \command{b} and \command{Sp}, their p-value correspond to upper p-value.\cr
}

\value{
\command{autocorrelation} returns a list (one population) or lists of list 
(several populations) of:
\itemize{
	\item{\command{Main_results}}{, a table with for each class, min, max, mean and 
	ln(mean) of distance between two units, the number of pairs, the mean 
	kinship coefficient and \cr if \command{pvalue = TRUE}, the pvalue.}
	\item{\command{Slope_and_Sp_index}}{, a table with slopes of the regression between 
	genetic and geographic/log(geographic) distances and \command{Sp} and 
	\command{Sp_log} (used to quantify Spatial Genetic Structure, Vekemans and Hardy, 2004) 
	as observed values, mean and \cr standard deviation of the simulated values, 95\% and 90\% confidence 
	intervals and p-value.}
	\item{\command{Slope_resample}}{, a table with slopes of the regression between 
	genetic and geographic/log(geographic) distances at each pvalue.}
	\item{\command{Kinship_resample}}{, a table with for each class in column and each 
	pvalue in row the mean kinship coefficient.}
	\item{\command{Matrix_kinship_results}}{, a dist object with kinship coefficients.}
	\item{\command{Class_kinship_results}}{, a list of kinship coefficients by distance 
	class.}
	\item{\command{Class_distance_results}}{, a list of geographical distances by distance
	 class.}
}
}

\references{
Loiselle et al., 1995, Spatial genetic structure of a tropical understory shrub,
 \emph{Psychotria officinalis} (Rubiaceae).
 
 
Ritland, 1996, A marker-based method for inferences about quantitative 
inheritance in natural populations.


Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.


Vekemans & Hardy, 2004, New insights from fine-scale spatial genetic structure 
analyses in plant populations.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\seealso{
\code{\link[=kinship]{kinship_Loiselle}}, \code{\link[=kinship]{kinship_Ritland}}
}

\examples{
data(posidonia)
data(coord_posidonia)

distGC <- c(0,10,15,20,30,50,70,76.0411073)

#res1 <- autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, nbrepeat = 1000)

#res2 <- autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, 
#class2 = TRUE, d = 7)

#res2[[1]] #Main_results
#res1[[2]] #Slope_and_Sp_index
#res2[[3]] #Slope_and_Sp_index

#res3 <- autocorrelation(posidonia, coords = coord_posidonia, Loiselle = TRUE, 
#vecdist = distGC, graph = TRUE)
}

\keyword{documentation}
