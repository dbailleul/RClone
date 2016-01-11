\name{Pareto_index}
\alias{Pareto_index}
\alias{Pareto_index_core}

\title{
Pareto index
}

\description{
\command{Pareto_index} computes parameters of the Pareto distribution.
}

\usage{
Pareto_index(data1, vecpop = NULL, listMLL = NULL, full = FALSE, graph = FALSE, 
				legends = 1, export = FALSE)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column, haploid or diploid data.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{listMLL}{
option, a custom list of MLL.
}
  \item{full}{
option, if \command{TRUE}, gives more detailed results.
}
  \item{graph}{
option, if \command{TRUE}, displays plot of the inverse cumulated frequency of 
the number of lineages.
}
  \item{export}{
option, if \command{TRUE}, graph is saved as .eps into working directory.
}
  \item{legends}{
option, numerical, with \command{graph = TRUE}, \command{legends = 1} gives 
the log-log regression equation; \cr \command{legends = 2} gives the Pareto 
index, the r2 and the p-value of the regression.
}
}

\details{
Pareto's Beta is given as \command{-slope} of the linear regression of the 
inverse cumulated frequency of the number of lineages (Pareto 1897 in Vidondo 1997).


The distribution of clonal size in the population \command{c_Pareto} is computed 
as \command{slope+1} (Schroeder 1991).
}

\value{
A list of:
\item{Pareto}{Pareto's Beta,}
\item{c_Pareto}{distribution of clonal size in the population,}
\item{coefficients and regression_results}{summary of the linear regression,}
\item{coords_Pareto}{x and y coordinates of the inverse cumulated frequencies.}

For several populations, a list of lists per population.
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{clonal_index}}
}

\examples{
data(posidonia)

Pareto_index(posidonia, graph = TRUE, legends = 2)

res <- Pareto_index(posidonia, full = TRUE)[[4]]

xi <- res[,1]
yi <- res[,2]
exp(summary(lm(log10(yi)~log10(xi)))$coefficients[1]) ##true b of y=ax+b
}

\keyword{documentation}
