## Expert Function: Poisson
#' Expert Function: Poisson.
#'
#' @param tl A vector of length N: lower bounds of truncation.
#' @param yl A vector of length N: lower bounds of censoring.
#' @param yu A vector of length N: upper bounds of censoring.
#' @param tu A vector of length N: upper bounds of truncation.
#' @param mean.theta A vector of length \code{1}: Poisson mean parameters.
#' @return A list of matrices of expert loglikelihood for Poisson.
#'
#' @seealso \code{\link[stats]{Poisson}}.
#'
#' @importFrom stats ppois dpois
#' @importFrom copula log1mexp
#'
#' @keywords internal
#'
#' @export ExpertPoisson
ExpertPoisson = function(tl, yl, yu, tu, mean.theta)
{
  # Initialization: return value are N * 1 matrices
  expert.ll = expert.tn = expert.tn.bar = array(-Inf, dim=c(length(yu),1))

  # Find indexes of unequal yl & yu: Not exact observations, but censored
  censor.idx = (yl!=yu)
  prob.log.yu = ppois(yu[censor.idx], mean.theta, lower.tail = TRUE, log.p = TRUE)
  prob.log.yl = ppois(ceiling(yl[censor.idx])-1, mean.theta, lower.tail = TRUE, log.p = TRUE)

  # Compute loglikelihood for expert j, first for y
  expert.ll[censor.idx,1] = prob.log.yu + log1mexp(prob.log.yu - prob.log.yl) # likelihood of censored interval: some easy algebra
  expert.ll[!censor.idx,1] = dpois(yu[!censor.idx], mean.theta, log = TRUE)  # exact likelihood

  # Compute loglikelihood for expert j, then for truncation limits t
  prob.log.tu = ppois(tu, mean.theta, lower.tail = TRUE, log.p = TRUE)
  prob.log.tl = ppois(ceiling(tl)-1, mean.theta, lower.tail = TRUE, log.p = TRUE)

  # Normalizing factor for truncation limits, in log
  expert.tn[,1]= prob.log.tu + log1mexp(prob.log.tu - prob.log.tl)

  ###################################################################
  # Deal with no truncation case
  no.trunc.idx = (tl==tu)
  expert.tn[no.trunc.idx,1] = dpois(tu[no.trunc.idx], mean.theta, log = TRUE)
  ###################################################################

  ###################################################################
  # Deal with exact zero case: The following code treating zeros is NOT applicable for frequency distributions!!!
  # zero.idx = (tu==0)
  # expert.ll[zero.idx,1]=(-Inf)
  # expert.tn[zero.idx,1]=(-Inf)
  ###################################################################

  # Log of Pr(outside of truncation interval)
  expert.tn.bar[!no.trunc.idx,1] = log1mexp(-expert.tn[!no.trunc.idx,1])
  expert.tn.bar[no.trunc.idx,1] = log1mexp(-expert.tn[no.trunc.idx,1])

  # Return values
  list(expert.ll = expert.ll, expert.tn = expert.tn, expert.tn.bar = expert.tn.bar)
}

