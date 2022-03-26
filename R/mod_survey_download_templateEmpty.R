#' survey_download_templateEmpty UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_download_templateEmpty_ui <- function(id){
  ns <- NS(id)
  tagList(
    downloadButton(ns("template_empty"), 
                   label = "Empty (.xlsx)")
 
  )
}
    
#' survey_download_templateEmpty Server Functions
#'
#' @noRd 
mod_survey_download_templateEmpty_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$template_empty <- 
      downloadHandler(
        filename = "Resume Content.xlsx",
        content = function(file){
          write_resumeContent(
            filename_output = file,
            full_name = NA,
            email = NA,
            github_name = NA,
            linkedin_name = NA,
            phone = NA,
            school_name = NA,
            degree = NA,
            minor = NA,
            city_state_education = NA,
            grad_date = NA,
            job_title = NA,
            company = NA,
            city_state_experience = NA,
            start_date_experience = NA,
            end_date_experience = NA,
            bp_1 = NA,
            bp_2 = NA,
            bp_3 = NA,
            bp_4 = NA,
            bp_5 = NA,
            bp_6 = NA,
            resume_objective = NA,
            skill_name = NA,
            skill_description = NA)
        }
      )
 
  })
}
    
## To be copied in the UI
# mod_survey_download_templateEmpty_ui("survey_download_templateEmpty_1")
    
## To be copied in the server
# mod_survey_download_templateEmpty_server("survey_download_templateEmpty_1")
