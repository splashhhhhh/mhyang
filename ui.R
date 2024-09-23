library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(ggplot2)


shinyUI(dashboardPage(
    dashboardHeader(
      title = tags$span(style = "font-weight: bold; font-family: 'PingFang TC', sans-serif;", "Muhan Yang"), titleWidth = 230, disable = FALSE,
                    tags$li(class = "dropdown", tags$a(href = "https://muhanyang.shinyapps.io/quantpsych/_w_cdf5e54e/Muhan_Yang_CV_092224.pdf", icon("file"), "CV", target = "_blank")),
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
          tags$style(HTML("
                  body { 
                  line-height: 1.5; 
                  }
            ")),
            menuItem(text = "About Me", tabName = "about", icon = icon("star")),
            menuItem(text = "Education", tabName = "edu", icon = icon("user-graduate")),
            menuItem(text = "Research", tabName = "research", icon = icon("brain"),  
                     menuSubItem("Projects", tabName = "proj"),
                     menuSubItem("Experiences", tabName = "exp")),
            menuItem(text = "Misc.", tabName = "misc", icon = icon("heart"),
                     menuSubItem("Skills", tabName = "skills"),
                     menuSubItem("Awards", tabName = "awards"),
                     menuSubItem("Activities", tabName = "activities")),
            # menuItem(text = "CV", tabName = "cv", icon = icon("code")),
            tags$div(
              class = "sidebar-footer",
              HTML("Template adapted from © <a href='https://github.com/Xiaozhu-Zhang1998/website-using-shiny' target='_blank'>️Xiaozhu Zhang</a>")
            )
        )
    ),
    
    dashboardBody(
      tags$style(HTML("
      /* Adjust line spacing for all headers in the main content area */
        .content-wrapper h4 {
          line-height: 1.5; 
          font-size: 19px;
        }
        .content-wrapper p {
          line-height: 1.0; 
          font-size: 19px;
        }
        
      .custom-bullets li {
        margin-bottom: 5px !important;
      }
      
      /* Change the top-left corner (logo) color */
      .main-header .logo {
        background-color: #424874 !important; /* Change to your desired color */
      }

      /* Change the header color */
      .main-header .navbar {
        background-color: #424874 !important; /* Change to your desired color */
      }
      
      /* Change the sidebar background color */
      .skin-blue .main-sidebar {
        background-color: #453953;
      }
      
      /* Change sidebar dropdown menu background color */
      .skin-blue .sidebar-menu .treeview-menu {
        background-color: #453953 !important; /* Change dropdown background color */
      }

      /* Change the color of the items in the dropdown menu */
      .skin-blue .sidebar-menu .treeview-menu>li>a {
        color: #dcd6f7 !important; /* Dropdown text color */
      }
      
      /* Change the hover and active colors of sidebar menu items */
      .skin-blue .sidebar-menu>li.active>a, .skin-blue .sidebar-menu>li:hover>a {
        background-color: #a696c8;
      }
      
      /* Change the color of the vertical bar on the left of the sidebar menu items */
      .skin-blue .sidebar-menu>li>a {
        border-left: 3px solid transparent; /* Default border color */
      }
      .skin-blue .sidebar-menu>li>a:hover, 
      .skin-blue .sidebar-menu>li.active>a {
        border-left: 3px solid #c06c84 !important; /* Hover and active vertical bar color */
      }
      
      /* Change font color of sidebar sub-items on hover */
        .main-sidebar .sidebar .sidebar-menu .treeview-menu > li > a:hover {
          background-color: #927fbf; /* Light gray background on hover */
        }
      
      /* Change font color for tab panel titles */
        .nav-tabs > li > a {
          color: #77628e; /* Default color for tab panel titles */
        }
      
      .skin-blue .main-header .navbar .sidebar-toggle:hover {
          background-color: #a696c8;
        }
        
    ")),
      shiny::tags$head(
        tags$style(HTML('
            /* Change the background color of the entire dashboardBody */
            .content-wrapper {
              background-color: #d8e3e7; /* Light AliceBlue color, change this to your desired color */
            }
        ,')),
        tags$script(HTML(
          "
        document.addEventListener('DOMContentLoaded', function() {
          // Set the browser tab title
          document.title = 'Muhan Yang';
          
          // Set the favicon
          var link = document.createElement('link');
          link.rel = 'icon';
          link.type = 'image/x-icon';
          link.href = 'favicon.ico'; // Path to your favicon
          document.head.appendChild(link);
        });
        "
        ))
      ),
      tabItems(
        
             tabItem(tabName = "about", uiOutput("indexpage")),
             
             tabItem(tabName = "edu", uiOutput("edupage")),
             
             tabItem(tabName = "exp", uiOutput("exppage")),
             
             tabItem(tabName = "proj", uiOutput("projpage")),
             
             tabItem(tabName = "skills", uiOutput("skillpage")),
             
             tabItem(tabName = "awards", uiOutput("awardpage")),
             
             tabItem(tabName = "activities", uiOutput("actpage"))
# 
#              tabItem(tabName = "cv", tags$iframe(style = "height: 100vh; width: 100%; boarder: none;",
#                                                  src = "Muhan_Yang_CV_0915.pdf"))

        )

    )
    
))