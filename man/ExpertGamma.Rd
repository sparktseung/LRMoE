% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExpertGamma.R
\name{ExpertGamma}
\alias{ExpertGamma}
\title{Expert Function: Gamma.}
\usage{
ExpertGamma(tl, yl, yu, tu, m, theta)
}
\arguments{
\item{tl}{A vector of length N: lower bounds of truncation.}

\item{yl}{A vector of length N: lower bounds of censoring.}

\item{yu}{A vector of length N: upper bounds of censoring.}

\item{tu}{A vector of length N: upper bounds of truncation.}

\item{m}{A vector of length \code{1}: Gamma shape parameters.}

\item{theta}{A vector of length \code{1}: Gamma scale parameters.}
}
\value{
A list of matrices of expert loglikelihood for Gamma.
}
\description{
Expert Function: Gamma.
}
\seealso{
\code{\link[stats]{GammaDist}}.
}
\keyword{internal}
