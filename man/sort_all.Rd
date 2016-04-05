\name{sort_all}
\alias{sort_all}

\title{
Sorting alleles
}

\description{
\command{sort_all} sorts alleles of diploid data by increasing order. 
}

\usage{
sort_all(data1)
}

\arguments{
  \item{data1}{
a \command{Rclone} table with one allele per column.
}
}

\details{
To use properly \command{RClone} functions on diploid data, you \bold{MUST} 
be sure that your alleles are sorted by increasing order. \cr
Run this function before any analysis.
}

\value{
a table of exact format of \command{data1}, but with alleles sorted.
}

\references{
Arnaud-Haond et al., 2007, Standardizing methods to address clonality in population studies.
}

\author{
The R implementation of \command{RClone} was written by Diane Bailleul working for Sophie Arnaud-Haond at IFREMER.


The design was inspired by GenClone program described in Arnaud-Haond & Belkhir (2007).


Maintainer: Diane Bailleul <diane.bailleul.pro@gmail.com>


Author: Sophie Arnaud-Haond <sophie.arnaud@ifremer.fr>
}

\seealso{
\code{\link{convert_GC}} for tables with one locus per column.
}

\examples{
data(posidonia)

posidonia == sort_all(posidonia)
}

\keyword{documentation}
