library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(ggplot2)
library(bslib)
library(DT)

shinyServer(function(input, output, session) {
    
    # index page ----
    output$indexpage <- renderUI({
        sidebarLayout(position = "left",
            sidebarPanel(width = 4,
                tags$img(src = "headshot.jpg", height = 240, width = 180, 
                         style="display: block; margin-left: auto; margin-right: auto;"),
                h1(style = "text-align: center;", tags$b(style = "font-size: 30px; font-family: 'Comic Sans MS', cursive",
                          "Muhan Yang | 杨慕涵")),
                h4(style = "text-align: center;", "Pronunciation: 'm-oo-h-uh-n'"),
                
                hr(),
                
                # h3(tags$b("Education")),
                # h4("B.A. (Hons), University of British Columbia, 2021 - 2025"),
                # h5("Major: Psychology"),
                # h5("Minor: Data Science"),
                # 
                # hr(),
                
                h3(tags$b("Contact")),
                h4("Email: ", HTML('<a href="mailto:muhanyangpsych@gmail.com">muhanyangpsych@gmail.com</a>')),
                h4("Phone: (604) 727-0895")

            ),
            
            mainPanel(
                h4("Hi there, welcome to my website!"),
                hr(),
                h4("Born and raised in Beijing, China, I am a fourth-year ", tags$b("Honours Psychology"), "student minoring in ", tags$b("Data Science"), " at the ", tags$b("University of British Columbia (UBC)"), "in Vancouver, Canada."),
                hr(),
                h4("I aspire to be a ", tags$em("quantitative psychologist / methodologist"), "and my research interest largely lies in the ", tags$u("longitudinal data analysis"), " in methodology, including ", 
                   tags$u("Multilevel Modelling (MLM)"), " and ", tags$u("Structural Equation Modelling (SEM)"), ". Currently, I'm actively holding research assistant positions in two quantitative methods labs at UBC Department of Psychology. One of my most recent interests is learning to build Shiny App and develop R packages."),
                hr(),
                h4("Beyond my enthusiasm for research, music is an important part of my life. I enjoy playing Guzheng (a Chinese traditional string instrument) by arranging modern songs, and covering mandopop, cantopop, and western pop with Ukulele play-along. I am also a big fan of board games and Sudoku, so you may find me participating in all kinds of Sudoku contests in mainland China!"),
                br(),
                
            )
        )
    })
    
    
    # projects page ----
    output$projpage <- renderUI({
        tabsetPanel(
            tabPanel(tags$b("Theses"), dataTableOutput("thesistable")),
            tabPanel(tags$b("Posters"), dataTableOutput("pretable"))
        )
    })
    
    output$thesistable <- renderDataTable({
        thesis$Link[2] <- HTML('<a href="https://drive.google.com/file/d/17H6hAsh4fBSuZKm65J9nd1_12kuU0fAt/view?usp=sharing" target="_blank">Google Drive (pdf)</a>')
        datatable(thesis, escape = FALSE,options = list(pageLength = 10, autoWidth = TRUE))
    })
    
    output$pretable <- renderDataTable({
        pre$Link[1] <- HTML('<a href="https://drive.google.com/file/d/1ny9-4Bb5uyDjiNh17xXtPNCarU5AmqlP/view?usp=sharing" target="_blank">Google Drive (pdf)</a>')
        pre$Link[2] <- HTML('<a href="https://drive.google.com/file/d/1ekqUvO32ERia0RgSPU6xBFMu78e-0N3z/view?usp=sharing" target="_blank">Google Drive (pdf)</a>')
        datatable(pre, escape = FALSE,options = list(pageLength = 10, autoWidth = TRUE))
    })
    
    
    # experience page ----
    output$exppage <- renderUI({
      textLines1 <- c(
        "Research Assistant @ UBC Structural Equation Modelling (SEM) Lab | ",
        "PI: Victoria Savalei",
        "January 2024 - Present"
      )
      bulletPoints1 <- c("Mastered SEM basics through PSYC 546Y SEM I graduate course materials", 
                         "Conducted a literature review on Random-Intercepts Cross-Lagged Panel Model (RI-CLPM) simulation",
                         "Extended the simulation in Mulder (2023) to other conditions and conducted a report",
                         "Self-learned R Shiny",
                         "Will be conducting an independent project on the simulation of RI-CLPM and build a Shiny App")
      
      # Section 2: Text lines followed by bullet points
      textLines2 <- c(
        "Fourth-year Honours Thesis Student & Research Assistant @ The Rights Lab | ",
        "PI: Jason Rights",
        "September 2023 - Present"
      )
      bulletPoints2 <- c("Skilled in Multilevel Modelling (MLM) via literature reading, biweekly discussion with graduate student, and PSYC 546J MLM graduate course", 
                         "Performed a literature review with 100+ articles on Intra-Class Correlation (ICC) in MLM", 
                         "Drafted an empirical example and got training in running simulation of the ICC project",
                         "Assisted adjusted R-squared manuscript: searched related literature and proofread before submission")
      
      # Section 3: Text lines followed by bullet points
      textLines3 <- c(
        "Third-year Honours Thesis Student & Research Assistant @ Child and Teen Studies Lab | ",
        "PI: Catherine Ann Cameron",
        "September 2023 - June 2024"
      )
      bulletPoints3 <- c("Completed data entry based on interview responses and data cleaning using SPSS", 
                         "Guided and mentored junior lab members to use SPSS and R in data cleaning", 
                         "Contacted parents, scheduled sessions, collected consents, and managed consent forms and session recordings on Globus",
                         "Coordinated a team of 5 to draft the APS Convention 2024 poster submission")
      
      # Section 4: Text lines followed by bullet points
      textLines4 <- c(
        "Research Assistant @ Social Health Lab | ",
        "PI: Frances Chen",
        "September 2022 - September 2023"
      )
      bulletPoints4 <- c("Collected and entered ∼80 pieces of data in Teen Studies project and TSST Simulated Online Interview project, including saliva sample collection", 
                         "Conducted Trier Social Stress Test (TSST) interview, parent reconsent, and medication record entry", 
                         "Assisted graduate students with mock phone screen practice using DSM-V")
      
      tagList(
        # First section
        tags$h4(
          tags$b(textLines1[1]),
          tags$em(textLines1[2]),
          tags$p(textLines1[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints1, function(point) {
            tags$li(point)
          })
        )),
        tags$br(),
        
        # Second section
        tags$h4(
          tags$b(textLines2[1]),
          tags$em(textLines2[2]),
          tags$p(textLines2[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints2, function(point) {
            tags$li(point)
          })
        )),
        tags$br(),
        
        # Third section
        tags$h4(
          tags$b(textLines3[1]),
          tags$em(textLines3[2]),
          tags$p(textLines3[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints3, function(point) {
            tags$li(point)
          })
        )),
        tags$br(),
        
        # Fourth section
        tags$h4(
          tags$b(textLines4[1]),
          tags$em(textLines4[2]),
          tags$p(textLines4[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints4, function(point) {
            tags$li(point)
          })
        ))
      )
    })
    
    # education page ----
    output$edupage <- renderUI({
      undergrad <- c("B.A. (Hons.), The University of British Columbia ",
                     "2021 - 2025 (Expected)",
                     "Major: Psychology | Minor: Data Science",
                     "Relevant Coursework: ")
      courses <- c("PSYC 303 - Tests and Measurements",
                   "PSYC 359 - Advanced Research Methods in Behavioural Sciences",
                   "PSYC 417 - Special Topics in Psychology: Applied Regression Analysis",
                   "PSYC 546J - Seminar in Psychological Problems: Multilevel Model (graduate course)",
                   "PSYC 546Y - Seminar in Psychological Problems: Structural Equation Model I (graduate course; self-learned through 2021W materials)",
                   "STAT 201 - Statistical Inference for Data Science",
                   "STAT 301 - Statistical Modelling for Data Science",
                   "MATH 221 - Matrix Algebra",
                   "DSCI 320 - Visualization for Data Science",
                   "CPSC 330 - Applied Machine Learning",
                   "CPSC 368  - Databases in Data Science (ongoing)")
      
      tagList(
        
        # undergrad overall section
        tags$h4(
          # tags$p(
          tags$b(undergrad[1]),
          tags$em(style = "margin-left: 50px;", undergrad[2]),
          tags$p(tags$em(undergrad[3]))),
          tags$h4(tags$u(undergrad[4])
        ),
        # courses
        tags$h4(tags$ul(
          lapply(courses, function(point) {
            tags$li(point)
          })
        )
      ))
      
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
      
      tagList(
        # First section
        tags$h4(
          tags$b(textLines1[1]),
          tags$em(textLines1[2]),
          tags$p(textLines1[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints1, function(point) {
            tags$li(point)
          })
        )),
        tags$br(),
        
        # Second section
        tags$h4(
          tags$b(textLines2[1]),
          tags$em(textLines2[2]),
          tags$p(textLines2[3])),
        tags$h4(tags$ul(
          lapply(bulletPoints2, function(point) {
            tags$li(point)
          })
        )),
        tags$br()
      )
      
    })
    

    # awards page ----
    output$awardpage <- renderUI({
      tagList(
      tags$h4(
        tags$b("Work Learn International Undergraduate Research Award (WLIURA)"),
        tags$p(tags$em("May - Aug. 2024")),
        tags$p("$8,500 awarded to international undergraduates to work full-time (35h/week) on research projects under faculty’s supervision")),
      tags$br(),
      
      tags$h4(
        tags$b("Dean’s List"),
        tags$p(tags$em("2022 - 2023; 2023 - 2024")),
        tags$p("Awarded by UBC Faculty of Arts to undergraduates with a grade average of 85/100 (A) per year")),
      tags$br(),
      
      tags$h4(
        tags$b("Honourable Mention"),
        tags$p(tags$em("Apr. 2024")),
        tags$p("Awarded by youCode@UBC Hackathon to teams ranking directly subsequent top 3 winners"))
      )
    })
    
    # skills page ----
    output$skillpage <- renderUI({
      
    })
    
    
    
})