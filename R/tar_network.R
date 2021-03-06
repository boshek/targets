#' @title Return the vertices and edges of a pipeline dependency graph.
#' @export
#' @family inspect
#' @description Analyze the pipeline defined in the target script file
#'   (default: `_targets.R`)
#'   and return the vertices and edges of the directed acyclic graph
#'   of dependency relationships.
#' @return A list with two data frames: `vertices` and `edges`. The
#'   vertices data frame has one row per target with fields to denote
#'   the type of the target or object (stem, branch, map, cross, function,
#'   or object) and the target's status
#'   (up to date, outdated, started, canceled, or errored).
#'   The edges data frame has one row for every edge and columns `to` and
#'   `from` to mark the starting and terminating vertices.
#' @inheritParams tar_outdated
#' @param targets_only Logical, whether to restrict the output to just targets
#'   (`FALSE`) or to also include imported global functions and objects.
#' @examples
#' if (identical(Sys.getenv("TAR_EXAMPLES"), "true")) {
#' tar_dir({ # tar_dir() runs code from a temporary directory.
#' tar_script({
#'   tar_option_set()
#'   list(
#'     tar_target(y1, 1 + 1),
#'     tar_target(y2, 1 + 1),
#'     tar_target(z, y1 + y2)
#'   )
#' }, ask = FALSE)
#' tar_network(targets_only = TRUE)
#' })
#' }
tar_network <- function(
  targets_only = FALSE,
  reporter = targets::tar_config_get("reporter_outdated"),
  callr_function = callr::r,
  callr_arguments = targets::callr_args_default(callr_function, reporter),
  envir = parent.frame(),
  script = targets::tar_config_get("script"),
  store = targets::tar_config_get("store")
) {
  force(envir)
  assert_lgl(targets_only, "targets_only must be logical.")
  tar_config_assert_reporter_outdated(reporter)
  assert_callr_function(callr_function)
  assert_list(callr_arguments, "callr_arguments mut be a list.")
  targets_arguments <- list(
    path_store = store,
    targets_only = targets_only,
    reporter = reporter
  )
  callr_outer(
    targets_function = tar_network_inner,
    targets_arguments = targets_arguments,
    callr_function = callr_function,
    callr_arguments = callr_arguments,
    envir = envir,
    script = script
  )
}

tar_network_inner <- function(
  pipeline,
  path_store,
  targets_only,
  reporter
) {
  meta <- meta_init(path_store = path_store)
  progress <- progress_init(path_store = path_store)
  inspection <- inspection_init(
    pipeline = pipeline,
    meta = meta,
    progress = progress,
    reporter = reporter
  )
  inspection$update(targets_only = targets_only)
  list(
    vertices = tibble::as_tibble(inspection$vertices),
    edges = tibble::as_tibble(inspection$edges)
  )
}
