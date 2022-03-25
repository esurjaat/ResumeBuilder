#' build_preview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_build_preview_ui <- function(id){
  ns <- NS(id)
  tagList(
    
  )
}
    
#' build_preview Server Functions
#'
#' @noRd 
mod_build_preview_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_build_preview_ui("build_preview_1")
    
## To be copied in the server
# mod_build_preview_server("build_preview_1")
