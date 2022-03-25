#' survey_inputs_contact UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd         
#'
#' @importFrom shiny NS tagList 
mod_survey_inputs_contact_ui <- function(id){
  ns <- NS(id)
  tagList(
    textInput(ns("full_name"), 
              label = "Full Name", 
              value = ""),
    textInput(ns("email"),
              label = "Email",
              value = ""),
    textInput(ns("github"),
              label = "Github (Optional)",
              value = ""),
    textInput(ns("linkedin"),
              label = "LinkedIn (Optional)",
              value = ""),
    textInput(ns("phone_number"),
              label = "Phone #",
              value = "")
  )
}
    
#' survey_inputs_contact Server Functions
#'
#' @noRd 
mod_survey_inputs_contact_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    return(
      list(
        full_name = reactive({ input$full_name }),
        email = reactive({ input$email }),
        github = reactive({ input$github }),
        linkedin = reactive({ input$linkedin }),
        phone_number = reactive({ input$phone_number })
      )
    )
 
  })
}
    
## To be copied in the UI
# mod_survey_inputs_contact_ui("survey_inputs_contact_1")
    
## To be copied in the server
# mod_survey_inputs_contact_server("survey_inputs_contact_1")
