#' @title Load the values of targets (raw version).
#' @export
#' @family data
#' @description Same as [tar_load()] except `names` is a character vector.
#'   Do not use in `knitr` or R Markdown reports with `tarchetypes::tar_knit()`
#'   or `tarchetypes::tar_render()`.
#' @return Nothing.
#' @inheritSection tar_read Limited scope
#' @inheritParams tar_read
#' @param names Character vector, names of the targets to build or check.
#' @param branches Integer of indices of the branches to load
#'   for any targets that are patterns.
#' @param envir Environment to put the loaded targets.
#' @examples
#' if (identical(Sys.getenv("TAR_EXAMPLES"), "true")) {
#' tar_dir({ # tar_dir() runs code from a temporary directory.
#' tar_script({
#'   list(
#'     tar_target(y1, 1 + 1),
#'     tar_target(y2, 1 + 1),
#'     tar_target(z, y1 + y2)
#'   )
#' }, ask = FALSE)
#' tar_make()
#' tar_load_raw(c("y1", "y2"))
#' y1
#' y2
#' })
#' }
tar_load_raw <- function(
  names,
  branches = NULL,
  meta = tar_meta(store = store),
  envir = parent.frame(),
  store = targets::tar_config_get("store")
) {
  force(meta)
  force(envir)
  if (!length(names)) {
    cli_red_x("Identified no targets to load.")
  }
  assert_chr(names, "names arg of tar_load() must end up as character")
  if (!is.null(branches)) {
    assert_dbl(branches, "branches arg of tar_load() must be numeric")
    assert_positive(branches, "branches arg of tar_load() must be positive")
  }
  assert_df(meta, "meta arg of tar_load() must be a dataframe from tar_meta()")
  assert_envir(envir, "envir arg of tar_load must be an environment")
  map(names, ~tar_load_target(.x, branches, meta, envir, store))
  invisible()
}

tar_load_target <- function(name, branches, meta, envir, path_store) {
  object <- tar_read_inner(
    name = name,
    branches = branches,
    meta = meta,
    path_store = path_store
  )
  assign(x = name, value = object, envir = envir)
}
