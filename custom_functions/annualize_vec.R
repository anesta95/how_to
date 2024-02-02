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
