box::use(
  dplyr[mutate],
  tibble[tibble],
)

#' @export
get_options <- function(names, disabled_op = NULL) {
  options <- tibble(key = names, text = names)

  if (!is.null(disabled_op) && disabled_op != "") {
    options <- options |>
      mutate(
        disabled = is.element(key, disabled_op)
      )
  }

  options <- options |>
    split(seq_along(names)) |>
    unname() |>
    lapply(function(x) {
      as.list(x)
    })
}
