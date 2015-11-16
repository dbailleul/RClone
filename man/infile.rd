\name{infile}
\alias{infile}
\docType{data}

\title{
Infile GenClone style file
}
\description{
A GenClone file of 40 units of \emph{Posidonia oceanica} (genotypes of seven 
loci and x/y coordinates) sampled in Mediterranean sea.
}

\usage{data("infile")}
\format{
  A data frame with 41 observations on the following 12 variables (not relevant).
  \describe{
    \item{\code{V1}}{a numeric vector}
    \item{\code{V2}}{a numeric vector}
    \item{\code{V3}}{a numeric vector}
    \item{\code{V4}}{a numeric vector}
    \item{\code{V5}}{a numeric vector}
    \item{\code{V6}}{a factor with levels \code{208208} \code{208210} \code{208216} 
    \code{210212} \code{210216} \code{210218} \code{212216} \code{216218} \code{222226} \code{Po15}}
    \item{\code{V7}}{a factor with levels \code{234234} \code{234236} \code{234242} 
    \code{Po5}}
    \item{\code{V8}}{a factor with levels \code{159159} \code{159163} \code{159165} 
    \code{163163} \code{163165} \code{165165} \code{Po5-49}}
    \item{\code{V9}}{a factor with levels \code{168168} \code{168170} \code{168172} 
    \code{170170} \code{170172} \code{172172} \code{Po5-40}}
    \item{\code{V10}}{a factor with levels \code{178178} \code{178180} \code{180180} 
    \code{Po5-10}}
    \item{\code{V11}}{a factor with levels \code{} \code{Po4-3}}
    \item{\code{V12}}{a factor with levels \code{} \code{Po5-39}}
  }
}

\details{
This data is given as illustration of GenClone file formatted to work with 
\command{RClone} (the R package version of GenClone).
}

\source{
Arnaud-Haond S, Alberto F, Eguiluz VM, Hernandez-Garcia E, Duarte CM, Serrao EA 
(2014) Disentangling the influence of mutation and migration in clonal 
seagrasses using the Genetic Distance Spectrum for microsatellites. 

Dryad Digital Repository: \url{http://dx.doi.org/10.5061/dryad.3b8k6}
}

\references{
Arnaud-Haond S, Maolic Y, Hernandez-Garcia E, Eguiluz VM, Alberto F, Serrao EA, 
Duarte CM (2014) Disentangling the influence of mutation and migration in clonal
 seagrasses using the Genetic Distance Spectrum for microsatellites. Journal of 
 Heredity 105(4): 532-541. \url{http://dx.doi.org/10.1093/jhered/esu015}
 
 
Arnaud-Haond S & Belkhir K, 2007, GENCLONE: a computer program to analyse genotypic 
data, test for clonality and describe spatial clonal organization.
}

\examples{
data(infile)
#This is nearly a GenClone file, type:
#write.table(infile, "infile2.csv", col.names = FALSE, row.names = FALSE, sep = ";")
#Now you have a formatted GenClone file.
}

\keyword{datasets}
