#' @title Binary Choose Function
#' @description Calculates the number of combinations in which k successes can occur in n tirals
#' @param n number of trials
#' @param k number of successes
#' @return computed value
#' @export
#' @examples
#' # five trials, two successes
#' bin_choose(n = 5, k = 2)
#' 10
#'
#' # five trials, 0 success
#' bin_choose(5, 0)
#' 1
#'
#' # five trials, 1-3 successes
#' bin_choose(5, 1:3)
#' 5 10 10
bin_choose <- function(n, k) {
  for (i in k) {
    if (i > n) {
      stop("k cannot be greater than n")
    }
  }
  ans <- factorial(n) / (factorial(k) * factorial(n-k))
  return(ans)
}


