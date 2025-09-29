#' Preparing World Bank Data
#'
#' @param data World Bank dataset to be formatted and pivoted
#' @param colname string - name of morality count column
#'
#' @returns pivoted dataset
#' @examples
#' WBprep(maternal_mortality, "maternal_mortality")
#' @export
#'
WBprep <- function(df, colname) {

  colnames(df) <- gsub("X","", colnames(df))

  long <- tidyr::pivot_longer(df, cols = starts_with("2"), names_to = "year", values_to = colname)

  df_pivoted <- long[, c("iso", "year", colname)]

  df_pivoted$year <- as.numeric(df_pivoted$year)

  return(df_pivoted)
  }
