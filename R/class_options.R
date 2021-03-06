options_init <- function(
  tidy_eval = NULL,
  packages = NULL,
  imports = NULL,
  library = NULL,
  envir = NULL,
  format = NULL,
  iteration = NULL,
  error = NULL,
  memory = NULL,
  garbage_collection = NULL,
  deployment = NULL,
  priority = NULL,
  backoff = NULL,
  resources = NULL,
  storage = NULL,
  retrieval = NULL,
  cue = NULL,
  debug = NULL,
  workspaces = NULL
) {
  options_new(
    tidy_eval = tidy_eval,
    packages = packages,
    imports = imports,
    library = library,
    envir = envir,
    format = format,
    iteration = iteration,
    error = error,
    memory = memory,
    garbage_collection = garbage_collection,
    deployment = deployment,
    priority = priority,
    backoff = backoff,
    resources = resources,
    storage = storage,
    retrieval = retrieval,
    cue = cue,
    debug = debug,
    workspaces = workspaces
  )
}

options_new <- function(
  tidy_eval = NULL,
  packages = NULL,
  imports = NULL,
  library = NULL,
  envir = NULL,
  format = NULL,
  iteration = NULL,
  error = NULL,
  memory = NULL,
  garbage_collection = NULL,
  deployment = NULL,
  priority = NULL,
  backoff = NULL,
  resources = NULL,
  storage = NULL,
  retrieval = NULL,
  cue = NULL,
  debug = NULL,
  workspaces = NULL
) {
  options_class$new(
    tidy_eval = tidy_eval,
    packages = packages,
    imports = imports,
    library = library,
    envir = envir,
    format = format,
    iteration = iteration,
    error = error,
    memory = memory,
    garbage_collection = garbage_collection,
    deployment = deployment,
    priority = priority,
    backoff = backoff,
    resources = resources,
    storage = storage,
    retrieval = retrieval,
    cue = cue,
    debug = debug,
    workspaces = workspaces
  )
}

