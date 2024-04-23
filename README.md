
<!-- README.md is generated from README.Rmd. Please edit that file -->

NDim4jecs
=========

<!-- badges: start -->
<!-- badges: end -->

R package implementation of GSimp
---------------------------------

NDim4jecs is the implementation of GSimp into an R package for the
internal use.

All content of GSimp is licensed under the [Creative Commons
Attribution-NonCommercial-ShareAlike 4.0 International
License](https://creativecommons.org/licenses/by-nc-sa/4.0/).

You should cite this paper:

[![DOI:10.1371/journal.pcbi.1005973](https://zenodo.org/badge/DOI/10.1371/journal.pcbi.1005973.svg)](https://doi.org/10.1371/journal.pcbi.1005973)

Install required packages first
------------
    if (!requireNamespace("BiocManager", quietly = TRUE))
      install.packages("BiocManager")

    BiocManager::install("impute", force = T)
    BiocManager::install("pcaMethods", force = T)
    BiocManager::install("ropls", force = T)

    install.packages(c('doParallel',
                   'FNN',
                   'foreach',
                   'ggplot2',
                   'glmnet',
                   'imputeLCMD',
                   'knitr',
                   'magrittr',
                   'markdown',
                   'missForest',
                   'pheatmap',
                   'randomForest',
                   'reshape2',
                   'vegan'))

Installation
------------

You can install the development version of NDim4jecs
[GitHub](https://github.com/) with:

    # install.packages("devtools")
    devtools::install_github("fabregithub/NDim4jecs")

