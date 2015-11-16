\name{MLL_generator}
\alias{MLL_generator}
\alias{MLL_generator2}
\alias{MLL_generator_core}
\alias{MLL_generator2_core}

\title{
Clonal Lineage Generation
}

\description{
Defining MLL (MultiLocus Lineage): ascertaining that each distinct MLG 
(MultiLocus Genotype) belongs to a distinct genet (Halkett et al., 2005a).
}

\usage{
MLL_generator(data1, haploid = FALSE, vecpop = NULL, manh = FALSE, manh_w = FALSE, 
		alpha1 = NULL, alpha2 = NULL)
MLL_generator2(potential_clones = NULL, res_mlg = NULL, vecpop = NULL)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
  \item{manh}{
option, if \command{TRUE}, computes genetic distances among MLG in terms of 
divergence of microsatellites motifs (Rozenfeld et al., 2007).
}
  \item{manh_w}{
option, if \command{TRUE}, computes genetic distances among MLG in terms of
 weighted divergence of microsatellites motifs (Rozenfeld et al., 2007).
}
  \item{alpha1}{
numeric, option, if \command{alpha1} is not NULL, a vertical significativity 
line is added on graph at \command{alpha1}% of the distribution.
}
  \item{alpha2}{
numeric, option, if \command{alpha2} is not NULL, a vertical significativity 
line is added on graph at \command{alpha2}.
}
  \item{potential_clones}{
table, a result table from \command{genet_dist} named \command{potential_clones}.
}
  \item{res_mlg}{
list, a list of MLG, result from \command{MLG_list}.
}
}

\details{
\command{MLL_generator} creates automatically MLL from a given genetic distance
(\command{alpha2}) or a percentage of the distribution of genetic distance
(\command{alpha1}).


If several populations (\command{vecpop != NULL}), \command{MLL_generator} is the only
function in the package \command{RClone} to accept different arguments for
an option. \command{alpha1} and \command{alpha2} thus are vectors of several 
numeric values, one per populations.


If \command{manh = TRUE} or \command{manh_w = TRUE}, divergence of SSR motifs 
(Rozenfeld et al., 2007) is used as genetic distance.


\command{MLL_generator2} computes a list of MLL from previous results of \command{genet_dist}
 and \command{MLG_list}.
 
\command{MLL_generator} and \command{MLL_generator2} compute a list of MLL 
to use with others \command{RClone} functions.
}

\value{
\command{MLL_generator} and \command{MLL_generator2} return a list of MLL
 (one population) or a list of lists (several populations).
}


\references{
Chakraborty & Jin, 1993, Determination of relatedness between individuals using 
DNA-fingerprinting.


Arnaud-Haond et al., 2007, Standardizing methods to address clonality in 
population studies.


Rozenfeld et al., 2007, Spectrum of genetic diversity and networks of clonal 
populations.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}


\keyword{documentation}
