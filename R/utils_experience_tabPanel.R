#' experience_tabPanel 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
experience_tabPanel <- function(id, number) {
  
  id_instance <- paste(id, number, sep = "_")
  
  tabPanel(
    title = number,
    fluidRow(
      column(width = 3),
      column(
        width = 3,
        mod_survey_inputs_experience_ui(id_instance)[[1]]
      ),
      column(
        width = 3,
        mod_survey_inputs_experience_ui(id_instance)[[2]]
      ),
      column(width = 3)
    ),
    fluidRow(
      column(
        width = 4,
        mod_survey_inputs_experience_ui(id_instance)[3:5]
      ),
      column(
        width = 4,
        mod_survey_inputs_experience_ui(id_instance)[6:8]
      ),
      column(
        width = 4,
        mod_survey_inputs_experience_ui(id_instance)[9:11]
      )
    )
  )
}