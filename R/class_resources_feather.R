resources_feather_init <- function(
  compression = "default",
  compression_level = NULL
) {
  resources_feather_new(
    compression = compression,
    compression_level = compression_level
  )
}

resources_feather_new <- function(
  compression = NULL,
  compression_level = NULL
) {
  force(compression)
  force(compression_level)
  enclass(environment(), c("tar_resources_feather", "tar_resources"))
}

#' @export
resources_validate.tar_resources_feather <- function(resources) {
  assert_scalar(resources$compression)
  assert_chr(resources$compression)
  assert_nzchar(resources$compression)
  assert_scalar(resources$compression_level %|||% 1)
  assert_dbl(resources$compression_level %|||% 1)
}

#' @export
print.tar_resources_feather <- function(x, ...) {
  cat(
    "<tar_resources_feather>\n ",
    paste0(paste_list(as.list(x)), collapse = "\n  ")
  )
}
