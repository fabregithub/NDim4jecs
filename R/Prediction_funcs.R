#' Prediction functions
#'
#' Collection of prediction functions for different models
#'
#'

#' lm prediction
#'
#' @param x x
#' @param y y
#'
#' @export
#'
lm_pred <- function(x, y) {
  data <- data.frame(y=y, x)
  model <- lm(y ~ ., data=data)
  y_hat <- predict(model, newdata=data)
  return(y_hat)
}

#' rlm prediction
#'
#' @param x x
#' @param y y
#'
#' @export
#'
rlm_pred <- function(x, y) {
  data <- data.frame(y=y, x)
  model <- rlm(y ~ ., data=data)
  y_hat <- predict(model, newdata=data)
  return(y_hat)
}

#' random forest prediction
#'
#' @param x x
#' @param y y
#' @param ntree number of trees
#' @param ... additional options
#'
#' @export
#'
rf_pred <- function(x, y, ntree=200, ...) {
  model <- randomForest(x=x, y=y, ntree=ntree, ...)
  y_hat <- predict(model, newdata=x)
  return(y_hat)
}

#' glmnet prediction
#'
#' @param x x
#' @param y y
#' @param alpha alpha
#' @param lambda lambda
#'
#' @export
#'
glmnet_pred <- function(x, y, alpha=.5, lambda=.01) {
  x_mat <- as.matrix(x)
  model <- glmnet(x=x_mat, y=y, alpha=alpha, lambda=lambda)
  y_hat <- predict(model, newx=x_mat)[, 1]
  return(y_hat)
}

#' rpart prediction
#'
#' @param x x
#' @param y y
#'
#' @export
#'
rpart_pred <- function(x, y) {
  data <- data.frame(y=y, x)
  model <- rpart(y ~ ., data=data)
  y_hat <- predict(model, newdata=data)
  return(y_hat)
}

#' kNN prediction
#'
#' @param x x
#' @param y y
#'
#' @export
#'
knn_pred <- function(x, y) {
  model <- knn.reg(train=x, y=y, k=5)
  y_hat <- model$pred
  return(y_hat)
}
