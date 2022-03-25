#' render_resume 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
render_resume <- function(source_filename, 
                          skills_descriptors = TRUE){
  
  rmarkdown::render("R/Sample.Rmd",
                    params = 
                      list(
                        source_filename = source_filename,
                        skill_descriptors = skills_descriptors
                      )
                    )
  
}