#' survey_inputs_experience UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_inputs_experience_ui <- function(id){
  ns <- NS(id)
  tagList(
    textInput(ns("title"), label = "Title", value = ""),
    textInput(ns("company"), label = "Company", value = ""),
    textInput(ns("city_state"), label = "City, State", value = ""),
    dateInput(ns("date_start"), label = "Start Date", value = NULL),
    dateInput(ns("date_end"), label = "End Date", value = NULL),
    textInput(ns("bullet1"), label = "Bullet Point 1 (Optional)", value = ""),
    textInput(ns("bullet2"), label = "Bullet Point 2 (Optional)", value = ""),
    textInput(ns("bullet3"), label = "Bullet Point 3 (Optional)", value = ""),
    textInput(ns("bullet4"), label = "Bullet Point 4 (Optional)", value = ""),
    textInput(ns("bullet5"), label = "Bullet Point 5 (Optional)", value = ""),
    textInput(ns("bullet6"), label = "Bullet Point 6 (Optional)", value = "")
  )
}
    
#' survey_inputs_experience Server Functions
#'
#' @noRd 
mod_survey_inputs_experience_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    return(
      list(
        title = reactive({ input$title }),
        company = reactive({ input$company }),
        city_state = reactive({ input$city_state }),
        date_start = reactive({ input$date_start }),
        date_end = reactive({ input$date_end }),
        bullet1 = reactive({ input$bullet1 }),
        bullet2 = reactive({ input$bullet2 }),
        bullet3 = reactive({ input$bullet3 }),
        bullet4 = reactive({ input$bullet4 }),
        bullet5 = reactive({ input$bullet5 }),
        bullet6 = reactive({ input$bullet6 })
      )
    )
    
  })
}
    
## To be copied in the UI
# mod_survey_inputs_experience_ui("survey_inputs_experience_1")
    
## To be copied in the server
# mod_survey_inputs_experience_server("survey_inputs_experience_1")
