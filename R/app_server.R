#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  
  output$generate_resume <- downloadHandler(
    filename = "Resume2.pdf",
    content = function(file) {
      tempfilepath <- file.path(tempdir(), "ResumeFinal.pdf")
      tempReport <- file.path(tempdir(), "ShinyResume.Rmd")
      tempExcel <- file.path(tempdir(), "Resume Content 2.xlsx")
      file.copy("R/ShinyResume.Rmd", tempReport, overwrite = TRUE)
      file.copy("data/Resume Content 2.xlsx", tempExcel, overwrite = TRUE)
      
      
      params <- list(source_filename = tempExcel,
                     skill_descriptors = FALSE)
      
      
      pagedown::chrome_print(rmarkdown::render(
        input = tempReport,
        params = params,
        envir = new.env(parent = globalenv())
      ),
      output = file)
    }
  )
}
