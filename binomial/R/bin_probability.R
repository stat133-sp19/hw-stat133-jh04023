#' @title Binary Probability Function
#' @description Calculate a value using the formula of the binary probability
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of success
#' @return one or more computed probabilities
#' @export
#' @examples
#' # probability of getting 2 succeses in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' 0.3125
#'
#' # probabilities of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' 0.03125 0.15625 0.31250
#'
#' # 55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)
#' 0.01075277
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  ans <- bin_choose(trials, success) * prob^success * (1-prob)^(trials-success)
  return(ans)
}


