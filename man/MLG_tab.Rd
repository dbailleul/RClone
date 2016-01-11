\name{MLG_tab}
\alias{MLG_tab}
\alias{MLG_tab_core}
\alias{MLG_list}
\alias{MLG_list_core}

\title{
Table of MLG (MultiLocus Genotypes)
}

\description{
\command{MLG_tab} returns a table with one row per MLG and several columns 
if there's several units per MLG.
}

\usage{
MLG_tab(data1, vecpop = NULL)
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
}

\value{
a table (one population) or a list of tables (several populations)with one 
row per MLG and several columns if several units share the same MLG.
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

\examples{
data(posidonia)

res <- MLG_tab(posidonia)
res
}

\keyword{documentation}
