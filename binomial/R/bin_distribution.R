#' @title Binary Distribution Function
#' @description Calculate binary distribution using bin_probability()
#' @param trials number of trials
#' @param prob probability of success
#' @return data frame with the probability distribution: success in the first column, probability in the second column
#' @export
#' @examples
#' # binomial probability distribution with trials = 5, prob = 0.5
#' bin_distribution(trials = 5, prob = 0.5)
#'  success probability
#' 1      0     0.03125
#' 2      1     0.15625
#' 3      2     0.31250
#' 4      3     0.31250
#' 5      4     0.15625
#' 6      5     0.03125
bin_distribution <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  df <- data.frame(success, probability)
  class(df) <- c("bindis", "data.frame")
  return(df)
}


#' @export
plot.bindis <- function(x) {
  barplot(x$probability, names.arg = x$success,
          xlab = 'successes', ylab = 'probability')
}

