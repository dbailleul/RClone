\name{transcript_GC}
\alias{transcript_GC}

\title{
Transcript GenClone files
}

\description{
\command{transcript_GC} allows conversion from GenClone files to \command{RClone}
 files.
}

\usage{
transcript_GC(obj, ele, num1, num2, num3)
}

\arguments{
  \item{obj}{
a \command{.csv} file from GenClone (\command{.txt} saved as \command{.csv}).
}
  \item{ele}{
option, separator element for import.
}
  \item{num1}{
numeric, the number of loci.
}
  \item{num2}{
numeric, the ploidy level. 2 for diploids and 1 for haploids.
}
  \item{num3}{
numeric, the length of each allele.
}
}

\details{
GenClone files are generally \command{.txt} files named \command{infile.txt}.
You must save it as \command{.csv} file with \command{";"} as separators and, if 
necessary, change \command{","} by \command{"."}.
}

\value{
\command{transcript_GC} returns a list of:
\item{data_genet}{a table of genotypes, one allele per column and one 
unit per row,}
\item{data_coord}{a table of x/y coordinates,}
\item{names_loci}{a vector of names of the loci,}
\item{names_units}{a vector of names of the units.}
}

\note{
\command{transcript_GC} works only with infile files full of informations
(loci names, ploidy names, etc.).
}

\references{
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
\code{\link{sort_all}} for sorting users tables with one allele per column.
}

\examples{
data(infile)
#This is nearly a GenClone file, type:
#write.table(infile, "infile.csv", col.names = FALSE, row.names = FALSE, sep = ";")
#Now you have a formatted GenClone file:
#res <- transcript_GC("infile.csv", ";", 2, 7, 3)
#data1 <- res$data_genet
#coord <- res$data_coord
}

\keyword{documentation}
