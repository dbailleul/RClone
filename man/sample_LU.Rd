\name{sample_LU}
\alias{sample_loci}
\alias{sample_units}
\alias{sample_loci_core}
\alias{sample_units_core}
\alias{sample_LU}

\title{
Sample Loci or Units
}

\description{
Monte Carlo procedure to ensure that the sets of loci (\command{sample_units}) or 
units (\command{sample_loci}) provide enough power to discriminate MLG 
(MultiLocus Genotypes).
}

\usage{
sample_loci(data1, haploid = FALSE, vecpop = NULL, nbrepeat = 1000, He = FALSE, 
			graph = FALSE, export = FALSE, bar = FALSE)
sample_units(data1, haploid = FALSE, vecpop = NULL, nbrepeat = 1000, He = FALSE, 
			graph = FALSE, export = FALSE, bar = FALSE)
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
  \item{nbrepeat}{
numeric, the number of sampling.
}
  \item{He}{
option, if \command{TRUE}, computes \command{Hexp} (expected Heterozygosity, Nei 1978).
}
  \item{graph}{
option, if \command{TRUE}, displays a boxplot of average MLG number using X loci.
}
  \item{export}{
option, if \command{TRUE}, graph is saved as pdf into working directory.
}
  \item{bar}{
option, if \command{TRUE}, displays a progression bar.
}
}

\value{
a list of:
\item{res_MLG}{with min, max, mean and SE (Standard Error) of MLG,}
\item{res_alleles}{with min, max, mean and Satterthwaite approximation of SE of the 
number of alleles and of \command{Hexp} if option \command{He = TRUE},}
\item{raw_He}{a table with number of loci/units sampled in column and each 
re-sampling in row for He,}
\item{raw_MLG}{a table with number of loci/units sampled in column and each 
re-sampling in row for MLG number,}
\item{raw_all}{a table with number of loci/units sampled in column and each 
re-sampling in row for alleles number.}

If \command{data1} is a multi-population table, a list of lists for each population.
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in population studies.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\examples{
data(posidonia)

sample_loci(posidonia, nbrepeat = 10, graph = TRUE)[[2]]
sample_units(posidonia, nbrepeat = 10, graph = TRUE, bar = TRUE, He = TRUE)[[1]]

#Graph :
res <- sample_loci(posidonia, nbrepeat = 100)
boxplot(res$raw_MLG, range = 3, ylab = "Number of multilocus genotypes", 
xlab = "Number of loci sampled")
title(paste("Genotype accumulation curve for", "posidonia"))
}

\keyword{documentation}