options_class <- R6::R6Class(
  classname = "tar_options",
  class = FALSE,
  portable = FALSE,
  cloneable = FALSE,
  public = list(
    tidy_eval = NULL,
    packages = NULL,
    imports = NULL,
    library = NULL,
    envir = NULL,
    format = NULL,
    iteration = NULL,
    error = NULL,
    memory = NULL,
    garbage_collection = NULL,
    deployment = NULL,
    priority = NULL,
    backoff = NULL,
    resources = NULL,
    storage = NULL,
    retrieval = NULL,
    cue = NULL,
    debug = NULL,
    workspaces = NULL,
    initialize = function(
      tidy_eval = NULL,
      packages = NULL,
      imports = NULL,
      library = NULL,
      envir = NULL,
      format = NULL,
      iteration = NULL,
      error = NULL,
      memory = NULL,
      garbage_collection = NULL,
      deployment = NULL,
      priority = NULL,
      backoff = NULL,
      resources = NULL,
      storage = NULL,
      retrieval = NULL,
      cue = NULL,
      debug = NULL,
      workspaces = NULL
    ) {
      self$tidy_eval <- tidy_eval
      self$packages <- packages
      self$imports <- imports
      self$library <- library
      self$envir <- envir
      self$format <- format
      self$iteration <- iteration
      self$error <- error
      self$memory <- memory
      self$garbage_collection <- garbage_collection
      self$deployment <- deployment
      self$priority <- priority
      self$backoff <- backoff
      self$resources <- resources
      self$storage <- storage
      self$retrieval <- retrieval
      self$cue <- cue
      self$debug <- debug
      self$workspaces <- workspaces
    },
    export = function() {
      list(
        tidy_eval = self$get_tidy_eval(),
        packages = self$get_packages(),
        imports = self$get_imports(),
        library = self$get_library(),
        format = self$get_format(),
        iteration = self$get_iteration(),
        error = self$get_error(),
        memory = self$get_memory(),
        garbage_collection = self$get_garbage_collection(),
        deployment = self$get_deployment(),
        priority = self$get_priority(),
        backoff = self$get_backoff(),
        resources = self$get_resources(),
        storage = self$get_storage(),
        retrieval = self$get_retrieval(),
        cue = self$get_cue(),
        debug = self$get_debug(),
        workspaces = self$get_workspaces()
      )
    },
    import = function(list) {
      self$set_tidy_eval(list$tidy_eval)
      self$set_packages(list$packages)
      self$set_imports(list$imports)
      self$set_library(list$library)
      self$set_format(list$format)
      self$set_iteration(list$iteration)
      self$set_error(list$error)
      self$set_memory(list$memory)
      self$set_garbage_collection(list$garbage_collection)
      self$set_deployment(list$deployment)
      self$set_priority(list$priority)
      self$set_backoff(list$backoff)
      self$set_resources(list$resources)
      self$set_storage(list$storage)
      self$set_retrieval(list$retrieval)
      self$set_cue(list$cue)
      self$set_debug(list$debug)
      self$set_workspaces(list$workspaces)
    },
    reset = function() {
      self$tidy_eval <- NULL
      self$packages <- NULL
      self$imports <- NULL
      self$library <- NULL
      self$envir <- NULL
      self$format <- NULL
      self$iteration <- NULL
      self$error <- NULL
      self$memory <- NULL
      self$garbage_collection <- NULL
      self$deployment <- NULL
      self$priority <- NULL
      self$backoff <- NULL
      self$resources <- NULL
      self$storage <- NULL
      self$retrieval <- NULL
      self$cue <- NULL
      self$debug <- NULL
      self$workspaces <- NULL
    },
    get_tidy_eval = function() {
      self$tidy_eval %|||% TRUE
    },
    get_packages = function() {
      self$packages %|||% (.packages())
    },
    get_imports = function() {
      self$imports %|||% character(0)
    },
    get_library = function() {
      self$library %|||% NULL
    },
    get_envir = function() {
      self$envir %|||% globalenv()
    },
    get_format = function() {
      self$format %|||% "rds"
    },
    get_iteration = function() {
      self$iteration %|||% "vector"
    },
    get_error = function() {
      self$error %|||% "stop"
    },
    get_memory = function() {
      self$memory %|||% "persistent"
    },
    get_garbage_collection = function() {
      self$garbage_collection %|||% FALSE
    },
    get_deployment = function() {
      self$deployment %|||% "worker"
    },
    get_priority = function() {
      self$priority %|||% 0
    },
    get_backoff = function() {
      self$backoff %|||% 0.1
    },
    get_resources = function() {
      self$resources %|||% list()
    },
    get_storage = function() {
      self$storage %|||% "main"
    },
    get_retrieval = function() {
      self$retrieval %|||% "main"
    },
    get_cue = function() {
      self$cue %|||% tar_cue()
    },
    get_debug = function() {
      self$debug %|||% character(0)
    },
    get_workspaces = function() {
      self$workspaces %|||% character(0)
    },
    set_tidy_eval = function(tidy_eval) {
      self$validate_tidy_eval(tidy_eval)
      self$tidy_eval <- tidy_eval
    },
    set_packages = function(packages) {
      self$validate_packages(packages)
      self$packages <- packages
    },
    set_imports = function(imports) {
      self$validate_imports(imports)
      self$imports <- imports
    },
    set_library = function(library) {
      self$validate_library(library)
      self$library <- library
    },
    set_envir = function(envir) {
      self$validate_envir(envir)
      self$envir <- envir
    },
    set_format = function(format) {
      self$validate_format(format)
      self$format <- format
    },
    set_iteration = function(iteration) {
      self$validate_iteration(iteration)
      self$iteration <- iteration
    },
    set_error = function(error) {
      self$validate_error(error)
      self$error <- error
    },
    set_memory = function(memory) {
      self$validate_memory(memory)
      self$memory <- memory
    },
    set_garbage_collection = function(garbage_collection) {
      self$validate_garbage_collection(garbage_collection)
      self$garbage_collection <- garbage_collection
    },
    set_deployment = function(deployment) {
      self$validate_deployment(deployment)
      self$deployment <- deployment
    },
    set_priority = function(priority) {
      self$validate_priority(priority)
      self$priority <- priority
    },
    set_backoff = function(backoff) {
      self$validate_backoff(backoff)
      self$backoff <- backoff
    },
    set_resources = function(resources) {
      self$validate_resources(resources)
      self$resources <- resources
    },
    set_storage = function(storage) {
      self$validate_storage(storage)
      self$storage <- storage
    },
    set_retrieval = function(retrieval) {
      self$validate_retrieval(retrieval)
      self$retrieval <- retrieval
    },
    set_cue = function(cue) {
      self$validate_cue(cue)
      self$cue <- cue
    },
    set_debug = function(debug) {
      self$validate_debug(debug)
      self$debug <- debug
    },
    set_workspaces = function(workspaces) {
      self$validate_workspaces(workspaces)
      self$workspaces <- workspaces
    },
    validate_tidy_eval = function(tidy_eval) {
      assert_scalar(tidy_eval, "tidy_eval option must have length 1.")
      assert_lgl(tidy_eval, "tidy_eval option must be logical.")
    },
    validate_packages = function(packages) {
      assert_chr(packages, "packages option must be character.")
    },
    validate_imports = function(imports) {
      assert_chr(imports, "imports option must be character.")
    },
    validate_library = function(library) {
      assert_chr(
        library %|||% character(0),
        "library option must be character."
      )
    },
    validate_envir = function(envir) {
      msg <- paste(
        "envir option must be the environment",
        "where you put your functions and global objects",
        "(global environment for most users)."
      )
      assert_envir(envir, msg)
    },
    validate_format = function(format) {
      assert_format(format)
    },
    validate_iteration = function(iteration) {
      assert_flag(iteration, c("vector", "list", "group"))
    },
    validate_error = function(error) {
      assert_flag(error, c("stop", "continue", "workspace"))
    },
    validate_memory = function(memory) {
      assert_flag(memory, c("persistent", "transient"))
    },
    validate_garbage_collection = function(garbage_collection) {
      assert_lgl(garbage_collection, "garbage_collection must be logical.")
      assert_scalar(garbage_collection, "garbage_collection must be a scalar.")
    },
    validate_deployment = function(deployment) {
      assert_flag(deployment, c("worker", "main"))
    },
    validate_priority = function(priority) {
      assert_dbl(priority, msg = "priority must be numeric")
      assert_scalar(priority, msg = "priority must have length 1")
      assert_ge(priority, 0, msg = "priority cannot be less than 0")
      assert_le(priority, 1, msg = "priority cannot be greater than 1")
    },
    validate_backoff = function(backoff) {
      assert_dbl(backoff, msg = "backoff must be numeric")
      assert_scalar(backoff, msg = "backoff must have length 1")
      assert_ge(backoff, 0.001, msg = "backoff cannot be less than 0.001")
      assert_le(backoff, 1e9, msg = "backoff cannot be greater than 1e9")
    },
    validate_resources = function(resources) {
      assert_resources(resources)
    },
    validate_storage = function(storage) {
      assert_flag(storage, c("main", "worker"))
    },
    validate_retrieval = function(retrieval) {
      assert_flag(retrieval, c("main", "worker"))
    },
    validate_cue = function(cue) {
      cue_validate(cue)
    },
    validate_debug = function(debug) {
      assert_chr(debug, "debug option must be a character.")
    },
    validate_workspaces = function(workspaces) {
      assert_chr(workspaces, "workspaces option must be a character.")
    },
    validate = function() {
      self$validate_tidy_eval(self$get_tidy_eval())
      self$validate_packages(self$get_packages())
      self$validate_imports(self$get_imports())
      self$validate_library(self$get_library())
      self$validate_envir(self$get_envir())
      self$validate_format(self$get_format())
      self$validate_iteration(self$get_iteration())
      self$validate_error(self$get_error())
      self$validate_memory(self$get_memory())
      self$validate_garbage_collection(self$get_garbage_collection())
      self$validate_deployment(self$get_deployment())
      self$validate_priority(self$get_priority())
      self$validate_backoff(self$get_backoff())
      self$validate_resources(self$get_resources())
      self$validate_storage(self$get_storage())
      self$validate_retrieval(self$get_retrieval())
      self$validate_cue(self$get_cue())
      self$validate_debug(self$get_debug())
      self$validate_workspaces(self$get_workspaces())
    }
  )
)

tar_options <- options_init()
