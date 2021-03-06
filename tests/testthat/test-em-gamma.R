context("EMMGamma")
library(Rcpp)

# m = 10
# theta = 10
# Q.y.log = function(u, m, theta) # Change of variable: u = log(y) for numerical stability
# {
#   dens.u.log = dgamma(exp(u), shape = m, scale = theta, log = TRUE) + u
#   return( u *exp(dens.u.log))
# }
#
# yl = rgamma(10000, shape = m, scale = theta)
# yu = yl + rgamma(10000, shape = m, scale = theta)
#
# yl[1:1000] = 0
# yu[1001:2000] = Inf
# yl[2001:3000] = yu[2001:3000]
#
# temp1 = mapply(function(x, y) ifelse(x!=y,
#                                      integrate(Q.y.log, log(x), log(y),
#                                                m = m, theta = theta,
#                                                rel.tol=.Machine$double.eps^0.5)$value,
#                                      0),
#                yl, yu)
# temp2 = intGammaLogYObs(m, theta, log(yl), log(yu))
#
# temp3 = sapply(yl,
#                function(x) ifelse(x!=0,
#                                   integrate(Q.y.log, -Inf, log(x),
#                                             m = m, theta = theta,
#                                             rel.tol=.Machine$double.eps^0.5)$value,
#                                   0))+
#         sapply(yu,
#                function(x) ifelse(x!=Inf,
#                                   integrate(Q.y.log, log(x), Inf,
#                                             m = m, theta = theta,
#                                             rel.tol=.Machine$double.eps^0.5)$value,
#                                   0))
#
# temp4 = intGammaLogYLat(m, theta, log(yl), log(yu))
#
#
# test_that("EMMGamma", {
#   expect_equal(temp1, temp2)
#   expect_equal(temp3, temp4)
# })

# library(microbenchmark)
# bench = microbenchmark(
#
#   intGammaLogYObs(m, theta, log(yl), log(yu)),
#
#   mapply(function(x, y) ifelse(x!=y,
#                                integrate(Q.y.log, log(x), log(y),
#                                          m = m, theta = theta,
#                                          rel.tol=.Machine$double.eps^0.5)$value,
#                                0),
#          yl, yu)
# )
#
# library(ggplot2)
# autoplot(bench)
#
# bench = microbenchmark(
#
#   intGammaLogYLat(m, theta, log(yl), log(yu)),
#
#   sapply(yl,
#          function(x) ifelse(x!=0,
#                             integrate(Q.y.log, -Inf, log(x),
#                                       m = m, theta = theta,
#                                       rel.tol=.Machine$double.eps^0.5)$value,
#                             0))+
#     sapply(yu,
#            function(x) ifelse(x!=Inf,
#                               integrate(Q.y.log, log(x), Inf,
#                                         m = m, theta = theta,
#                                         rel.tol=.Machine$double.eps^0.5)$value,
#                               0))
# )
#
# autoplot(bench)

# Very good improvement!




# data("LRMoEDemoData")
# head(X)
#
# alpha = matrix(c(0.5, 0.25, -0.05, 0.3, -0.2,
#                  0, 0, 0, 0, 0),
#                nrow = 2, byrow = T)
#
# head(exp(GateLogit(X, alpha)))
# hist(exp(GateLogit(X, alpha))[,1])
#
# comp.dist = matrix(c("gamma", "ZI-gamma"),
#                    nrow = 1, byrow = T)
#
# zero.prob = matrix(c(0, 0.10),
#                    nrow = 1, byrow = T)
#
# params.list = list(list(c(5, 5), c(10, 8)))
#
# simy = SimYSet(X, alpha, comp.dist, zero.prob, params.list)
#
# hist(simy, breaks = 200, xlim = c(0, 100))
#
# YY = cbind(rep(0, nrow(X)), simy, simy, rep(Inf, nrow(X)))
#
# YY[c(1000:2000),2] = simy[c(1000:2000)] * 0.75
# YY[c(2001:3000),3] = simy[c(2001:3000)] * 1.50
#
# YY[c(3001:4000),1] = simy[c(3001:4000)] * 0.25
#
# YY[c(4001:5000),4] = simy[c(4001:5000)] * 2
#
# YY[c(5001:7000),1] = simy[c(5001:7000)] * 0.25
# YY[c(5001:7000),2] = simy[c(5001:7000)] * 0.75
# YY[c(5001:7000),3] = simy[c(5001:7000)] * 1.25
# YY[c(5001:7000),4] = simy[c(5001:7000)] * 2
#
#
# alpha.init = alpha = matrix(c(0, 0, 0, 0, 0,
#                               0, 0, 0, 0, 0),
#                             nrow = 2, byrow = T)
# comp.dist = comp.dist
# zero.init = matrix(c(0, 0.50),
#                    nrow = 1, byrow = T)
# params.init = list(list(c(4, 6), c(15, 7)))
#
# modelfit = LRMoEFit(YY, X, 2, comp.dist, alpha.init, zero.init, params.init)
