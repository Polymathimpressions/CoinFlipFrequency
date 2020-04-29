

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$headsplot <- renderPlotly({

        # generate outcomes based on input$flips from ui.R
        set.seed(888)
        coin<- c("heads","tails")
        num_flips<- input$flips
        outcomes<- sample(coin, size = num_flips, replace = TRUE)
        
        #calculate Cumulative Frequency of Heads
        heads_freq <- cumsum(outcomes == 'heads') / 1:num_flips

        # draw the line plot with the specified number of flips
        plot_ly(x=1:num_flips,y=heads_freq, type = "scatter", mode="lines") %>%
            layout(title="Cumulative Frequency of Heads", 
                   xaxis=list(showgrid=T, zeroline=T, nticks=0, showline=T, title="Flip Index"),
                   yaxis=list(nticks=10, title="Relative Frequency")) %>%
            add_segments(x =0 , xend = num_flips, y = 0.5, yend = 0.5)%>%
            hide_legend()
    })

})

