library(shiny)
library(ggplot2)
library(reshape2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Timeline Graph for Saving-Investing Modalities"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     column(3,
            sliderInput("ia",
                        "Initial Amount",
                        min = 0,
                        max = 100000,
                        value = 1000,
                        step = 500),
            sliderInput("ac",
                        "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000,
                        step = 500)),
     column(4,
            sliderInput('rr',
                        'Return Rate',
                        min = 0,
                        max = 20,
                        value = 5,
                        step = 0.1),
            sliderInput('gr',
                        'Growth Rate',
                        min = 0,
                        max = 20,
                        value = 2,
                        step = 0.1)),
     
     column(4,
            sliderInput('y',
                        'Years',
                        min = 0,
                        max = 50,
                        value = 20,
                        step = 1),
            
            selectInput('f',
                        label = "Facet?",
                        choices = list('Yes' = 1, 'No' = 2),
                        selected = 2))
  
   ),
      
      # Show a plot of the generated distribution
      mainPanel(
         h3('Timelines'),
         plotOutput('plot', width = "150%"),
         h3('Balances'),
         verbatimTextOutput('balances')
      )
   )


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plot <- renderPlot({
      # future value formula
      future_value <- function(amount, rate, years) {
        comp <- amount * (1 + rate)**years
        return(comp)
      }
      
      # annuity function
      annuity <- function(contrib, rate, years) {
        comp <- contrib * (((1 + rate)**years - 1)/rate)
        return(comp)
      }
      
      # growing annuity function
      growing_annuity <- function(contrib, rate, growth, years) {
        comp <- contrib * (((1+rate)^years - (1+growth)^years)/(rate-growth))
        return(comp)
      }
      
      # defining variables
      init = input$ia
      contrib = input$ac
      return_rate = input$rr / 100
      growth_rate = input$gr / 100
      year = input$y
      facet = input$f
      
      # storing mode 1 for each end-year to a vector
      mode1 <- rep(0, year + 1)
      for (t in 0:year) {
        mode1[t+1] = future_value(amount=init, rate=return_rate, years=t)
      }
      
      # storing mode 2 for each end-year 0-10 to a vector
      mode2 <- rep(0, year + 1)
      for (t in 0:year) {
        mode2[t+1] = future_value(amount=init, rate=return_rate, years=t) + 
          annuity(contrib=contrib, rate=return_rate, years=t)
      }
      
      # storing mode 3 for each end-year 0-10 to a vector
      mode3 <- rep(0, year + 1)
      for (t in 0:year) {
        mode3[t+1] = future_value(amount=init, rate=return_rate, years=t) + 
          growing_annuity(contrib=contrib, rate=return_rate, growth=growth_rate, years=t)
      }
      
      # constructing dataframe modalities by combining three modes
      modalities <- data.frame("year" = 0:year, "no_contrib" = mode1, 
                               "fixed_contrib" = mode2, "growing_contrib" = mode3)
      
      # create melted graph
      modalities_melt <- melt(modalities, id = 'year')
      colnames(modalities_melt)[2] <- 'modality'
      colnames(modalities_melt)[3] <- 'balance'
      
      # timeline graph
      if (facet == 2) {
        ggplot(modalities_melt, aes(x=year,y=balance)) +
          geom_line(aes(color = modality)) +
          geom_point(aes(color = modality)) +
          labs(title = "Three modes of investing") 
      } else {
        ggplot(modalities_melt, aes(x=year,y=balance)) +
          geom_line(aes(color = modality)) +
          geom_point(aes(color = modality)) +
          geom_area((aes(fill = modality)), alpha = 0.5) +
          facet_wrap(~modality) +
          labs(title = "Three modes of investing") +
          theme_bw()
      }
    })
   
   # data table
   output$balances <- renderPrint({
     # future value formula
     future_value <- function(amount, rate, years) {
       comp <- amount * (1 + rate)**years
       return(comp)
     }
     
     # annuity function
     annuity <- function(contrib, rate, years) {
       comp <- contrib * (((1 + rate)**years - 1)/rate)
       return(comp)
     }
     
     # growing annuity function
     growing_annuity <- function(contrib, rate, growth, years) {
       comp <- contrib * (((1+rate)^years - (1+growth)^years)/(rate-growth))
       return(comp)
     }
     
     # defining variables
     init = input$ia
     contrib = input$ac
     return_rate = input$rr / 100
     growth_rate = input$gr / 100
     year = input$y
     facet = input$f
     
     # storing mode 1 for each end-year to a vector
     mode1 <- rep(0, year + 1)
     for (t in 0:year) {
       mode1[t+1] = future_value(amount=init, rate=return_rate, years=t)
     }
     
     # storing mode 2 for each end-year 0-10 to a vector
     mode2 <- rep(0, year + 1)
     for (t in 0:year) {
       mode2[t+1] = future_value(amount=init, rate=return_rate, years=t) + 
         annuity(contrib=contrib, rate=return_rate, years=t)
     }
     
     # storing mode 3 for each end-year 0-10 to a vector
     mode3 <- rep(0, year + 1)
     for (t in 0:year) {
       mode3[t+1] = future_value(amount=init, rate=return_rate, years=t) + 
         growing_annuity(contrib=contrib, rate=return_rate, growth=growth_rate, years=t)
     }
     
     # constructing dataframe modalities by combining three modes
     modalities <- data.frame("year" = 0:year, "no_contrib" = mode1, 
                              "fixed_contrib" = mode2, "growing_contrib" = mode3)
     modalities
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

