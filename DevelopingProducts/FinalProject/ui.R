#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Data Sciencie Project"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            #sliderInput("sliderMPG","What is the MPG of the car?", 10, 35, value = 20),
            h3("Slope Model 1"),
            textOutput("SlopeOut1"),
            h3("Slope Model 2"),
            textOutput("SlopeOut2"),
            h3("Intercept Model 1"),
            textOutput("intOut1"),
            h3("Intercept Model 2"),
            textOutput("intOut2"),
            
            checkboxInput("showModel1","Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2","Show/Hide Model 2", value = TRUE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("plot1", brush = brushOpts(id="brush1")),
            #h3("Predicted Horsepower from Model 1"),
            #textOutput("pred1"),
            #h3("Predicted Horsepower from Model 2 | Cyl = 6"),
            #textOutput("pred2"),
        )
    )
))
