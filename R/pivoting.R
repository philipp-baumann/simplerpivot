dplyr::starwars %>%
  group_by(eye_color) %>%
  nest() %>%
  mutate(n = map_int(data,
    ~ nrow(.x)))

#' @title Nest by grouping variable and count observations.
#'
#' @param data Data frame (tibble) with data to be pivoted.
#' @param grp Name (symbol) or string with grouping variable
#'
#' @return
#' @importFrom dplyr group_by mutate
#' @importFrom tidyr nest
#' @import rlang enquo
#' @export
#'
#' @examples
count_nested <- function(data, grp) {
  grp <- rlang::enquo(grp)
  data %>%
    dplyr::group_by(!!grp) %>%
    tidyr::nest() %>%
    dplyr::mutate(n = map_int(data,
      ~ nrow(.x)))
}

dplyr::starwars %>%
  count_nested(grp = eye_color)

