% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GSimp.R
\name{multi_impute}
\alias{multi_impute}
\title{Multiple missing variables imputation}
\usage{
multi_impute(
  data_miss,
  iters_each = 100,
  iters_all = 20,
  initial = "qrilc",
  lo = -Inf,
  hi = "min",
  n_cores = 1,
  imp_model = "glmnet_pred",
  gibbs = data.frame(row = integer(), col = integer())
)
}
\arguments{
\item{data_miss}{dataset}

\item{iters_each}{number of iterations}

\item{iters_all}{vector}

\item{initial}{imitialised data matrix}

\item{lo}{lower end}

\item{hi}{upper end}

\item{n_cores}{number of cores}

\item{imp_model}{imputation model}

\item{gibbs}{gibbs sampler}

\item{col}{column number}
}
\description{
Multiple missing variables imputation
}
