# nocov start # Tested in tests/interactive/test-tar_watch.R
#' @title Shiny module server for tar_watch()
#' @export
#' @family progress
#' @description Use [tar_watch_ui()] and `tar_watch_server()`
#'   to include [tar_watch()] as a Shiny module in an app.
#' @return A Shiny module server.
#' @inheritParams tar_config_set
#' @param id Character of length 1, ID corresponding to the UI function
#'   of the module.
#' @param height Character of length 1,
#'   height of the `visNetwork` widget and branches table.
#' @param exclude Character vector of nodes to omit from the graph.
tar_watch_server <- function(
  id,
  height = "650px",
  exclude = ".Random.seed",
  config = "_targets.yaml"
) {
  assert_chr(
    exclude,
    "exclude in tar_watch_server() must be a character vector."
  )
  shiny::moduleServer(
    id,
    function(input, output, session) {
      interval <- 200
      refresh <- shiny::reactiveValues(refresh = tempfile())
      out <- shiny::reactiveValues(
        graph = NULL,
        summary = NULL,
        branches = NULL
      )
      react_millis <- shiny::reactive(1000 * as.numeric(input$seconds))
      react_targets <- shiny::reactive(as.logical(input$targets_only))
      react_outdated <- shiny::reactive(as.logical(input$outdated))
      react_label <- shiny::reactive(input$label_tar_visnetwork)
      react_ls <- shiny::reactive(as.numeric(input$level_separation))
      react_degree_from <- shiny::reactive(as.numeric(input$degree_from))
      react_degree_to <- shiny::reactive(as.numeric(input$degree_to))
      millis <- shiny::debounce(r = react_millis, millis = interval)
      targets_only <- shiny::debounce(r = react_targets, millis = interval)
      outdated_tl <- shiny::debounce(r = react_outdated, millis = interval)
      label <- shiny::debounce(r = react_label, millis = interval)
      level_separation <- shiny::debounce(r = react_ls, millis = interval)
      degree_from <- shiny::debounce(r = react_degree_from, millis = interval)
      degree_to <- shiny::debounce(r = react_degree_to, millis = interval)
      shiny::observeEvent(input$refresh, refresh$refresh <- tempfile())
      shiny::observe({
        if (identical(input$watch, TRUE)) {
          shiny::invalidateLater(millis = millis())
          refresh$refresh <- tempfile()
        }
      })
      shiny::observe({
        shiny::req(refresh$refresh)
        out$graph <- if_any(
          tar_exist_script(script = tar_config_get("script", config = config)),
          tar_visnetwork(
            targets_only = targets_only(),
            exclude = exclude,
            outdated = outdated_tl(),
            label = label(),
            level_separation = level_separation(),
            degree_from = degree_from(),
            degree_to = degree_to(),
            script = tar_config_get("script", config = config),
            store = tar_config_get("store", config = config)
          ),
          visNetwork::visNetwork(
            data_frame(
              label = "No target script file file detected.",
              shape = "text",
              font.size = "30"
            )
          )
        )
        out$summary <- if_any(
          tar_exist_progress(store = tar_config_get("store", config = config)),
          tar_progress_summary_gt(
            path_store = tar_config_get("store", config = config)
          ),
          gt_borderless(data_frame(progress = "No progress recorded."))
        )
        out$branches <- if_any(
          tar_exist_progress(store = tar_config_get("store", config = config)),
          tar_progress_branches_gt(
            path_store = tar_config_get("store", config = config)
          ),
          gt_borderless(data_frame(progress = "No progress recorded."))
        )
      })
      output$graph <- visNetwork::renderVisNetwork({
        shiny::req(out$graph)
        out$graph
      })
      output$summary <- gt::render_gt({
        shiny::req(out$summary)
        out$summary
      }, height = height)
      output$branches <- gt::render_gt({
        shiny::req(out$branches)
        out$branches
      }, height = height)
      output$display <- shiny::renderUI({
        switch(
          input$display %|||% "graph",
          graph = visNetwork::visNetworkOutput(
            session$ns("graph"),
            height = height
          ),
          summary = gt::gt_output(session$ns("summary")),
          branches = gt::gt_output(session$ns("branches")),
          about = tar_watch_about()
        )
      })
    }
  )
}

tar_watch_about <- function() {
  path <- system.file(
    file.path("app_docs", "tar_watch_about.md"),
    package = "targets",
    mustWork = TRUE
  )
  shiny::includeMarkdown(path)
}
# nocov end
