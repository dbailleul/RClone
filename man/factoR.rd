\name{factoR}
\alias{factoR}
\docType{data}

\title{
factorial
}

\description{
Result of factorials from 1 to 1500 to increase speed calculation for \command{RClone}.
}

\usage{data("factoR")}
\format{
  A data frame with 2500 observations on the following 2 variables:
  \describe{
    \item{\code{V1}}{a numeric vector, the number of the factorial}
    \item{\code{V2}}{a numeric vector, the value of the factorial}
  }
}

\details{
This data comes from \command{RClone} package and is used in \command{psex} and 
\command{psex_Fis} functions.


Computed with \command{python} and provided by S. Stoeckel.
}

\examples{
data(factoR)
}

\keyword{datasets}
