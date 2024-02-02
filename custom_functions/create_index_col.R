# Function
create_index_col <- function(vec, index_type = 100) {
  # Things this function needs to do:
  # 1. Check if `vec` is a numeric vector, if not, throw an error.
  # 2. Create a new vector of either a 100 base or 0 based index depending on
  # the value provided in the `index_type` argument.
  # 3. Return new index vector.
  
  if (!is.vector(vec) | length(vec) < 2 | !is.numeric(vec)) {
    stop("The supplied object to the `vec` argument object is not a numeric vector of at least two items",
         call. = T)
  }
  
  if (!(index_type %in% c(0, 100))) {
    stop("Please provide integer `0` or `100` as the index_type argument.")
  }
  
  if (index_type == 100L) {
    index_vec <- (vec / vec[1]) * 100
    message("Using 100-base index")
    return(index_vec)
  } else {
    index_vec <- ((vec / vec[1]) - 1) * 100
    message("Using 0-base index")
    return(index_vec)
  }
  
}

# Examples:
# 1. Create one new index column
df <- tibble::tibble(
  date = seq.Date(from = base::as.Date("2000-01-01"), 
                  to = base::as.Date("2013-01-01"),
                  by = "year"),
  x = c(250, 500, 810, 925, 1010, 1052, 1030, 1240, 1470, 1500,
        1525, 1580, 1740, 1890),
  y = c(2000, 3000, 6000, 6500, 6500, 7100, 7300, 7600, 7800, 8300, 9200, 9900,
        10200, 9800)
)

dplyr::mutate(df, index_x = create_index_col(vec))

# 2. Modify two index columns
dplyr::mutate(df, dplyr::across(dplyr::where(is.numeric), ~create_index_col(.x, index_type = 0)))

# 3. Create two new index columns
dplyr::mutate(df, dplyr::across(dplyr::where(is.numeric), ~create_index_col(.x), .names = "index_{.col}"))
