% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_envvars.R
\name{tar_envvars}
\alias{tar_envvars}
\title{Show environment variables to customize \code{targets}}
\usage{
tar_envvars(unset = "")
}
\arguments{
\item{unset}{Character of length 1, value to return
for any environment variable that is not set.}
}
\value{
A data frame with one row per environment variable
and columns with the name and current value of each.
An unset environment variable will have a value of \code{""}
by default. (Customize with the \code{unset} argument).
}
\description{
You can customize the behavior of \code{targets}
with special environment variables. The sections in this help file
describe each environment variable, and the \code{tar_envvars()} function
lists their current values.
}
\details{
If you modify environment variables, please set them
in project-level \code{.Renviron} file so you do not lose your
configuration when you restart your R session.
Modify the project-level \code{.Renviron} file with
\code{usethis::edit_r_environ(scope = "project")}. Restart
your R session after you are done editing.
}
\section{TAR_ASK}{

The \code{TAR_ASK} environment variable accepts values \code{"true"} and \code{"false"}.
If \code{TAR_ASK} is not set, or if it is set to \code{"true"},
then \code{targets} asks permission in a menu
before overwriting certain files, such as the target script file
(default: \verb{_targets.R}) in \code{\link[=tar_script]{tar_script()}}.
If \code{TAR_ASK} is \code{"false"}, then \code{targets} overwrites the old files
with the new ones without asking. Once you are comfortable with
\code{\link[=tar_script]{tar_script()}}, \code{\link[=tar_github_actions]{tar_github_actions()}}, and similar functions,
you can safely set \code{TAR_ASK} to \code{"false"} in either a project-level
or user-level \code{.Renviron} file.
}

\section{TAR_WARN}{

The \code{TAR_WARN} environment variable accepts values \code{"true"} and \code{"false"}.
If \code{TAR_WARN} is not set, or if it is set to \code{"true"},
then \code{targets} throws warnings in certain edge cases,
such as target/global name conflicts and dangerous use of
\code{devtools::load_all()}. If \code{TAR_WARN} is \code{"false"}, then \code{targets}
does not throw warnings in these cases.
These warnings are harmless, and they can detect potentially serious
issues with your pipeline, so please do not set \code{TAR_WARN}
unless your use case absolutely requires it.
}

\examples{
tar_envvars()
}
\seealso{
Other configuration: 
\code{\link{tar_config_get}()},
\code{\link{tar_config_set}()},
\code{\link{tar_option_get}()},
\code{\link{tar_option_reset}()},
\code{\link{tar_option_set}()}
}
\concept{configuration}
