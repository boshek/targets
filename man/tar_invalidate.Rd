% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_invalidate.R
\name{tar_invalidate}
\alias{tar_invalidate}
\title{Invalidate targets and global objects in the metadata.}
\usage{
tar_invalidate(names, store = targets::tar_config_get("store"))
}
\arguments{
\item{names}{Names of the targets to remove from the metadata list.
You can supply symbols, a character vector,
or \code{tidyselect} helpers like \code{\link[=starts_with]{starts_with()}}.}

\item{store}{Character of length 1, path to the
\code{targets} data store. Defaults to \code{tar_config_get("store")},
which in turn defaults to \verb{_targets/}.
When you set this argument, the value of \code{tar_config_get("store")}
is temporarily changed for the current function call.
See \code{\link[=tar_config_get]{tar_config_get()}} and \code{\link[=tar_config_set]{tar_config_set()}} for details
about how to set the data store path persistently
for a project.}
}
\description{
Delete the metadata of records in \verb{_targets/meta/meta}
but keep the return values of targets in \verb{_targets/objects/}.
}
\details{
For patterns recorded in the metadata, all the branches
will be invalidated. For patterns no longer in the metadata,
branches are left alone.
}
\examples{
if (identical(Sys.getenv("TAR_EXAMPLES"), "true")) {
tar_dir({ # tar_dir() runs code from a temporary directory.
tar_script({
  list(
    tar_target(y1, 1 + 1),
    tar_target(y2, 1 + 1),
    tar_target(z, y1 + y2)
  )
}, ask = FALSE)
tar_make()
tar_invalidate(starts_with("y")) # Only invalidates y1 and y2.
tar_make() # y1 and y2 rebuild but return same values, so z is up to date.
})
}
}
\seealso{
Other clean: 
\code{\link{tar_delete}()},
\code{\link{tar_destroy}()},
\code{\link{tar_prune}()}
}
\concept{clean}
