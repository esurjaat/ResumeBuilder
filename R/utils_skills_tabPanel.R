#' skills_tabPanel 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
skills_tabPanel <- function(id, number) {
  
  id_instance <- paste(id, number, sep = "_")
  
  tabPanel(
    title = number,
    mod_survey_inputs_skills_ui(id_instance)
  )
  
}