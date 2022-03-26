
#' read_resumeContent 
#'
#' @description A utils function
#'
#' @return The return value, if any, from executing the utility.
#'
#' @noRd
read_resumeContent <- function(file) {
  # Get Sheet Names
  sheet_names <- readxl::excel_sheets(path = file)
  
  # Read Each Sheet
  variables <-  
    map(.x = sheet_names,
        .f = function(x) {
          readxl::read_xlsx(path = file, sheet = x)
        }) %>% 
    purrr::set_names(sheet_names)
  
  variables$Experience = variables$Experience %>% arrange(desc(To))
  
  github_name <- 
  
  # Analyze
    full_name <- variables$Contact %>% filter(Field == "Full Name") %>% pull(Value)
    email <- variables$Contact %>% filter(Field == "Email") %>% pull(Value)
    phone <- variables$Contact %>% filter(Field == "Phone Number") %>% pull(Value)
    github_name <- variables$Contact %>% filter(Field == "Github") %>% pull(Value)
    github_link <- paste("https:://", github_name)
    linkedin_name <- variables$Contact %>% filter(Field == "LinkedIn") %>% pull(Value)
    linkedin_link <- paste("https:://", linkedin_name)
    blurb <- variables$Additional %>% filter(Field == "Overview") %>% pull(Value)
    skills_descriptors <-
      if (nrow(variables$Skills > 0)) {
        pmap(
          .l = list(
            x = variables$Skills$Skill,
            y = variables$Skills$Description
          ),
          .f = function(x, y) {
            paste0("- **", x, "** - ", y, "\n\n")
          }
        ) %>%
          unlist() %>%
          paste(collapse = "")
      } else {
        NA
      }
    
    skills_noDescriptors <-
      if (nrow(variables$Skills > 0)) {
        pmap(
          .l = list(x = variables$Skills$Skill),
          .f = function(x, y) {
            paste0("- **", x, "**\n\n")
          }
        ) %>%
          unlist() %>%
          paste(collapse = "")
      } else {
        NA
      }
    
    education <-
      pmap(
        .l =
          list(
            name = variables$Education$Name,
            degree = variables$Education$Degree,
            minor = variables$Education$Minor,
            where = variables$Education$Where,
            grad = variables$Education$`Graduation Date`
          ),
        .f = function(name, degree, minor, where, grad) {
          paste(
            paste0("### ", name),
            degree,
            where,
            paste0("Grad Date:", ymd(grad) %>% format.Date(format = "%b '%y")),
            if (!is.na(minor)) {
              paste0("Minored in ", minor)
            },
            sep = "\n\n"
          )
        }
      ) %>%
      unlist() %>%
      paste0(collapse = "")
    
    professional <-
      pmap(
        .l =
          list(
            title = variables$Experience$Title,
            company = variables$Experience$Company,
            where = variables$Experience$Where,
            from = variables$Experience$From,
            to = variables$Experience$To,
            bp1 = variables$Experience$`Bullet Point 1`,
            bp2 = variables$Experience$`Bullet Point 2`,
            bp3 = variables$Experience$`Bullet Point 3`,
            bp4 = variables$Experience$`Bullet Point 4`,
            bp5 = variables$Experience$`Bullet Point 5`,
            bp6 = variables$Experience$`Bullet Point 6`
          ),
        .f = function(title,
                      company,
                      where,
                      from,
                      to,
                      bp1,
                      bp2,
                      bp3,
                      bp4,
                      bp5,
                      bp6) {
          paste(
            paste0("### ", title),
            company,
            where,
            paste(year(from),
                  year(to),
                  sep = " - "),
            paste0(
              "::: consice\n",
              paste0("- ", bp1, "\n"),
              if (!is.na(bp2)) {
                paste0("- ", bp2, "\n")
              },
              if (!is.na(bp3)) {
                paste0("- ", bp3, "\n")
              },
              if (!is.na(bp4)) {
                paste0("- ", bp4, "\n")
              },
              if (!is.na(bp5)) {
                paste0("- ", bp5, "\n")
              },
              if (!is.na(bp6)) {
                paste0("- ", bp6, "\n")
              },
              ":::\n\n"
            ),
            sep = "\n\n"
          )
        }
      ) %>%
      unlist() %>%
      paste(collapse = "")
  
  # Output
  list(full_name = full_name,
       email = email,
       phone = phone,
       github_name = github_name,
       github_link = github_link,
       linkedin_name = linkedin_name,
       linkedin_link = linkedin_link,
       blurb = blurb,
       skills_descriptors = skills_descriptors,
       skills_noDescriptors = skills_noDescriptors,
       education = education,
       professional = professional)
}