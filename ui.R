#load packages
library(shiny)
library(plotly)

# Define UI for application that draws a line plot
shinyUI(fluidPage(

    # Application title
    titlePanel("Cumulative Frequency of Heads in Coin Flip"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h4("By adjusting the number of outcomes, the plot will display the cumulative frequency for the outcome of heads."),
            sliderInput("flips",
                        "Select Number of Flips:",
                        min = 10,
                        max = 10000,
                        value = 100)
        ),

        # Show a plot of the cumulative frequency
        mainPanel(
            plotlyOutput(outputId= "headsplot"), width = 8
        )
    )
))
