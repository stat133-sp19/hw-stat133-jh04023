#' @title Binomial Mean Function
#' @description Calculate binomial mean
#' @param trials number of trials
#' @param prob probability of success
#' @return computed value
#' @export
#' @examples
#' # 10 trials, probability of 0.3
#' bin_mean(10, 0.3)
#' 3
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  return(aux_mean(trials, prob))
}

#' @title Binomial Variance Function
#' @description Calculate binomial variance
#' @param trials number of trials
#' @param prob probability of success
#' @return computed value
#' @export
#' @examples
#' # 10 trials, probability of 0.3
#' bin_variance(10, 0.3)
#' 2.1
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  return(aux_variance(trials, prob))
}

#' @title Binomial Mode Function
#' @description Calculate binomial mode
#' @param trials number of trials
#' @param prob probability of success
#' @return computed value
#' @export
#' @examples
#' # 10 trials, probability of 0.3
#' bin_mode(10, 0.3)
#' 3
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  return(aux_mode(trials, prob))
}

#' @title Binomial Skewness Function
#' @description Calculate binomial skewness
#' @param trials number of trials
#' @param prob probability of success
#' @return computed value
#' @export
#' @examples
#' # 10 trials, probability of 0.3
#' bin_skewness(10, 0.3)
#' 0.2760262
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  return(aux_skewness(trials, prob))
}

#' @title Binomial Kurtosis Function
#' @description Calculate binomial kurtosis
#' @param trials number of trials
#' @param prob probability of success
#' @return computed value
#' @export
#' @examples
#' # 10 trials, probability of 0.3
#' bin_kurtosis(10, 0.3)
#' -0.1238095
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)

  return(aux_kurtosis(trials, prob))
}




