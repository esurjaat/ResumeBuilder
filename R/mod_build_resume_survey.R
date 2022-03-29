#' build_resume_survey UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_build_resume_survey_ui <- function(id){
  ns <- NS(id)
  tagList(
    downloadButton(ns("generate_resume_survey"),
                   label = "Generate Resume")
  )
}
    
#' build_resume_survey Server Functions
#'
#' @noRd 
mod_build_resume_survey_server <- function(id, 
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
                                           skills_6 = skills_6){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    # Gather Data ====
    ## Education ====
    education <- 
      reactive({
        tibble(
          name = c(education_1$name(), education_2$name(), 
                   education_3$name(), education_4$name()),
          degree = c(education_1$degree(), education_2$degree(),
                     education_3$degree(), education_4$degree()),
          minor = c(education_1$minor(), education_2$minor(),
                    education_3$minor(), education_4$minor()),
          city_state = c(education_1$city_state(), education_2$city_state(),
                         education_3$city_state(), education_4$city_state()),
          grad_date = c(education_1$grad_date(), education_2$grad_date(),
                        education_3$grad_date(), education_4$grad_date())
        ) %>% 
          mutate(across(.fns = function(x) {
            na_if(x, "")
          })) %>% 
          filter(!is.na(name))
      })
    
    ## Experience ====
    experience <- 
      reactive({
        tibble(
          title = c(experience_1$title(), experience_2$title(),
                    experience_3$title(), experience_4$title(),
                    experience_5$title(), experience_6$title()),
          company = c(experience_1$company(), experience_2$company(),
                      experience_3$company(), experience_4$company(),
                      experience_5$company(), experience_6$company()),
          city_state = c(experience_1$city_state(), experience_2$city_state(),
                         experience_3$city_state(), experience_4$city_state(),
                         experience_5$city_state(), experience_6$city_state()),
          date_start = c(experience_1$date_start(), experience_2$date_start(),
                         experience_3$date_start(), experience_4$date_start(),
                         experience_5$date_start(), experience_6$date_start()),
          date_end = c(experience_1$date_end(), experience_2$date_end(),
                       experience_3$date_end(), experience_4$date_end(),
                       experience_5$date_end(), experience_6$date_end()),
          bullet1 = c(experience_1$bullet1(), experience_2$bullet1(),
                      experience_3$bullet1(), experience_4$bullet1(),
                      experience_5$bullet1(), experience_6$bullet1()),
          bullet2 = c(experience_1$bullet2(), experience_2$bullet2(),
                      experience_3$bullet2(), experience_4$bullet2(),
                      experience_5$bullet2(), experience_6$bullet2()),
          bullet3 = c(experience_1$bullet3(), experience_2$bullet3(),
                      experience_3$bullet3(), experience_4$bullet3(),
                      experience_5$bullet3(), experience_6$bullet3()),
          bullet4 = c(experience_1$bullet4(), experience_2$bullet4(),
                      experience_3$bullet4(), experience_4$bullet4(),
                      experience_5$bullet4(), experience_6$bullet4()),
          bullet5 = c(experience_1$bullet5(), experience_2$bullet5(),
                      experience_3$bullet5(), experience_4$bullet5(),
                      experience_5$bullet5(), experience_6$bullet5()),
          bullet6 = c(experience_1$bullet6(), experience_2$bullet6(),
                      experience_3$bullet6(), experience_4$bullet6(),
                      experience_5$bullet6(), experience_6$bullet6())
        ) %>% 
          mutate(across(.fns = function(x) {
            na_if(x, "")
          })) %>% 
          filter(!is.na(title))
      })
    
    ## Skills ====
    skills <- 
      reactive({
        tibble(
          skill = c(skills_1$skill(), skills_2$skill(),
                    skills_3$skill(), skills_4$skill(),
                    skills_5$skill(), skills_6$skill()),
          description = c(skills_1$description(), skills_2$description(),
                          skills_3$description(), skills_4$description(),
                          skills_5$description(), skills_6$description())
        ) %>% 
          mutate(across(.fns = function(x) {
            na_if(x, "")
          })) %>% 
          filter(!is.na(skill))
      })
    
    
    # Generate ====
    output$generate_resume_survey <- 
      downloadHandler(
        filename = "Resume.pdf",
        content = function(file) {
          tempfilepath <- file.path(tempdir(), "ResumeFinal.pdf")
          tempReport <- file.path(tempdir(), "ShinyResume_Survey.Rmd")
          file.copy("R/ShinyResume_Survey.Rmd", tempReport, overwrite = TRUE)
          
          params <- list(full_name = contact$full_name(),
                         email = contact$email(),
                         phone = contact$phone_number(),
                         github_name = contact$github(),
                         linkedin_name = contact$linkedin(),
                         school_name = education()$name,
                         degree = education()$degree,
                         minor = education()$minor,
                         city_state_education = education()$city_state,
                         grad_date = education()$grad_date,
                         job_title = experience()$title,
                         company = experience()$company,
                         city_state_experience = experience()$city_state,
                         start_date_experience = experience()$date_start,
                         end_date_experience = experience()$date_end,
                         bp_1 = experience()$bullet1,
                         bp_2 = experience()$bullet2,
                         bp_3 = experience()$bullet3,
                         bp_4 = experience()$bullet4,
                         bp_5 = experience()$bullet5,
                         bp_6 = experience()$bullet6,
                         objective = objective$objective(),
                         skill_name = skills()$skill,
                         skill_description = skills()$description,
                         skill_descriptors = TRUE)
          
          pagedown::chrome_print(rmarkdown::render(
            input = tempReport,
            params = params,
            envir = new.env(parent = globalenv())
          ),
          output = file,
          async = TRUE,
          extra_args = c("--no-sandbox"))
        }
      )
 
  })
}
    
## To be copied in the UI
# mod_build_resume_survey_ui("build_resume_survey_1")
    
## To be copied in the server
# mod_build_resume_survey_server("build_resume_survey_1")
