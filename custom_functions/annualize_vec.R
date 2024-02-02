# Function
annualize_vec <- function(vec) {
  # Things this function needs to do:
  # 1. Check if `vec` is a numeric vector, if not, throw an error.
  # 2. Annualize vector of numeric values. **ASSUMPTION** that vector is 
  # already storted in descending date order.
  # 3. Return new annualized vector.
  
  if (!is.vector(vec) | length(vec) < 2 | !is.numeric(vec)) {
    stop("The supplied object to the `vec` argument object is not a numeric vector of at least two items",
         call. = T)
  }
  
  ann_vec <- (((vec / c(vec[2:length(vec)], NA))^12) - 1) * 100
  
  return(ann_vec)
}

# Examples:
# 1. Create one new annualized column
df <- tibble::tibble(
  date = sort(seq.Date(from = base::as.Date("2022-12-01"), 
                  to = base::as.Date("2023-07-01"),
                  by = "month"), decreasing = T),
  x = rnorm(8, mean = 10000, sd = 100),
  y = rnorm(8, mean = 10000, sd = 300)
)

dplyr::mutate(df, ann_x = annualize_vec(x))

# 2. Modify two index columns
dplyr::mutate(df, dplyr::across(dplyr::where(is.numeric), ~annualize_vec(.x)))

# 3. Create two new index columns
dplyr::mutate(df, dplyr::across(dplyr::where(is.numeric), ~annualize_vec(.x), .names = "ann_{.col}"))

annualize_vals <- function(dec_val, 
                           later_val, 
                           time_period = "monthly",
                           period_number) {
  # Things this function needs to do:
  # 1. Check if both `dec_val` and `later_val` are numeric
  # 2. Calculate annualized change in the numeric values based on time period. 
  # 3. Return new annualized value.
  
  if(!is.numeric(dec_val) | !is.numeric(later_val)) {
    stop("The supplied object to the `dec_val` and `later_val` arguments are not numeric",
         call. = T)
  }
  
  if(!(period_number %in% 1:12)) {
    stop("The supplied object to the `period_number` argument is not a integer from 1 to 12",
         call. = T)
  }
  
  if(!time_period %in% c("monthly", "quarterly")) {
    stop("The supplied object to the `time_period` argument is not either \"monthly\", or \"quarterly\"",
         call. = T)
  }
  
  if(time_period == "quarterly") {
    ann_val <- (((later_val / dec_val) ^ (4 / period_number)) - 1) * 100  
  } else {
    ann_val <- (((later_val / dec_val) ^ (12 / period_number)) - 1) * 100
  }

  return(ann_val)  
  
}