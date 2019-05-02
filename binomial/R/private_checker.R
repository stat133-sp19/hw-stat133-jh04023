# private function to test if an input prob is a valid probability value.
check_prob <- function(prob) {
  if ((prob >= 0) & (prob <= 1)) {
    return(TRUE)
  } else {
    stop('invalid prob value')
  }
}

# private function to test if an input trials is a valid value for number of trials.
check_trials <- function(trials) {
  if (trials >= 0 & trials %% 1 == 0) {
    return(TRUE)
  } else {
    stop('invalid trials value')
  }
}

# private function to test if an input success is a valid value for number of sccesses.
check_success <- function(success, trials) {
  for (s in success) {
    if ((s < 0) | (s > trials) | (s%%1 == 1)) {
      stop('invalid success value')
    }
  }
  return(TRUE)
}

