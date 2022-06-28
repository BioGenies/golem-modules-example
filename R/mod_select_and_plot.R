#' select_and_plot UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_select_and_plot_ui <- function(id) {
  ns <- NS(id)
  sidebarLayout(
    sidebarPanel(
      numericInput(inputId = ns("n"),
                   label = "select num points",
                   value = 10,
                   min = 1,
                   max = 1000)
    ),
    mainPanel(
      plotOutput(ns("my_plot"))
    )
  )
}

#' select_and_plot Server Functions
#'
#' @noRd
mod_select_and_plot_server <- function(id, geom) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    set.seed(2137)

    dat <- reactive({
      data.frame(
        x = rnorm(input[["n"]]),
        y = rnorm(input[["n"]])
      )
    })

    output[["my_plot"]] <- renderPlot({
      ggplot(dat(), aes(x, y)) +
        geom()
    })

    return(
      reactive({ input[["n"]] })
    )
  })
}

## To be copied in the UI
# mod_select_and_plot_ui("select_and_plot_1")

## To be copied in the server
# mod_select_and_plot_server("select_and_plot_1")
