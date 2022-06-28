#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @import ggplot2
#' @noRd
app_server <- function(input, output, session) {
  val_1 <- mod_select_and_plot_server("select_and_plot_1", geom_point)
  val_2 <- mod_select_and_plot_server("select_and_plot_2", geom_line)
  mod_sum_values_server("sum_values_1", val_1, val_2)
}
