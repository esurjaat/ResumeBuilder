#' build_resume_template UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_build_resume_template_ui <- function(id){
  ns <- NS(id)
  tagList(
    downloadButton(ns("generate_resume_template"),
                   label = "Generate Resume"),
    textOutput(ns("text"))
  )
}
    
#' build_resume_template Server Functions
#'
#' @noRd 
mod_build_resume_template_server <- function(id, template_upload){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    output$generate_resume_template <- 
      downloadHandler(
        filename = "Resume.pdf",
        content = function(file) {
          tempfilepath <- file.path(tempdir(), "ResumeFinal.pdf")
          tempReport <- file.path(tempdir(), "ShinyResume.Rmd")
          file.copy("R/ShinyResume.Rmd", tempReport, overwrite = TRUE)
          
          params <- list(source_filename = template_upload$filepath(),
                         skill_descriptors = FALSE)
          
          pagedown::chrome_print(rmarkdown::render(
            input = tempReport,
            params = params,
            envir = new.env(parent = globalenv())
          ),
          output = file)
        }
      )
 
    output$text <- 
      renderText({
        req(template_upload$input())
        template_upload$resume_content()$full_name
      })
    
    
  })
}
    
## To be copied in the UI
# mod_build_resume_template_ui("build_resume_template_1")
    
## To be copied in the server
# mod_build_resume_template_server("build_resume_template_1", template_upload)
