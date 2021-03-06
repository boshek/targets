% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tar_resources.R
\name{tar_resources}
\alias{tar_resources}
\title{Target resources}
\usage{
tar_resources(
  aws = NULL,
  clustermq = NULL,
  feather = NULL,
  fst = NULL,
  future = NULL,
  parquet = NULL,
  qs = NULL,
  url = NULL
)
}
\arguments{
\item{aws}{Output of function \code{\link[=tar_resources_aws]{tar_resources_aws()}}.
AWS S3 storage settings for AWS backed storage formats
such as \code{"aws_qs"} and \verb{"aws_parquet}. Applies to all formats
beginning with the \code{"aws_"} prefix. For details on formats,
see the \code{format} argument of \code{\link[=tar_target]{tar_target()}}.}

\item{clustermq}{Output of function \code{\link[=tar_resources_clustermq]{tar_resources_clustermq()}}.
Optional \code{clustermq} settings for \code{\link[=tar_make_clustermq]{tar_make_clustermq()}},
including the \code{log_worker} and \code{template} arguments of
\code{clustermq::workers()}.}

\item{feather}{Output of function \code{\link[=tar_resources_feather]{tar_resources_feather()}}.
Non-default arguments to \code{arrow::read_feather()} and
\code{arrow::write_feather()} for \code{arrow}/feather-based storage formats.
Applies to all formats ending with the \code{"_feather"} suffix.
For details on formats, see the \code{format} argument of \code{\link[=tar_target]{tar_target()}}.}

\item{fst}{Output of function \code{\link[=tar_resources_fst]{tar_resources_fst()}}.
Non-default arguments to \code{fst::read_fst()} and
\code{fst::write_fst()} for \code{fst}-based storage formats.
Applies to all formats ending with \code{"fst"} in the name.
For details on formats, see the \code{format} argument of \code{\link[=tar_target]{tar_target()}}.}

\item{future}{Output of function \code{\link[=tar_resources_future]{tar_resources_future()}}.
Optional \code{future} settings for \code{\link[=tar_make_future]{tar_make_future()}},
including the \code{resources} argument of
\code{future::future()}, which can include values to insert in
template placeholders in \code{future.batchtools} template files.}

\item{parquet}{Output of function \code{\link[=tar_resources_parquet]{tar_resources_parquet()}}.
Non-default arguments to \code{arrow::read_parquet()} and
\code{arrow::write_parquet()} for \code{arrow}/parquet-based storage formats.
Applies to all formats ending with the \code{"_parquet"} suffix.
For details on formats, see the \code{format} argument of \code{\link[=tar_target]{tar_target()}}.}

\item{qs}{Output of function \code{\link[=tar_resources_qs]{tar_resources_qs()}}.
Non-default arguments to \code{qs::qread()} and
\code{qs::qsave()} for \code{qs}-based storage formats.
Applies to all formats ending with the \code{"_qs"} suffix.
For details on formats, see the \code{format} argument of \code{\link[=tar_target]{tar_target()}}.}

\item{url}{Output of function \code{\link[=tar_resources_url]{tar_resources_url()}}.
Non-default settings for storage formats ending with the \code{"_url"} suffix.
These settings include the \code{curl} handle for extra control over HTTP
requests. For details on formats, see the \code{format} argument of
\code{\link[=tar_target]{tar_target()}}.}
}
\value{
A list of objects of class \code{"tar_resources"} with
non-default settings of various optional backends for data storage
and high-performance computing.
}
\description{
Create a \code{resources} argument for \code{\link[=tar_target]{tar_target()}}
or \code{\link[=tar_option_set]{tar_option_set()}}.
}
\section{Resources}{

Functions \code{\link[=tar_target]{tar_target()}} and \code{\link[=tar_option_set]{tar_option_set()}}
each takes an optional \code{resources} argument to supply
non-default settings of various optional backends for data storage
and high-performance computing. The \code{tar_resources()} function
is a helper to supply those settings in the correct manner.
}

\examples{
# Somewhere in you target script file (usually _targets.R):
tar_target(
  name,
  command(),
  format = "qs",
  resources = tar_resources(
    qs = tar_resources_qs(preset = "fast"),
    future = tar_resources_future(resources = list(n_cores = 1))
  )
)
}
\seealso{
Other resources: 
\code{\link{tar_resources_aws}()},
\code{\link{tar_resources_clustermq}()},
\code{\link{tar_resources_feather}()},
\code{\link{tar_resources_fst}()},
\code{\link{tar_resources_future}()},
\code{\link{tar_resources_parquet}()},
\code{\link{tar_resources_qs}()},
\code{\link{tar_resources_url}()}
}
\concept{resources}
