% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EMEzzeroobs.R
\name{EMEzzeroobs}
\alias{EMEzzeroobs}
\title{ECM: E-Step for \code{z.zero.e.obs}.}
\usage{
EMEzzeroobs(
  yl.k,
  comp.kj.zero.inflation,
  comp.kj.zero.prob.old,
  comp.kj.pos.expert.ll
)
}
\arguments{
\item{yl.k}{A vector of length N: lower bounds of censoring.}

\item{comp.kj.zero.inflation}{TRUE/FALSE. See returned value \code{zero.inflation} in \code{\link{DimCompExpertLL}}.}

\item{comp.kj.zero.prob.old}{A numeric between 0 and 1. See returned value \code{zero.prob} in \code{\link{DimCompExpertLL}}.}

\item{comp.kj.pos.expert.ll}{See returned value \code{pos.expert.ll} in \code{\link{DimCompExpertLL}}}
}
\value{
\code{z.zero.e.obs} Numerical vectors of length N.
}
\description{
ECM: E-Step for \code{z.zero.e.obs}.
}
\keyword{internal}
