#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Contact ====
  contact <- mod_survey_inputs_contact_server("survey_inputs_contact_1")
  
  # Education ====
  education_1 <- mod_survey_inputs_education_server("survey_inputs_education_1")
  education_2 <- mod_survey_inputs_education_server("survey_inputs_education_2")
  education_3 <- mod_survey_inputs_education_server("survey_inputs_education_3")
  education_4 <- mod_survey_inputs_education_server("survey_inputs_education_4")
  
  # Experience ====
  experience_1 <- mod_survey_inputs_experience_server("survey_inputs_experience_1")
  experience_2 <- mod_survey_inputs_experience_server("survey_inputs_experience_2")
  experience_3 <- mod_survey_inputs_experience_server("survey_inputs_experience_3")
  experience_4 <- mod_survey_inputs_experience_server("survey_inputs_experience_4")
  experience_5 <- mod_survey_inputs_experience_server("survey_inputs_experience_5")
  experience_6 <- mod_survey_inputs_experience_server("survey_inputs_experience_6")
  
  # Objective ====
  objective <- mod_survey_inputs_objective_server("survey_inputs_objective_1")
  
  # Skills ====
  skills_1 <- mod_survey_inputs_skills_server("survey_inputs_skills_1")
  skills_2 <- mod_survey_inputs_skills_server("survey_inputs_skills_2")
  skills_3 <- mod_survey_inputs_skills_server("survey_inputs_skills_3")
  skills_4 <- mod_survey_inputs_skills_server("survey_inputs_skills_4")
  skills_5 <- mod_survey_inputs_skills_server("survey_inputs_skills_5")
  skills_6 <- mod_survey_inputs_skills_server("survey_inputs_skills_6")
  
  # Downloads ====
  download_templateFilled <- 
    mod_survey_download_templateFilled_server("survey_download_templateFilled_1", 
                                              contact, 
                                              education_1 = education_1,
                                              education_2 = education_2,
                                              education_3 = education_3,
                                              education_4 = education_4,
                                              experience_1 = experience_1,
                                              experience_2 = experience_2,
                                              experience_3 = experience_3,
                                              experience_4 = experience_4,
                                              experience_5 = experience_5,
                                              experience_6 = experience_6,
                                              objective = objective,
                                              skills_1 = skills_1,
                                              skills_2 = skills_2,
                                              skills_3 = skills_3,
                                              skills_4 = skills_4,
                                              skills_5 = skills_5,
                                              skills_6 = skills_6)
  
  download_templateEmpty <- 
   mod_survey_download_templateEmpty_server("survey_download_templateEmpty_1")
  
  # Build Template ====
  template_upload <- 
    mod_upload_template_server("upload_template_1")
  
  resume_template <- 
    mod_build_resume_template_server("build_resume_template_1", 
                                     template_upload = template_upload)
  
  # Build Survey ====
  resume_survey <- 
    mod_build_resume_survey_server("build_resume_survey_1",
                                   contact = contact, 
                                   education_1 = education_1,
                                   education_2 = education_2,
                                   education_3 = education_3,
                                   education_4 = education_4,
                                   experience_1 = experience_1,
                                   experience_2 = experience_2,
                                   experience_3 = experience_3,
                                   experience_4 = experience_4,
                                   experience_5 = experience_5,
                                   experience_6 = experience_6,
                                   objective = objective,
                                   skills_1 = skills_1,
                                   skills_2 = skills_2,
                                   skills_3 = skills_3,
                                   skills_4 = skills_4,
                                   skills_5 = skills_5,
                                   skills_6 = skills_6)
}
