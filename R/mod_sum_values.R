#' sum_values UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_sum_values_ui <- function(id){
  ns <- NS(id)
  tagList(
    textOutput(ns("value"))
  )
}

#' sum_values Server Functions
#'
#' @noRd
mod_sum_values_server <- function(id, val_1, val_2){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output[["value"]] <- renderText({ val_1() * 2 + val_2() * 5 })
  })
}

## To be copied in the UI
# mod_sum_values_ui("sum_values_1")

## To be copied in the server
# mod_sum_values_server("sum_values_1")
