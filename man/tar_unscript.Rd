% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_unscript.R
\name{tar_unscript}
\alias{tar_unscript}
\title{Remove target script helper files.}
\usage{
tar_unscript(script = targets::tar_config_get("script"))
}
\arguments{
\item{script}{Character of length 1, path to the
target script file. Defaults to \code{tar_config_get("script")},
which in turn defaults to \verb{_targets.R}. When you set
this argument, the value of \code{tar_config_get("script")}
is temporarily changed for the current function call.
See \code{\link[=tar_script]{tar_script()}},
\code{\link[=tar_config_get]{tar_config_get()}}, and \code{\link[=tar_config_set]{tar_config_set()}} for details
about the target script file and how to set it
persistently for a project.}
}
\value{
\code{NULL} (invisibly).
}
\description{
Target Markdown writes helper scripts in a folder accompanying
the target script file. If the target script is the default \verb{_targets.R},
the helper scripts are in \verb{_targets_r/}. If the some other location
like \code{custom/script.R}, the helper scripts are in \verb{custom/script_r/}.
Use \code{\link[=tar_unscript]{tar_unscript()}} to remove all these helper scripts in the \verb{*_r/}
directory. The actual target script is not removed.
}
\examples{
tar_dir({ # tar_dir() runs code from a temporary directory.
tar_unscript()
})
}
