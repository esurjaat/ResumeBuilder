#' survey_inputs_education UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_inputs_education_ui <- function(id){
  ns <- NS(id)
  
  tagList(
    textInput(ns("name"), 
              label = "Name",
              value = ""),
    textInput(ns("degree"),
              label = "Degree",
              value = ""),
    textInput(ns("minor"), 
              label = "Minor",
              value = ""),
    textInput(ns("city_state"),
              label = "City, State",
              value = ""),
    dateInput(ns("grad_date"),
              label = "Graduation Date",
              value = Sys.Date())
  )
}
    
#' survey_inputs_education Server Functions
#'
#' @noRd 
mod_survey_inputs_education_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    return(
      list(
        name = reactive({ input$name }),
        degree = reactive({ input$degree }),
        minor = reactive({ input$minor }),
        city_state = reactive({ input$city_state }),
        grad_date = reactive({ input$grad_date })
      )
    )
 
  })
}
    
## To be copied in the UI
# mod_survey_inputs_education_ui("survey_inputs_education_1")
    
## To be copied in the server
# mod_survey_inputs_education_server("survey_inputs_education_1")
