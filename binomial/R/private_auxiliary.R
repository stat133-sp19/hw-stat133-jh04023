# private auxiliary function which returns mean value
aux_mean <- function(trials, prob) {
  return(trials * prob)
}

# private auxiliary function which returns variance
aux_variance <- function(trials, prob) {
  return(trials * prob * (1-prob))
}

# private auxiliary function which returns mode
aux_mode <- function(trials, prob) {
  m <- trials * prob + prob
  if (m %% 1 == 0) {
    return(c(m, m - 1))
  } else {
    return(as.integer(m))
  }
}

# private auxiliary function which returns skewness
aux_skewness <- function(trials, prob) {
  ans <- (1 - 2*prob) / sqrt(trials * prob * (1-prob))
  return(ans)
}

# private auxiliary function which returns kurtosis
aux_kurtosis <- function(trials, prob) {
  ans <- (1 - 6 * prob * (1-prob)) / (trials * prob * (1-prob))
  return(ans)
}


