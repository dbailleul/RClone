\name{GenClone}
\alias{genclone}
\alias{GenClone}
\alias{genclone_core}
\alias{GenClone_core}
\alias{popsimgen}

\title{
Summary function of RClone package
}

\description{
\command{genclone} computes main genetic/genotypic diversity/richness indices.
}

\usage{
GenClone(data1, haploid = FALSE, coords = NULL, vecpop = NULL, listMLL = NULL, 
			nbrepeat = NULL, bar = FALSE)
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
  \item{nbrepeat}{
numeric, option, if \command{pvalue = TRUE}, \command{nbrepeat} is the number of 
resampling to enable pvalues computation.
}
  \item{listMLL}{
option, a custom list of MLL.
}
  \item{bar}{
option, if \command{TRUE}, displays a progression bar.
}
}

\details{
\command{GenClone} returns results of several functions of \command{RClone}:
a summary of \command{MLG_tab}, \command{Fis} on ramets and genets with pvalues
(resample the population \command{nbrepeat} times, with simulated sexual events),
\command{B_Pareto} from \command{Pareto_index}, \command{Sp} from 
\command{autocorrelation} and indexes from \command{clonal_index}.

If no coordinate at all are available, let \command{coords = NULL} as it or
create a table with always the same number (i.e. "999", "-1", etc.).
If coordinates are available for some populations only, for the population
with missing coordinates: replace all the coordinates by the same number, 
as "999".
\command{GenClone} cannot handle mix situation with missing coordinates
only for some units of the population.
}

\value{
\command{GenClone} returns a table with:
\itemize{
\item{N, the number of units in data1,}
\item{Lineage, MLG or MLL,}
\item{nb_L, the number of MLG/MLL,}
\item{nb_all, the mean number of alleles,}
\item{SE, the standard error of \command{nb_all},}
\item{Fis, on ramets if diploid data}
\item{pval_2sides, the two-sided p-value of \command{Fis} if \command{nbrepeat},}
\item{Fis_WR, on genets if diploid data}
\item{pval_2sides, the two-sided p-value of \command{Fis_WR} if \command{nbrepeat},}
\item{R, the clonal diversity index (Dorken & Eckert 2001; Ellstrand & Roose 1987),}
\item{Pareto_index, the index of Pareto}
\item{Sp_Loiselle, \command{Sp} index computed on ramets with Loiselle kinship results
used to quantify Spatial Genetic Structure (Vekemans and Hardy, 2004)}
\item{pval_2sides, the two-sided p-value of \command{Sp_Loiselle} if \command{nbrepeat},}
\item{Sp_Ritland, \command{Sp} index computed on ramets with Ritland kinship results
used to quantify SGS}
\item{pval_2sides, the two-sided p-value of \command{Sp_Ritland} if \command{nbrepeat},}
\item{Sp_L_WR, \command{Sp} index computed on genets with Loiselles kinship results
used to quantify SGS}
\item{pval_2sides, the two-sided p-value of \command{Sp_L_WR} if \command{nbrepeat},}
\item{Sp_R_WR, , \command{Sp} index computed on genets with Ritland kinship results
used to quantify SGS}
\item{pval_2sides, the two-sided p-value of \command{Sp_R_WR} if \command{nbrepeat},}
\item{H'', the Shannon-Wiener index estimator (Pielou 1966),}
\item{J', the Pielou evenness index(Pielou 1975),}
\item{D', the Simpson complement unbiased (Pielou 1969 ; Gini 1912 ; Peet 1974),}
\item{V, the Simpson complement index (Hurlbert 1971 ; Fager 1972),}
\item{Hill, the reciprocal of Simpson index unbiased (Hurlbert 1971 ; Hill 1973).}
}
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{clonal_index}}
}

\examples{
data(posidonia)
data(coord_posidonia)

#GenClone(posidonia) #without coordinates
#GenClone(posidonia, coords = coord_posidonia) #with coordinates
#GenClone(posidonia, coords = coord_posidonia, nbrepeat = 1000)
##time consuming
}

\keyword{documentation}
