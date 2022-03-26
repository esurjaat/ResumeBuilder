#' survey_download_templateFilled UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_survey_download_templateFilled_ui <- function(id){
  ns <- NS(id)
  tagList(
    downloadButton(ns("template_filled"),
                   label = "Filled (.xlsx)")
  )
}
    
#' survey_download_templateFilled Server Functions
#'
#' @noRd 
mod_survey_download_templateFilled_server <- function(id, 
                                                      contact, 
                                                      education_1,
                                                      education_2,
                                                      education_3,
                                                      education_4,
                                                      education_5,
                                                      experience_1,
                                                      experience_2,
                                                      experience_3,
                                                      experience_4,
                                                      experience_5,
                                                      experience_6,
                                                      objective,
                                                      skills_1,
                                                      skills_2,
                                                      skills_3,
                                                      skills_4,
                                                      skills_5,
                                                      skills_6){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$template_filled <- 
      downloadHandler(
        filename = "Resume Content.xlsx",
        content = function(file){
          write_resumeContent(
            filename_output = file,
            full_name = contact$full_name(),
            email = contact$email(),
            github_name = contact$github(),
            linkedin_name = contact$linkedin(),
            phone = contact$phone_number(),
            school_name = c(education_1$name(), 
                            education_2$name(), 
                            education_3$name(), 
                            education_4$name(), 
                            education_5$name()),
            degree = c(education_1$degree(), 
                       education_2$degree(), 
                       education_3$degree(), 
                       education_4$degree(), 
                       education_5$degree()),
            minor = c(education_1$minor(), 
                      education_2$minor(), 
                      education_3$minor(), 
                      education_4$minor(), 
                      education_5$minor()),
            city_state_education = c(education_1$city_state(), 
                                     education_2$city_state(), 
                                     education_3$city_state(), 
                                     education_4$city_state(), 
                                     education_5$city_state()),
            grad_date = c(education_1$grad_date(), 
                          education_2$grad_date(), 
                          education_3$grad_date(), 
                          education_4$grad_date(), 
                          education_5$grad_date()),
            job_title = c(experience_1$title(), 
                          experience_2$title(), 
                          experience_3$title(), 
                          experience_4$title(), 
                          experience_5$title(),
                          experience_6$title()),
            company = c(experience_1$company(), 
                        experience_2$company(), 
                        experience_3$company(), 
                        experience_4$company(), 
                        experience_5$company(),
                        experience_6$company()),
            city_state_experience = c(experience_1$city_state(), 
                                      experience_2$city_state(), 
                                      experience_3$city_state(), 
                                      experience_4$city_state(), 
                                      experience_5$city_state(),
                                      experience_6$city_state()),
            start_date_experience = c(experience_1$date_start(), 
                                      experience_2$date_start(), 
                                      experience_3$date_start(), 
                                      experience_4$date_start(), 
                                      experience_5$date_start(),
                                      experience_6$date_start()),
            end_date_experience = c(experience_1$date_end(), 
                                    experience_2$date_end(), 
                                    experience_3$date_end(), 
                                    experience_4$date_end(), 
                                    experience_5$date_end(),
                                    experience_6$date_end()),
            bp_1 = c(experience_1$bullet1(), 
                     experience_2$bullet1(), 
                     experience_3$bullet1(), 
                     experience_4$bullet1(), 
                     experience_5$bullet1(),
                     experience_6$bullet1()),
            bp_2 = c(experience_1$bullet2(), 
                     experience_2$bullet2(), 
                     experience_3$bullet2(), 
                     experience_4$bullet2(), 
                     experience_5$bullet2(),
                     experience_6$bullet2()),
            bp_3 = c(experience_1$bullet3(), 
                     experience_2$bullet3(), 
                     experience_3$bullet3(), 
                     experience_4$bullet3(), 
                     experience_5$bullet3(),
                     experience_6$bullet3()),
            bp_4 = c(experience_1$bullet4(), 
                     experience_2$bullet4(), 
                     experience_3$bullet4(), 
                     experience_4$bullet4(), 
                     experience_5$bullet4(),
                     experience_6$bullet4()),
            bp_5 = c(experience_1$bullet5(), 
                     experience_2$bullet5(), 
                     experience_3$bullet5(), 
                     experience_4$bullet5(), 
                     experience_5$bullet5(),
                     experience_6$bullet5()),
            bp_6 = c(experience_1$bullet6(), 
                     experience_2$bullet6(), 
                     experience_3$bullet6(), 
                     experience_4$bullet6(), 
                     experience_5$bullet6(),
                     experience_6$bullet6()),
            resume_objective = objective$objective(),
            skill_name = c(skills_1$skill(), 
                           skills_2$skill(), 
                           skills_3$skill(), 
                           skills_4$skill(), 
                           skills_5$skill(),
                           skills_6$skill()),
            skill_description = c(skills_1$description(), 
                                  skills_2$description(), 
                                  skills_3$description(), 
                                  skills_4$description(), 
                                  skills_5$description(),
                                  skills_6$description()))
        }
      )
 
  })
}
    
## To be copied in the UI
# mod_survey_download_templateFilled_ui("survey_download_templateFilled_1")
    
## To be copied in the server
# mod_survey_download_templateFilled_server("survey_download_templateFilled_1",
#                                           id, 
#                                           contact, 
#                                           education,
#                                           experience,
#                                           objective,
#                                           skills)
