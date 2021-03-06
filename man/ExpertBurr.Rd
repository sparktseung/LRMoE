% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExpertBurr.R
\name{ExpertBurr}
\alias{ExpertBurr}
\title{Expert Function: Burr.}
\usage{
ExpertBurr(tl, yl, yu, tu, shape1.k, shape2.c, scale.lambda)
}
\arguments{
\item{tl}{A vector of length N: lower bounds of truncation.}

\item{yl}{A vector of length N: lower bounds of censoring.}

\item{yu}{A vector of length N: upper bounds of censoring.}

\item{tu}{A vector of length N: upper bounds of truncation.}

\item{shape1.k}{A vector of length \code{1}: Burr shape1 parameters.}

\item{shape2.c}{A vector of length \code{1}: Burr shape2 parameters.}

\item{scale.lambda}{A vector of length \code{1}: Burr scale parameters.}
}
\value{
A list of matrices of expert loglikelihood for Burr.
}
\description{
Expert Function: Burr.
}
\seealso{
\code{\link[actuar]{Burr}}.
}
\keyword{internal}
