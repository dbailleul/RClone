\name{list_all}
\alias{list_all_tab}
\alias{list_all_tab2}
\alias{list_all_obj}
\alias{list_all_tab_core}
\alias{list_all_tab2_core}
\alias{list_all_obj_core}
\alias{list_all}
\alias{corresp_loci}

\title{
Listing unique alleles
}

\description{
\command{list_all_tab} returns a table with loci in column and unique alleles in row.
}

\usage{
list_all_tab(data1, haploid = FALSE, vecpop = NULL)
}

\arguments{
  \item{data1}{
a \command{Rclone} table, with one allele per column.
}
  \item{haploid}{
logical, option, \command{haploid} indicates the ploidy level of \command{data1}.
}
  \item{vecpop}{
vector, option, \command{vecpop} indicates the population name of each unit
of \command{data1}, if \command{data1} contains several populations.
If \command{data1} contains only one population, leave \command{vecpop = NULL}.
}
}

\value{
a table (one population) or a list of tables (several populations) with the 
unique alleles per locus.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sohie.arnaud@ifremer.fr>
}

\examples{
data(posidonia)

list_all_obj(posidonia, haploid = FALSE)
list_all_tab(posidonia, haploid = FALSE)
corresp_loci(posidonia, haploid = FALSE)
}

\keyword{documentation}
