#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function(input, output, session) {
  set.seed(2137)

  dat <- reactive({
    data.frame(
      x = rnorm(input[["n"]]),
      y = rnorm(input[["n"]])
    )
  })

  output[["my_plot"]] <- renderPlot({
    ggplot(dat(), aes(x, y)) +
      geom_point()
  })
}
