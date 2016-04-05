\name{psex}
\alias{psex}
\alias{psex_core}
\alias{psex_Fis}
\alias{psex_Fis_core}

\title{
Probability of originating from distinct sexual events
}

\description{
\command{psex} and \command{psex_Fis} compute the probability that repeated 
genotypes originate from distinct sexual events (i.e. being different genets 
and not ramets of the same MLG), with or without taking account of H-W equilibrium departures.
}

\usage{
psex(data1, haploid = FALSE, vecpop = NULL, genet = FALSE, RR = FALSE, 
		MLGsim = FALSE,  nbrepeat = NULL, bar = FALSE)
psex_Fis(data1, vecpop = NULL, genet = FALSE, RR = FALSE, MLGsim = FALSE, 
		nbrepeat = NULL, bar = FALSE)
}


\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
Not edible for \command{psex_Fis}.
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
  \item{MLGsim}{
option, the method of psex calculation (see details).
}
  \item{nbrepeat}{
option, numeric, the population is simulated \command{nbrepeat} times, based on frequency values.
}
  \item{bar}{
option, if \command{TRUE}, a progression bar appears.
}
}

\details{
We strongly recommand to use \command{RR = TRUE} option to compute allelic 
frequencies for clonal data.  
Otherwise, we let the options to work with frequencies at genet level 
(\command{genet = TRUE}) or ramet level (\command{RR = FALSE} and 
\command{genet = FALSE}).


if \command{MLGsim = TRUE}, \command{psex} are computed as probability for two 
units to be derived from distinct sexual reproductive event to be \command{C(N,2)} 
(Stenberg et al. 2003).


If \command{MLGsim = FALSE}, \command{psex} are computed with more conservative 
\command{C(n,1)} (Parks & Werth 1993) with \command{n}, \emph{"number of separated 
fragments with identical genotype to some previously encountered ramet"}.


The pvalue method calculation is largely inspired from MLGsim (Stenberg et al., 2003) 
and MLGsim2.0 (Ivens et al., 2012), with authors agreements.\cr
For each repeat, a population is simulated with allelic frequencies. \cr
If clones occurred, a simulated \command{psex} is computed and kept in memory. \cr
At the end, a distribution of \command{sim psex} is constructed and p-value is 
computed as upper p-value (Monte Carlo).


\command{psex} and \command{psex_Fis} could be time consuming with a certain 
number of repeats.


Values must differ from MLGsim and MLGsim2.0 because of Round-Robin frequencies 
and \command{Fis} calculation (see \code{\link{freq_RR}} and \code{\link{Fis}}).
}

\value{
For one population: \cr
\itemize{
\item if \command{nbrepeat} is not provided, a table with psex values,
\item if \command{nbrepeat} is provided, a list of a table with \command{psex} values 
and p-values and a vector of \command{sim psex}.
}


If \command{data1} is a multi-population table (\command{vecpop != NULL}),
 a list of either tables/tables and vectors for each population.
}

\references{
Stenberg et al., 2003, MLGsim: a program for detecting clones using a 
simulation approach.


Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.


Ivens, A.B.F., van de Sanden, M. and Bakker, J. MLGsim 2.0: updated software for 
detecting clones from micro satellite data using a simulation approach. \cr
In: The Evolutionary Ecology of Mutualism. PhD Thesis, 2012, University of Groningen. 
Pg 107-111 \cr
\url{http://www.rug.nl/research/institute-evolutionary-life-sciences/tres/downloads}
 for MLGsim 2.0.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr>
}

\section{Warning}{If \command{sim_psex} are less than 100, a warning message pops, as 
clones are not necessarily generated each simulation.


If no repeated genotype is generated during simulations, a warning message pops as well.
}

\seealso{
\code{\link{Fis}}, \code{\link{freq_RR}}, \code{\link{pgen}} and \code{\link{pgen_Fis}}
}

\examples{
data(posidonia)

psex(posidonia, RR = TRUE)
psex(posidonia, RR = TRUE, MLGsim = TRUE)
#psex(posidonia, RR = TRUE, nbrepeat = 1000, bar = TRUE)
##time consuming
}

\keyword{documentation}
