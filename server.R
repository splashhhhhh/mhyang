library(shiny)
library(shinydashboard)
library(shinyalert)
library(shinyjs)
library(shinyBS)
library(shinycssloaders)
library(ggplot2)

shinyServer(function(input, output, session) {
    
    # index page ----
    output$indexpage <- renderUI({
        sidebarLayout(position = "left",
            sidebarPanel(width = 4,
                tags$img(src = "headshot.jpg", height = 240, width = 180, 
                         style="display: block; margin-left: auto; margin-right: auto;"),
                h2(tags$b("Muhan Yang | 杨 慕 涵")),
                h4("Pronunciation: 'm-oo-h-uh-n'"),
                
                hr(),
                
                h3(tags$b("Education")),
                h4("B.A. (Hons), University of British Columbia, 2021 - 2025"),
                h5("Major: Psychology"),
                h5("Minor: Data Science"),
                
                hr(),
                
                h3(tags$b("Contact")),
                h4("Email: ", HTML('<a href="mailto:muhanyangpsych@gmail.com">muhanyangpsych@gmail.com</a>')),
                h4("Phone: (604) 727-0895")

            ),
            
            mainPanel(
                h4("Hi there, welcome to my website!"),
                hr(),
                h4("Born and raised in Beijing, China, I am a fourth-year ", tags$b("Honours Psychology"), "student with a minor in ", tags$b("Data Science"), " at the ", tags$b("University of British Columbia (UBC)"), "in Vancouver, Canada."),
                hr(),
                h4("I aspire to be a ", tags$em("quantitative psychologist/methodologist"), "and my research interest largely lies in the ", tags$u("longitudinal data analysis"), " in the methodology, including ", 
                   tags$u("Multilevel Modelling (MLM)"), " and ", tags$u("Structural Equation Modelling (SEM)"), "."),
                hr(),
                h4("Currently, I'm actively holding research assistant positions in two quantitative methods labs at UBC Department of Psychology. One of my most recent interests is learning to build Shiny App and develop R packages. Due to time constraints in the application season, the general structure of this website was adapted from",
                   HTML('<a href="https://github.com/Xiaozhu-Zhang1998/website-using-shiny">a template</a>'),", but I've made some necessary changes and I hope you enjoy my Shiny Dashboard website so far!"),
                hr(),
                h4("Beyond my enthusiasm for research, music is an important part of my life. I enjoy playing Guzheng (a Chinese traditional string instrument) by arranging modern songs, and covering mandopop, cantopop, and western pop with Ukulele play-along. I am also a big fan of Sudoku and you may find me participating in all kinds of Sudoku contests in mainland China!"),
                br(),
                
            )
        )
    })
    
    # projects page ----
    output$exppage <- renderUI({
        tabsetPanel(
            tabPanel(tags$b("Theses"), dataTableOutput("thesistable")),
            tabPanel(tags$b("Posters"), dataTableOutput("pretable"))
        )
    })
    
    output$thesistable <- renderDataTable({
        thesis
    })
    
    output$pretable <- renderDataTable({
        pre
    })
    
    # experiences page ----
    output$projpage <- renderUI({
      textLines1 <- c(
        "Research Assistant @ UBC Structural Equation Modelling (SEM) Lab | ",
        "PI: Victoria Savalei",
        "January 2024 - Present"
      )
      bulletPoints1 <- c("Mastered SEM basics through PSYC 546Y SEM I graduate course materials", 
                         "Conducted a literature review on Random-Intercepts Cross-Lagged Panel Model (RI-CLPM) simulation",
                         "Extended the simulation in Mulder (2023) to other conditions and conducted a report",
                         "Self-learned R Shiny")
      
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
                         "Coordinated a 5-person team to draft the APS Convention 2024 poster submission")
      
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
        tags$b(textLines1[1]),
        tags$em(textLines1[2]),
        tags$p(textLines1[3]),
        tags$ul(
          lapply(bulletPoints1, function(point) {
            tags$li(point)
          })
        ),
        
        # Second section
        tags$b(textLines2[1]),
        tags$em(textLines2[2]),
        tags$p(textLines2[3]),
        tags$ul(
          lapply(bulletPoints2, function(point) {
            tags$li(point)
          })
        ),
        
        # Third section
        tags$b(textLines3[1]),
        tags$em(textLines3[2]),
        tags$p(textLines3[3]),
        tags$ul(
          lapply(bulletPoints3, function(point) {
            tags$li(point)
          })
        ),
        
        # Fourth section
        tags$b(textLines4[1]),
        tags$em(textLines4[2]),
        tags$p(textLines4[3]),
        tags$ul(
          lapply(bulletPoints4, function(point) {
            tags$li(point)
          })
        )
      )
    })
    # edu page ----
    output$edu <- renderUI({list(
        tags$li("May 12th: Please check the Canvas for class materials."),
        tags$li("May 11th: Assignment 2 is coming out.")
    )
        
    })
    
    output$curclass <- renderTable({
        class1
    })
    
    output$pastclass <- renderDataTable({
        class2
    })
    
    output$ofappoint <- renderUI({
        lst <- list(
            p1 = p("If you have any problems over the classes, assignments, or exams and want to talk to me, please make an appointment on W/F."),
            p2 = p("There would be 15 slots available each day."),
            d1 = dateInput("date", "Please select a date", value = Sys.Date(), min = Sys.Date() + 1, max = Sys.Date() + 21, daysofweekdisabled = c(0,1,2,4,6), width = '40%'),
            u1 = uiOutput("checkava"),
            t1 = textInput("name", "Please input your name", width = "40%"),
            t2 = textInput("password", "Please input your password", width = "40%"),
            u2 = useShinyalert(),
            a1 = actionButton("make", "Make an appointment"),
            a2 = actionButton("check", "Check appointments"),
            a3 = actionButton("del", "Delete the appointment")
        )
        return(lst)
    })
    
    output$checkava <- renderUI({
        if(length(input$date) == 0)
            return()
        else{
            dat <- read.table("slots.csv", sep = ',', header = T)
            sub <- subset(dat, Date == as.character(input$date))
            p(paste(nrow(sub), "slot(s) occupied."))
        }
    })
    
    observeEvent(input$make, {
        # check whether full information
        if(length(input$date) == 0 | input$name == "" | input$password == ""){
            shinyalert("Alert", "Please input full information!", type = "error")
        }
        else{
            dat <- read.table("slots.csv", sep = ',', header = T)
            # check whether exist
            sub <- subset(dat, Date == as.character(input$date) & Name == input$name & Password == input$password)
            if(nrow(sub) != 0){
                shinyalert("Alert", "You have made an appointment on this day!", type = "error")
            }
            else{
                # check whether available
                count <- sum(dat$Date == as.character(input$date))
                if(count >= 15){
                    shinyalert("Alert", "The office hour capacity is full on this day!", type = "error")
                }
                else{
                    record <- c(as.character(input$date), input$name, input$password)
                    dat <- rbind(dat, record)
                    write.csv(dat, "slots.csv", row.names = F)
                    shinyalert("Success", "You have made an appointment!", type = "success")
                }
            }
        }
    })
    
    observeEvent(input$check, {
        dat <- read.table("slots.csv", sep = ',', header = T)
        sub <- subset(dat, Name == input$name & Password == input$password)
        date <- sub$Date
        if(nrow(sub) == 0){
            shinyalert("No matches", "You don't have any appointments now!", type = "info")
        }
        else{
            shinyalert("Matches", paste0("Your appointment(s): ", paste(date, collapse = ", ")), type = "info")
        }
    })
    
    observeEvent(input$del, {
        if(length(input$date) == 0 | input$name == "" | input$password == ""){
            shinyalert("Alert", "Please input full information!", type = "error")
        }
        else{
            dat <- read.table("slots.csv", sep = ',', header = T)
            sub <- subset(dat, Date == as.character(input$date) & Name == input$name & Password == input$password)
            if(nrow(sub) == 0){
                shinyalert("No matches", "This appointment does not exist!", type = "info")
            }
            else{
                id <- as.numeric(rownames(sub))
                write.csv(dat[-id,], "slots.csv", row.names = F)
                shinyalert("Success", "You have deleted the appointment!", type = "success")
            }
        }
        
    })
    
    
    # misc page
    data_uploaded <- reactive({
        file1 <- input$file
        if(is.null(file1)){ return() }
        read.table(file = file1$datapath, sep = ",", header = T, stringsAsFactors = T)
    })
    
    output$histui <- renderUI({
        if(is.null(input$file))
            return()
        else{
            lst <- list(actionButton("plot_button", "View Plot", icon = icon("bar-chart")),
                        bsModal(id = "Plot", title = "Plot", trigger = "plot_button", size = "large",
                                selectInput("data_names", "Select a variable", choices = names(data_uploaded())),
                                sliderInput("bins", label = "Select the number of bins", min = 20, max = 50, value = 30),
                                br(),
                                withSpinner(plotOutput("plot_gg"))
                                ))
            return(lst)
        }
    })
    
    output$plot_gg <- renderPlot({
        ggplot(data = data_uploaded()) +
            geom_histogram(bins = input$bins, aes(x = get(input$data_names))) +
            ggtitle("Histogram") +
            xlab(paste(input$data_names, " & number of bins as ", input$bins)) +
            ylab("Frequency") +
            theme_minimal()
    })
    
    
    
})