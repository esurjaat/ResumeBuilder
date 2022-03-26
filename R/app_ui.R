# APP UI ====
#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic 
    dashboardPage(
      # HEADER ====
      dashboardHeader(title = "Resume Builder"),
      # SIDEBAR ====
      dashboardSidebar(
        sidebarMenu(
          menuItem("About", tabName = "about", icon = icon("info-sign", lib = "glyphicon")),
          menuItem("Resume", tabName = "resume", icon = icon("th", lib = "glyphicon"),
            menuSubItem("Inputs", tabName = "resume_inputs", icon = icon("pencil", lib = "glyphicon")),
            menuSubItem("Build", tabName = "resume_build", icon = icon("list-alt", lib = "glyphicon")))
          )),
      # BODY ====
      dashboardBody(
        tabItems(
          ## TAB: About ====
          tabItem(tabName = "about",
                  includeMarkdown("R/About.md")),
          ## TAB: Resume > Inputs ====
          tabItem(tabName = "resume_inputs",
                  fluidRow(
                    column(width = 3,
                           downloadButton("template_empty", 
                                          label = "Download Empty Template (.xlsx)")
                           ),
                    column(width = 3,
                           downloadButton("template_filled",
                                          label = "Download Survey as Template (.xlsx)"))
                  ),
                  br(),
                  fluidRow(
                    box(
                      title = "Contact",
                      width = 3,
                      solidHeader = FALSE,
                      status = "primary",
                      mod_survey_inputs_contact_ui("survey_inputs_contact_1")
                    ),
                    box(
                      title = "Education",
                      width = 3,
                      solidHeader = FALSE,
                      status = "primary",
                      mod_survey_inputs_education_ui("survey_inputs_education_1")
                    ),
                    column(
                      width = 6,
                      box(
                        title = "Objective",
                        width = NULL,
                        solidHeader = FALSE,
                        status = "primary",
                        mod_survey_inputs_objective_ui("survey_inputs_objective_1")
                      ),
                      tabBox(
                        title = "Skills",
                        width = NULL,
                        height = "272px",
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 1),
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 2),
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 3),
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 4),
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 5),
                        skills_tabPanel(id = "survey_inputs_experience",
                                        number = 6),
                      )
                    ),
                    tabBox(title = "Professional Experience",
                           width = 12,
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 1),
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 2),
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 3),
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 4),
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 5),
                           experience_tabPanel(id = "survey_inputs_experience", 
                                               number = 6),
                           )
                  )),
          ## TAB: Resume > Build ====
          tabItem(tabName = "resume_build",
                  fluidRow(
                    column(width = 4),
                    box(title = "Build Parameters",
                        width = 4,
                        height = "190px",
                        status = "primary",
                        solidHeader = TRUE,
                        column(
                          width = 6,
                          radioButtons(
                            "build_from",
                            label = "Build From:",
                            choices = c("Template", "Survey"),
                            selected = "Template"
                          )
                        ), 
                        column(
                          width = 6,
                          downloadButton("generate_resume",
                                         label = "Generate Resume"),
                          br(),
                          br(),
                          conditionalPanel(
                            condition = "input.build_from=='Template'",
                            fileInput("upload_template",
                                      label = "Upload Template")
                          ),
                          conditionalPanel(
                            condition = "input.build_from=='Survey'"
                            )
                        )
                    ),
                    column(width = 4)
                    )
                  )
        )
      )
    )
  )
}

# EXTERNAL RESOURCES ====
#' Add external Resources to the Application 
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'ResumeBuilder'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

