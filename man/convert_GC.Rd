\name{convert_GC}
\alias{convert_GC}
\title{
File conversion into RClone files
}

\description{
\command{convert_GC} helps files conversion into \command{RClone} format.


\command{RClone} functions work on tables with one allele per column.


\command{convert_GC} converts tables with one locus per column into tables with 
one allele per column, handling separation elements.


\command{convert_GC} also sorts alleles at a locus per increasing order. 
}

\usage{
convert_GC(data1, num, ele)
}

\arguments{
  \item{data1}{
a table, with units in row and one locus per column.
}
  \item{num}{
numeric, the length of each allele.
}
  \item{ele}{
option, the alleles separator in the original table. 
}
}

\value{
a table with one allele per column, alleles sorted by increasing order.
}

\author{
Creator/Author: Diane Bailleul <diane.bailleul.pro@gmail.com> \cr
Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr> \cr
Contributor: Solenn Stoeckel


The R implementation of \command{RClone} was written by Diane Bailleul.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).
}

\seealso{
\code{\link{sort_all}} for tables with one allele per column. \cr
\code{\link{transcript_GC}} uses \command{convert_GC} as internal function.
}

\examples{
test <- matrix("232/231", ncol = 2, nrow = 2)
convert_GC(test, 3, "/") 
#"232" is a allele of length 3 and "/" is the separator.

test2 <- matrix("192235", ncol = 2, nrow = 2)
convert_GC(test2, 3) 
#no separator

#with data1, a genind object from adegenet:
#test <- genind2df(data1)
#convert_GC(test, 3, "/")
}

\keyword{documentation}
