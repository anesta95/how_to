# Function
avg_ann_growth <- function(later_val, earlier_val, 
                           periodcity = 12,
                           periods) {
  # Things this function needs to do:
  # 1. Check if `later_val`, `earlier_val`, and `periods` are numeric, if not, throw an error.
  # 2. Check if `periodcity` is one of these values: annual, monthly, or quarterly
  # 3. Calculate the average annual growth between the two values: https://www.bea.gov/help/faq/463
  # 3. Return new average annual growth value.
  
  # TODO: Change this data type checker to something more elegant
  if (!is.numeric(later_val) | !is.numeric(earlier_val) | !is.numeric(periods) | !is.numeric(periodcity)) {
    stop("The supplied object to the `later_val`, `earlier_val`, `periodcity`, or `periods` argument object is not a numeric vector of at least two items",
         call. = T)
  }
  
  if (!(periodcity %in% c(1, 4, 12))) {
    stop("The supplied object `periodcity` is not one of 1 for annual, 4 for quarterly or 12 for monthly data.")
  }
  
  
  
  avg_ann_growth <- (((later_val / earlier_val) ^ (periodcity / periods)) - 1) * 100
  
  return(avg_ann_growth)
}