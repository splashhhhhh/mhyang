library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(ggplot2)

shinyUI(dashboardPage(
    
    dashboardHeader(title = "Muhan Yang", titleWidth = 230, disable = FALSE,
                    tags$li(class = "dropdown", tags$a(href = "https://twitter.com/mhyang211", icon("twitter"), "Twitter", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/mhyang211", icon("linkedin"), "LinkedIn", target = "_blank")),
                    tags$li(class = "dropdown", tags$a(href = "https://github.com/splashhhhhh", icon("github"), "GitHub", target = "_blank"))
                    ),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem(text = "About", tabName = "about", icon = icon("bullseye")),
            menuItem(text = "Education", tabName = "edu", icon = icon("brush")),
            menuItem(text = "Research", tabName = "research", icon = icon("flag"),  
                     menuSubItem("Projects", tabName = "exp"),
                     menuSubItem("Experiences", tabName = "proj")),
            menuItem(text = "Misc.", tabName = "misc", icon = icon("heart")),
            menuItem(text = "CV", tabName = "cv", icon = icon("code"))
        )
    ),
    
    dashboardBody(
        tabItems(
             tabItem(tabName = "about", uiOutput("indexpage")),
             
             tabItem(tabName = "edu", fluidRow(
                 box(title = "Updates", width = 9, uiOutput("edu"),
                     status = "danger", solidHeader = T),
                 box(title = "My Office Hours", width = 7, uiOutput("ofappoint"),
                     status = "warning", solidHeader = T, collapsible = T),
                 box(title = "Current Classes", width = 5, tableOutput("curclass"),
                     status = "primary", solidHeader = T, collapsible = T),
                 box(title = "Past Classes", width = 9, dataTableOutput("pastclass"),
                     status = "success", solidHeader = T, collapsible = T)
             )),
             
             tabItem(tabName = "exp", uiOutput("exppage")),
             
             tabItem(tabName = "proj", uiOutput("projpage")),
             
             tabItem(tabName = "misc", 
                     fluidRow(
                         box(width = 8, title = "Media Center", status = "success", solidHeader = T, collapsible = T, collapsed = T,
                             tags$iframe(width="630", height="370", src="https://youtube.com/embed/zZffa_Z_Cxs", frameborder="1", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA))
                     ),
                     fluidRow(
                         box(width = 6, title = "Draw the histogram!", status = "danger", solidHeader = T, collapsible = T,
                             fileInput("file", "Upload the dataset (please make sure that each column variable is continuous)"),
                             uiOutput("histui")
                             )
                             
                     )),
             
             tabItem(tabName = "cv", tags$iframe(style = "height: 1100px; width: 100%; scrolling = yes",
                                                 src = "Muhan_Yang_CV_0824.pdf"))

        )

    )
    
))