library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(shinydashboardPlus)
library(ggplot2)
library(bslib)
library(DT)
library(reporter)

shinyServer(function(input, output, session) {
    
    # index page ----
    output$indexpage <- renderUI({
      tagList(
        tags$head(
          tags$style(HTML("
      @keyframes type {
        from { width: 0; }
        to { width: 100%; }
      }

      @keyframes blink-caret {
        from, to { border-color: transparent; }
        50% { border-color: black; }
      }

      .typewriter {
        display: inline-block;
        font-family: 'PingFang TC', sans-serif;
        font-size: 30px;
        white-space: nowrap;
        overflow: hidden;
        border-right: 0.09em solid black; /* Cursor effect */
        animation:
          type 3.5s steps(40, end), infinite,
          blink-caret .75s step-end infinite;
      }
    "))
        ),
        sidebarLayout(position = "left",
            sidebarPanel(width = 4,
                         style = "border: 2px solid #927fbf; padding: 10px; border-radius: 10px;",
                tags$img(src = "headshot.jpg", height = 240, width = 180, 
                         style="display: block; margin-left: auto; margin-right: auto;"),
                tags$div(
                  style = "display: flex; justify-content: center",
                h1(
                   tags$b(class = "typewriter", style = "font-size: 28px; font-family: 'PingFang TC', sans-serif",
                          "Muhan Yang | 楊 慕涵"))),
                h4(style = "text-align: center;", "Pronunciation: 'm-oo-h-uh-n'"),
                
                hr(),
                
                h3(tags$b("Contact")),
                h4("Email: "), 
                tags$p(HTML('<a href="mailto:muhan211@student.ubc.ca" style="color: #bc87b8;text-decoration: underline;">muhan211@student.ubc.ca</a>')),
                tags$p(HTML('<a href="mailto:muhanyangpsych@gmail.com" style="color: #bc87b8;text-decoration: underline;">muhanyangpsych@gmail.com</a>')),
                br(),
                h4("Phone: (604) 727-0895", tags$a(href = "https://muhanyang.shinyapps.io/quantpsych/_w_cdf5e54e/Muhan_Yang_CV_092224.pdf", 
                                                   icon("file"), 
                                                   tags$b(tags$u("CV")), 
                                                   style = "float: right; color: #927fbf", 
                                                   target = "_blank"))

            ),
            
            mainPanel(
                h4("Hi there, welcome to my website!"),
                br(),
                h4("Born and raised in Beijing, China, I am a fourth-year ", tags$b("Honours Psychology"), "student minoring in ", tags$b("Data Science"), " at the ", tags$b("University of British Columbia (UBC)"), "in Vancouver, Canada."),
                br(),
                h4("I aspire to be a ", tags$em("quantitative psychologist / methodologist"), "and my research interest largely lies in the ", tags$b("longitudinal data analysis"), " in methodology, including ", 
                   tags$b("Multilevel Modelling (MLM)"), " and ", tags$b("Structural Equation Modelling (SEM)"), ". One of my most recent interests is learning to build Shiny App and develop R packages."),
                br(),
                h4("Currently, I'm actively holding two quantitative methods research assistant positions at UBC Department of Psychology, doing an independent project on ", 
                   tags$b("RI-CLPM power analysis"), " at", 
                   HTML('<a href="https://ubcsemlab.com/" target="_blank " style="color: #bc87b8;text-decoration: underline;">UBC SEM Lab</a>'), 
                   "under the guidance of ",
                   HTML('<a href="https://psych.ubc.ca/profile/victoria-savalei/" target="_blank" style="color: #927fbf;text-decoration: underline;">Dr. Victoria Savalei</a>'),", ",
                   "and my fourth-year honours thesis on the ", 
                   tags$b("Standardized Mean Differences in MLM"), " at ", 
                   HTML('<a href="https://rights.psych.ubc.ca/" target="_blank" style="color: #bc87b8;text-decoration: underline;">the Rights Lab</a>'), ", under the supervision of ",
                   HTML('<a href ="https://psych.ubc.ca/profile/jason-rights/" target="_blank" style="color: #927fbf;text-decoration: underline;">Dr. Jason Rights</a>'),
                   "and his Ph.D. student Yingchi Guo. I am deeply grateful to all three of them, whose invaluable mentorship and encouragement constantly inspire me to explore the fascinating world of quantitative psychology."),
                br(),
                h4("Beyond my enthusiasm for research, music is an important part of my life. I enjoy playing Guzheng (a Chinese traditional string instrument) by arranging modern songs, and covering mandopop, cantopop, and western pop with Ukulele play-along. I am also a big fan of board games and Sudoku, so you may find me participating in Sudoku contests in mainland China!"),
                br()
              
            )
        )
      )
    })
    
    
    # projects page ----
    output$projpage <- renderUI({
      tagList(
        tags$head(
          tags$style(HTML("
                #thesistable tbody tr.selected, #pretable tbody tr.selected {
                    background-color: #77628e !important; /* Change background color */
                    color: white !important;              /* Change text color */
                }
            "))
        ),
        tabsetPanel(
            tabPanel(tags$b("Theses"), dataTableOutput("thesistable")),
            tabPanel(tags$b("Posters"), dataTableOutput("pretable"))
          )
        )
    })
    
    output$thesistable <- renderDataTable({
        thesis$Link[2] <- HTML('<a href="https://drive.google.com/file/d/17H6hAsh4fBSuZKm65J9nd1_12kuU0fAt/view?usp=sharing" target="_blank" style="color: #bc87b8;text-decoration: underline;">Google Drive (pdf)</a>')
        datatable(thesis, escape = FALSE,options = list(pageLength = 10, autoWidth = TRUE, scrollX = TRUE, responsive = TRUE))
    })
    
    output$pretable <- renderDataTable({
        pre$Link[1] <- HTML('<a href="https://drive.google.com/file/d/1ny9-4Bb5uyDjiNh17xXtPNCarU5AmqlP/view?usp=sharing" target="_blank" style="color: #bc87b8;text-decoration: underline;">Google Drive (pdf)</a>')
        pre$Link[2] <- HTML('<a href="https://drive.google.com/file/d/1ekqUvO32ERia0RgSPU6xBFMu78e-0N3z/view?usp=sharing" target="_blank" style="color: #bc87b8;text-decoration: underline;">Google Drive (pdf)</a>')
        datatable(pre, escape = FALSE,options = list(pageLength = 10, autoWidth = TRUE, scrollX = TRUE, responsive = TRUE))
    })
    
    
    # experience page ----
    output$exppage <- renderUI({
      bulletPoints1 <- c("Designing and leading the independent project examining Random Intercept Cross-Lagged Panel Model (RI-CLPM) power analysis via simulation: conducted a literature review on the RI-CLPM simulation and a report of extending the simulation analysis in Mulder (2023) to other parameters and conditions")
      
      # Section 2: Text lines followed by bullet points
      bulletPoints2 <- c("Facilitating project examining the property of Intra-class Correlations (ICCs) in MLM, 
                         conducting literature review over 100+ articles to map out the current utilization and report standards of ICCs in empirical studies, 
                         and provided an empirical example of interpreting newly proposed ICCs", 
                         "Conducted literature review for the current advanced of R-squared adjustment methods for MLM, 
                         and proofread the manuscript")
      
      # Section 3: Text lines followed by bullet points
      bulletPoints3 <- c("Entered and cleaned data in the Children’s Integrity project, 
                         and mentored junior lab members to clean data using SPSS and R", 
                         "Managed parents contacting, study sessions scheduling, consent forms collection, 
                         and session video recordings on Globus")
      
      # Section 4: Text lines followed by bullet points
      bulletPoints4 <- c("Conducted ∼80 sessions of the Trier Social Stress Test (TSST) interview, parent re-consent, 
                         and medication record check-up and entry in Teen Studies project and TSST Simulated Online Interview project, 
                         including saliva sample collection", 
                         "Assisted graduate students with mock phone screen practice using DSM-V")

      tagList(tags$head(
        tags$style(HTML("
      /* Customize the header gradient for each box */
      #box1 .box-header {
        background: linear-gradient(60deg, #bc87b8, #7a4a7d) !important;
        color: white !important;
      }
      #box2 .box-header {
        background: linear-gradient(60deg, #bdaacf, #77628e) !important;
        color: white !important;
      }
      #box3 .box-header {
        background: linear-gradient(60deg, #a5b7d6, #6a819a) !important;
        color: white !important;
      }
      #box4 .box-header {
        background: linear-gradient(60deg, #778cbb, #4a5e85) !important;
        color: white !important;
      }
    "))
      ),
        
        fluidRow(
        # First box
        box(
          id = "box1",
          title = "Research Assistant @ UBC SEM Lab | PI: Victoria Savalei",
          # status = "primary",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          # style = "background-color: #FF6347; color: white;",
          width = 12,
          tags$h4(
            tags$p("January 2024 - Present")),
          tags$ul(
            lapply(bulletPoints1, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        ),
        
        # Second box
        box(
          id = "box2",
          title = "Fourth-year Honours Thesis Student & Research Assistant @ The Rights Lab | PI: Jason Rights",
          # status = "info",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          width = 12,
          tags$h4(
            tags$p("September 2023 - Present")),
          tags$ul(
            lapply(bulletPoints2, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        ),
        
        # Third box
        box(
          id = "box3",
          title = "Third-year Honours Thesis Student & Research Assistant @ Child and Teen Studies Lab | PI: Catherine Ann Cameron",
          # status = "success",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          width = 12,
          tags$h4(
            tags$p("September 2023 - June 2024")),
          tags$ul(
            lapply(bulletPoints3, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        ),
        
        # Fourth box
        box(
          id = "box4",
          title = "Research Assistant @ Social Health Lab | PI: PI: Frances Chen",
          # status = "warning",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          width = 12,
          tags$h4(
            tags$p("September 2022 - September 2023")),
          tags$ul(
            lapply(bulletPoints4, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        )
      )
      )
    })
    
    # education page ----
    output$edupage <- renderUI({
      undergrad <- c("B.A. (Hons.), The University of British Columbia ",
                     "2021 - 2025",
                     "Major: Psychology 🧠 | Minor: Data Science 💻",
                     "Quant Psych GPA: 92/100 | Psych Major GPA: 86.5/100",
                     "Quant Psych Coursework: ",
                     "Other Relevant Coursework (Math, Stats, CS, DS): ")
      courses1 <- c("PSYC 303 - Tests and Measurements",
                   "PSYC 359 - Advanced Research Methods in Behavioural Sciences",
                   "PSYC 417 - Special Topics in Psychology: Applied Regression Analysis",
                   "PSYC 546J - Seminar in Psychological Problems: Multilevel Model (graduate course)",
                   "PSYC 546Y - Seminar in Psychological Problems: Structural Equation Model I (graduate course; self-learned through 2021W materials)")
      courses2 <- c(
                   "STAT 201 - Statistical Inference for Data Science",
                   "STAT 301 - Statistical Modelling for Data Science",
                   "MATH 221 - Matrix Algebra",
                   "DSCI 320 - Visualization for Data Science",
                   "CPSC 330 - Applied Machine Learning",
                   "CPSC 368  - Databases in Data Science (ongoing)")
      
      tagList(
          # Picture in top right corner
        tags$div(style = "display: flex; flex-wrap: wrap; justify-content: space-between; align-items: center;",
                 # Text
                 tags$div(
                   tags$h4(tags$span(style = "font-size: 19.5px;",
                                     tags$b(tags$span(style = "color: #7a4a7d", undergrad[1])),
                                     tags$em(style = "margin-left: 50px;", undergrad[2]),
                                     tags$p(style = "font-size: 18px; color: #bc87b8", undergrad[3]),
                   ))
                 ),
                 # Image
                 tags$img(src = "ubclogo.png", width = "200px", style = "margin-right: 20px;"),
        ),
          tags$h4(tags$b(undergrad[4])),
          tags$h4(style = "font-size: 18px;",tags$u(undergrad[5])),
        # courses
        tags$h4(style = "font-size: 18px;", tags$ul(class = "custom-bullets",
          lapply(courses1, function(point) {
            tags$li(point)
          })
        )
      ),
        tags$h4(style = "font-size: 18px;", tags$u(undergrad[6])),
      tags$h4(style = "font-size: 18px;", tags$ul(class = "custom-bullets",
                      lapply(courses2, function(point) {
                        tags$li(point)
                      })
      ))
      )
    })
    
    

    # activity page ----
    output$actpage <- renderUI({
      textLines1 <- c(
        "youCode@UBC: 24-Hour Hackathon | ",
        "UX/UI Designer",
        "Apr. 6-7, 2024"
      )
      bulletPoints1 <- c("Implemented UX/UI design in the team of 4 by creating an interactive and functional prototype with a campus map, using Figma and Procreate", 
                         "Built a phone app for locating outdoor activities on campus map with reward features",
                         "Maintained the overall version control of the team via Git")
      
      
      # Section 2: Text lines followed by bullet points
      textLines2 <- c(
        "Mood Psychology Mental Health Support Group UBC Branch | ",
        "Peer Support Mentor",
        "Jul. 2022 – May 2023"
      )
      bulletPoints2 <- c("Attained peer support skills and ethics through 5-week online peer support training", 
                         "Offered weekly 1-2h peer support service to mentees", 
                         "Actively discussed advanced counselling skills with supervisor and other mentors bimonthly")

      tagList(tags$head(
        # Custom styles for the box headers
        tags$style(HTML("
      /* Customize the header color for each box */
      #box1 .box-header {
        background-color: #bc87b8 !important;
        color: white !important;
      }
      #box2 .box-header {
        background-color: #bdaacf !important;
        color: white !important;
      }"))),
      
      fluidRow(
        # First box
        box(
          id = "box1",
          title = "youCode@UBC: 24-Hour Hackathon | UX/UI Designer",
          # status = "primary",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          # color = "#605ca8",
          width = 12,
          tags$h4(
            tags$p("Apr. 6-7, 2024")),
          tags$ul(
            lapply(bulletPoints1, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        ),
        
        # Second box
        box(
          id = "box2",
          title = "Mood Psychology Mental Health Support Group UBC Branch | Peer Support Mentor",
          # status = "info",
          solidHeader = TRUE,
          headerBorder = TRUE,
          collapsible = TRUE,
          width = 12,
          tags$h4(
            tags$p("Jul. 2022 – May 2023")),
          tags$ul(
            lapply(bulletPoints2, function(point) {
              tags$li(style = "font-size: 16px;", point)
            })
          )
        )
      ))
    })
    

    # awards page ----
    output$awardpage <- renderUI({
      tagList(
      tags$h4(
        tags$b(style = "color: #7a4a7d", "Work Learn International Undergraduate Research Award (WLIURA)"),
        tags$p(tags$em(style = "color: #77628e", "May - Aug. 2024")),
        tags$p("$8,500 awarded to international undergraduates to work full-time (35h/week) on research projects under faculty’s supervision")),
      tags$br(),
      
      tags$h4(
        tags$b(style = "color: #7a4a7d", "Dean’s List"),
        tags$p(tags$em(style = "color: #77628e", "2022 - 2023; 2023 - 2024")),
        tags$p("Awarded by UBC Faculty of Arts to undergraduates with a grade average of 85/100 (A) per year")),
      tags$br(),
      
      tags$h4(
        tags$b(style = "color: #7a4a7d", "Honourable Mention"),
        tags$p(tags$em(style = "color: #77628e", "Apr. 2024")),
        tags$p("Awarded by youCode@UBC Hackathon to teams ranking directly subsequent top 3 winners"))
      )
    })
    
    # skills page ----
    output$skillpage <- renderUI({
      tagList(
        tags$h4(
          tags$b(style = "color: #7a4a7d", "R Tools & Packages"),
          tags$p(style = "margin-left: 30px", "Shiny, Rmarkdown, lavaan, semTools, simsem, lme4, psych, Tidyverse, ggplot2, dplyr")
        ),
        tags$br(),

        tags$h4(
          tags$b(style = "color: #7a4a7d", "Python Tools & Packages"),
          tags$p(style = "margin-left: 30px", "Pandas, Matplotlib, NumPy, scikit-learn, Altair, Natural Language Toolkit (NLTK), spaCy")
        ),
        tags$br(),

        tags$h4(
          tags$b(style = "color: #7a4a7d", "Other Software & Tools"),
          tags$p(style = "margin-left: 30px", "SPSS, LaTeX, Git, Jupyter, Figma, Qualtrics, Globus")
        ),
        tags$br(),

        tags$h4(
          tags$b(style = "color: #4a5e85", "Soft Skills for Research"),
          tags$p(style = "margin-left: 30px", "Literature Review, Academic Poster Design, UX/UI Design")
        ),
        tags$br(),

        tags$h4(
          tags$b(style = "color: #4a5e85", "Languages"),
          tags$p(style = "margin-left: 30px", "Fluent in Mandarin & English, Conversational in Cantonese")
        ),
        tags$br(),

        tags$h4(
          tags$b(style = "color: #4a5e85", "Hobbies"),
          tags$p(style = "margin-left: 30px", "Guzheng, Ukulele, Sudoku, Board Games, Music Arrangement, Audio Mixing")
        )
      )
    })
    

})