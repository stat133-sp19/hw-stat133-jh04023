#' @title Binary Cumulative Function
#' @description Calculate the binomial cumulative distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return data frame with both the probability distribution and the cumulative probabilities
#' @export
#' @examples
#' # binolmial cumulative distribution of 5 trials and probability of 0.5
#' bin_cumulative(trials = 5, prob = 0.5)
#'  success probability cumulative
#' 1      0     0.03125    0.03125
#' 2      1     0.15625    0.18750
#' 3      2     0.31250    0.50000
#' 4      3     0.31250    0.81250
#' 5      4     0.15625    0.96875
#' 6      5     0.03125    1.00000
bin_cumulative <- function(trials, prob) {
  success <- 0:trials
  probability <- bin_probability(success, trials, prob)
  cumulative <- c()
  add <- 0
  for (i in 1:length(probability)) {
    add <- add + probability[i]
    cumulative <- append(cumulative, add)
  }
  df <- data.frame(success, probability, cumulative)
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export
plot.bincum <- function(x) {
  plot(x$success, x$cumulative, xlab = 'successes', ylab = 'probability')
  lines(x$success, x$cumulative)
}
