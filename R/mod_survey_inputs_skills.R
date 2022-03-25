#' survey_inputs_skills UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_inputs_skills_ui <- function(id){
  ns <- NS(id)
  tagList(
    textInput(ns("skill"), label = "Skill", value = ""),
    textInput(ns("description"), label = "Description (Optional)", value = "")
  )
}
    
#' survey_inputs_skills Server Functions
#'
#' @noRd 
mod_survey_inputs_skills_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    return(
      list(
        skill = reactive({ input$skill }),
        description = reactive({ input$description })
      )
    )
 
  })
}
    
## To be copied in the UI
# mod_survey_inputs_skills_ui("survey_inputs_skills_1")
    
## To be copied in the server
# mod_survey_inputs_skills_server("survey_inputs_skills_1")
