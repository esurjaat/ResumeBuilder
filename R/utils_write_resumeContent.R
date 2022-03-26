#' write_resumeContent 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
write_resumeContent <- function(filename_output,
                                full_name,
                                email,
                                github_name,
                                linkedin_name,
                                phone,
                                school_name,
                                degree,
                                minor,
                                city_state_education,
                                grad_date,
                                job_title,
                                company,
                                city_state_experience,
                                start_date_experience,
                                end_date_experience,
                                bp_1,
                                bp_2,
                                bp_3,
                                bp_4,
                                bp_5,
                                bp_6,
                                resume_objective,
                                skill_name,
                                skill_description) {
  # Create Tables ====
  ## Contact ===
  contact <- 
    tribble(
      ~Field, ~Value,
      "Full Name", full_name,
      "Email", email,
      "Github", github_name,
      "LinkedIn", linkedin_name,
      "Phone Number", phone
    )
  
  education <- 
    tibble(
      Name = school_name,
      Degree = degree,
      Minor = minor,
      Where = city_state_education,
      `Graduation Date` = grad_date
    )
  
  experience <- 
    tibble(
      Title = job_title,
      Company = company,
      Where = city_state_experience,
      From = start_date_experience,
      To = end_date_experience,
      `Bullet Point 1` = bp_1,
      `Bullet Point 2` = bp_2,
      `Bullet Point 3` = bp_3,
      `Bullet Point 4` = bp_4,
      `Bullet Point 5` = bp_5,
      `Bullet Point 6` = bp_6,
    )
  
  
  additional <- 
    tribble(
      ~Field, ~Value,
      "Overview", resume_objective,
    )
  
  skills <- 
    tibble(
      Skill = skill_name,
      Description = skill_description
      )
  
  wb <- createWorkbook()
  addWorksheet(wb = wb, sheetName = "Contact")
  writeDataTable(wb = wb, sheet = "Contact", x = contact)
  addWorksheet(wb = wb, sheetName = "Education")
  writeDataTable(wb = wb, sheet = "Education", x = education)
  addWorksheet(wb = wb, sheetName = "Experience")
  writeDataTable(wb = wb, sheet = "Experience", x = experience)
  addWorksheet(wb = wb, sheetName = "Additional")
  writeDataTable(wb = wb, sheet = "Additional", x = additional)
  addWorksheet(wb = wb, sheetName = "Skills")
  writeDataTable(wb = wb, sheet = "Skills", x = skills)
  saveWorkbook(wb = wb, file = filename_output)

}