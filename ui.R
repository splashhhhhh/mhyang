library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(ggplot2)

shinyUI(dashboardPage(
    skin = "blue",
    dashboardHeader(title = tags$span(style = "font-weight: bold;", "Muhan Yang"), titleWidth = 230, disable = FALSE,
                    tags$li(class = "dropdown", tags$a(href = "https://twitter.com/mhyang211", icon("twitter"), "Twitter", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/mhyang211", icon("linkedin"), "LinkedIn", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://github.com/splashhhhhh", icon("github"), "GitHub", target = "_blank"))
                    ),
    
    dashboardSidebar(
      tags$style(
        HTML("
        /* Style the footer */
        .sidebar-footer {
          position: absolute;
          bottom: 0;
          width: 100%;
          text-align: center;
          padding: 5px;
          border-top: 0.5px solid #ddd;
          font-size: 11px; /* Smaller font size */
        }
      ")
      ),
        sidebarMenu(
            menuItem(text = "About Me", tabName = "about", icon = icon("star")),
            menuItem(text = "Education", tabName = "edu", icon = icon("user-graduate")),
            menuItem(text = "Research", tabName = "research", icon = icon("brain"),  
                     menuSubItem(" Projects", tabName = "proj"),
                     menuSubItem(" Experiences", tabName = "exp")),
            menuItem(text = "Misc.", tabName = "misc", icon = icon("heart")),
            menuItem(text = "CV", tabName = "cv", icon = icon("code")),
            tags$div(
              class = "sidebar-footer",
              HTML("Template adapted from © <a href='https://github.com/Xiaozhu-Zhang1998/website-using-shiny' target='_blank'>️Xiaozhu Zhang</a>")
            )
        )
    ),
    
    dashboardBody(
        tabItems(
             tabItem(tabName = "about", uiOutput("indexpage")),
             
             tabItem(tabName = "edu", uiOutput("edupage")),
             
             tabItem(tabName = "exp", uiOutput("exppage")),
             
             tabItem(tabName = "proj", uiOutput("projpage")),
             
             tabItem(tabName = "misc", uiOutput("miscpage")),
             
             tabItem(tabName = "cv", tags$iframe(style = "height: 1100px; width: 100%; scrolling = yes",
                                                 src = "Muhan_Yang_CV_0824.pdf"))

        )

    )
    
))