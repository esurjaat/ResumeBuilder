#' survey_inputs_objective UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_inputs_objective_ui <- function(id){
  ns <- NS(id)
  tagList(
    textInput(ns("objective"), label = "Objective", value = "")
  )
}
    
#' survey_inputs_objective Server Functions
#'
#' @noRd 
mod_survey_inputs_objective_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    return(
      list(
        objective = reactive({ input$objective })
      )
    )
 
  })
}
    
## To be copied in the UI
# mod_survey_inputs_objective_ui("survey_inputs_objective_1")
    
## To be copied in the server
# mod_survey_inputs_objective_server("survey_inputs_objective_1")
