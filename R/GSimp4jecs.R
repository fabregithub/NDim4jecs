#' GSimp4jecs
#'
#' This is a package for Gibbs sampling to impute left censored data. This is originally created by Wei et al. and made as a R package for the use in the Japan Environment and Children's Study.
#'
#' @docType package
#' @name GSimp4jecs
#'
#' @import MASS FNN glmnet grid rpart abind magrittr imputeLCMD doParallel foreach reshape2 ropls vegan
#'
#' @importFrom randomForest margin randomForest
#' @importFrom graphics par
#' @importFrom missForest nrmse missForest
#' @importFrom impute impute.knn
#' @importFrom methods getFunction
#' @importFrom parallel makeCluster stopCluster
#' @importFrom stats cor.test lm median na.omit pnorm prcomp qnorm quantile runif sd t.test cor integrate
#' @importFrom utils combn
#' @importFrom Matrix bdiag
#' @importFrom mvtnorm rmvnorm
#' @importFrom ggplot2 ggplot aes_string geom_point aes geom_line theme_bw scale_color_manual scale_shape_manual
#'
#'
"_PACKAGE"
