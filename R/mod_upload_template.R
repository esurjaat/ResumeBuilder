#' upload_template UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_upload_template_ui <- function(id){
  ns <- NS(id)
  tagList(
    fileInput(ns("upload_template"),
              label = "Upload Template")
  )
}
    
#' upload_template Server Functions
#'
#' @noRd 
mod_upload_template_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    
    file <- reactive({ input$upload_template })
      
    return(
      list(
        input = reactive({ input$upload_template }),
        name = reactive({ file()$name}),
        filepath = reactive({ file()$datapath }),
        resume_content = reactive({ 
          file()$datapath %>% 
            read_resumeContent()
            })
      )
    )
 
  })
}
    
## To be copied in the UI
# mod_upload_template_ui("upload_template_1")
    
## To be copied in the server
# mod_upload_template_server("upload_template_1")
