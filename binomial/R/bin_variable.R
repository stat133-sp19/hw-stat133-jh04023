#' @title Binomial Variable Function
#' @description Shows the binomial random variables
#' @param trials number of trials
#' @param prob probability of success
#' @return a list with named elements: trials, prob
#' @export
#' @examples
#' # 10 trials with a probability 0.3
#' bin_variable(trials = 10, prob = 0.3)
#' $trials
#' [1] 10
#'
#' $prob
#' [1] 0.3
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  ans <- list(trials, prob)
  names(ans) <- c("trials", "prob")
  class(ans) <- "binvar"
  return(ans)
}


#' @export
print.binvar <- function(x) {
  print("Binomial variable")
  print('', quote = FALSE)
  print('Parameters', quote = FALSE)
  print(paste('- number of trials:', x$trials), quote = FALSE)
  print(paste('- prob of success :', x$prob), quote = FALSE)
}


#' @export
summary.binvar <- function(x) {
  mean <- aux_mean(x$trials, x$prob)
  var <- aux_variance(x$trials, x$prob)
  mode <- aux_mode(x$trials, x$prob)
  skew <- aux_skewness(x$trials, x$prob)
  kurt <- aux_kurtosis(x$trials, x$prob)
  vec <- c(x$trials, x$prob, mean, var, mode, skew, kurt)
  names(vec) <- c('trials', 'prob', 'mean', 'variance', 'mode', 'skewness', 'kurtosis')
  class(vec) <- "summary.binvar"
  return(vec)
}

#' @export
print.summary.binvar <- function(x) {
  print("Summary Binomial")
  print('', quote = FALSE)
  print('Parameters', quote = FALSE)
  print(paste('- number of trials:', x[1]), quote = FALSE)
  print(paste('- prob of success :', x[2]), quote = FALSE)
  print('', quote = FALSE)
  print('Measures', quote = FALSE)
  print(paste('- mean    :', x[3]), quote = FALSE)
  print(paste('- variance:', x[4]), quote = FALSE)
  print(paste('- mode    :', x[5]), quote = FALSE)
  print(paste('- skewness:', x[6]), quote = FALSE)
  print(paste('- kurtosis:', x[7]), quote = FALSE)
}


