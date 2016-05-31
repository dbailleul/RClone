\name{export_genclone}
\alias{export_genclone_genind}
\alias{export_genclone_genetix}
\alias{export_genclone_arlequin}

\title{
export data file to Adegenet, Genetix and Arlequin
}

\description{
These functions allow to transform a \command{RClone} table into files to work 
with \command{Adegenet} (R package), Genetix and Arlequin softwares.
}

\usage{
export_genclone_genind(data1, ele)
export_genclone_genetix(data1, haploid = FALSE, ele, name)
export_genclone_arlequin(data1, haploid = FALSE, name)
}

\arguments{
  \item{data1}{
a \command{RClone} table with only one population.
}
  \item{haploid}{
logical, option, if \command{haploid = FALSE}, \command{data1} contains diploid data;
 if \command{haploid} = TRUE, haploid data.
}
  \item{ele}{
option, separator element for export.
}
  \item{name}{
option, name of the exported file.
}
}

\value{
a \command{genind} object or a file for Genetix or Arlequin.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\note{
For multi-population files, we recommend to use split function to cut the table into 
several tables, one for each population, and then combine \command{lapply} with the export functions.
}

\examples{

data(posidonia)

#RClone to Adegenet:
res <- export_genclone_genind(posidonia, "/")
#library(adegenet)
#res2 <- df2genind(res, ploidy = 2, sep = "/")
#nAll(res2)

#RClone to Genetix:
export_genclone_genetix(posidonia, name = "test.txt")
#or
write.table(export_genclone_genetix(posidonia), "test2.txt", row.names = FALSE, 
sep = "\t", quote = FALSE)
#for genets only:
export_genclone_genetix(unique(posidonia), name = "test.txt")

#Rclone to Arlequin:
write.table(export_genclone_arlequin(posidonia), "file1.arp", row.names = FALSE,
 col.names = FALSE, quote = FALSE)
#or
export_genclone_arlequin(posidonia, haploid = FALSE, "file2.arp")
#for genets only:
export_genclone_arlequin(unique(posidonia), haploid = FALSE, "file2.arp")

#if several populations:
#res <- split(data, vecpop)
#lapply(res, function(x) export_genclone_genetix(x))
#lapply(res, function(x) export_genclone_arlequin(x))
}

\keyword{documentation}
