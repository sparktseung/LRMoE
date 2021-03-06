% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SwitchExpertPenaltyInit.R
\name{DimCompExpertPenaltyInit}
\alias{DimCompExpertPenaltyInit}
\title{Initialize penalty of parameters for expert functions by dimension and by component.}
\usage{
DimCompExpertPenaltyInit(ind.dist)
}
\arguments{
\item{ind.dist}{A string which indicates the expert function.
\itemize{
    \item \code{gamma}: Gamma
    \item \code{lnorm}: Log Normal
    \item \code{invgauss}: Inverse Gaussian
    \item \code{weibull}: Weibull
    \item \code{burr}: Burr
    \item \code{poisson}: Poisson
    \item \code{ztpoisson}: Zero-Truncated Poisson
    \item \code{nbinom}: Negative Binomial
    \item \code{binom}: Binomial
    \item \code{gammacount}: Gamma Count
    \item \code{ZI-root}: Zero-inflated versions of the distributions above, e.g. \code{ZI-gamma}.
}}
}
\value{
A list of hyper parameters by dimension and by component.
}
\description{
Initialize penalty of parameters for expert functions by dimension and by component.
}
\seealso{
\code{\link{DimCompExpertLL}}.
}
\keyword{internal}
