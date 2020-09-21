#' Imputation wrappers
#'
#' Collection of imputation wrappers
#'

#' Random forest wrapper
#'
#' @param data data
#' @param ... additional options
#'
#' @export
#'
RF_wrapper <- function(data, ...) {
  result <- missForest(data, ...)[[1]]
  return (result)
}

#' kNN wrapper
#'
#' @param data data
#' @param ... additional options
#'
#' @export
#'
kNN_wrapper <- function(data, ...) {
  result <- data %>% data.matrix %>% impute.knn(., ...) %>% extract2(1)
  return(result)
}

#' SVD wrapper
#'
#' @param data data
#' @param K number of k
#'
#' @export
#'
SVD_wrapper <- function(data, K = 5) {
  data_sc_res <- scale_recover(data, method = 'scale')
  data_sc <- data_sc_res[[1]]
  data_sc_param <- data_sc_res[[2]]
  result <- data_sc %>% impute.wrapper.SVD(., K = K) %>%
    scale_recover(., method = 'recover', param_df = data_sc_param) %>% extract2(1)
  return(result)
}

#' Mean wrapper
#'
#' @param data data
#'
#' @export
#'
Mean_wrapper <- function(data) {
  result <- data
  result[] <- lapply(result, function(x) {
    x[is.na(x)] <- mean(x, na.rm = T)
    x
  })
  return(result)
}

#' Median wrapper
#'
#' @param data data
#'
#' @export
#'
Median_wrapper <- function(data) {
  result <- data
  result[] <- lapply(result, function(x) {
    x[is.na(x)] <- median(x, na.rm = T)
    x
  })
  return(result)
}

#' HM wrapper
#'
#' @param data data
#'
#' @export
#'
HM_wrapper <- function(data) {
  result <- data
  result[] <- lapply(result, function(x) {
    x[is.na(x)] <- min(x, na.rm = T)/2
    x
  })
  return(result)
}

#' Zero wrapper
#'
#' @param data data
#'
#' @export
#'
Zero_wrapper <- function(data) {
  result <- data
  result[is.na(result)] <- 0
  return(result)
}

#' QRILC wrapper
#'
#' @param data data
#' @param ... additional options
#'
#' @export
#'
QRILC_wrapper <- function(data, ...) {
  result <- data %>% log %>% impute.QRILC(., ...) %>% extract2(1) %>% exp()
  return(result)
}

#' pre_processing_GS_wrapper
#'
#' @param data data
#'
#' @export
#'
pre_processing_GS_wrapper <- function(data) {
  data_raw <- data
  ## log transformation ##
  data_raw_log <- data_raw %>% log()
  ## Initialization ##
  data_raw_log_qrilc <- impute.QRILC(data_raw_log) %>% extract2(1)
  ## Centralization and scaling ##
  data_raw_log_qrilc_sc <- scale_recover(data_raw_log_qrilc, method = 'scale')
  ## Data after centralization and scaling ##
  data_raw_log_qrilc_sc_df <- data_raw_log_qrilc_sc[[1]]
  ## Parameters for centralization and scaling ##
  ## For scaling recovery ##
  data_raw_log_qrilc_sc_df_param <- data_raw_log_qrilc_sc[[2]]
  ## NA position ##
  NA_pos <- which(is.na(data_raw), arr.ind = T)
  ## bala bala bala ##
  data_raw_log_sc <- data_raw_log_qrilc_sc_df
  data_raw_log_sc[NA_pos] <- NA
  ## GSimp imputation with initialized data and missing data ##
  result <- data_raw_log_sc %>% GS_impute(., iters_each=50, iters_all=10,
                                          initial = data_raw_log_qrilc_sc_df,
                                          lo=-Inf, hi= 'min', n_cores=2,
                                          imp_model='glmnet_pred')
  data_imp_log_sc <- result$data_imp
  ## Data recovery ##
  data_imp <- data_imp_log_sc %>%
    scale_recover(., method = 'recover',
                  param_df = data_raw_log_qrilc_sc_df_param) %>%
    extract2(1) %>% exp()
  return(data_imp)
}

#' sim QRILC wrapper
#'
#' @param data data
#' @param ... additional options
#'
#' @export
#'
sim_QRILC_wrapper <- function(data, ...) {
  result <- data %>% impute.QRILC(., ...) %>% extract2(1)
  return(result)
}

#' sim GS wrapper
#'
#' @param data data
#'
#' @export
#'
sim_GS_wrapper <- function(data) {
  result <- data %>% GS_impute(., iters_each = 50, iters_all = 10, initial = 'qrilc',
                               lo = -Inf, hi = 'min', n_cores = 2, imp_model = 'glmnet_pred')
  return(result$data_imp)
}

#' sim trKNN wrapper
#'
#' @param data data
#'
#' @export
#'
sim_trKNN_wrapper <- function(data) {
  result <- data %>% as.matrix %>% t %>% imputeKNN(., k = 3,
                                                   distance = 'truncation',
                                                   perc = 0) %>% t
  return(result)
}

#' sim HM wrapper
#'
#' @param data data
#'
#' @export
#'
sim_HM_wrapper <- function(data) {
  result <- data
  result[] <- lapply(result, function(x) {
    x[is.na(x)] <- min(x, na.rm = T)/2
    x
  })
  return(result)
}

