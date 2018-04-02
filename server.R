# server.R

source("helpers.R")
counties = readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      x = switch (input$var,
        "Percent White" = "white",
        "Percent Black" = "black",
        "Percent Hispanic" = "hispanic",
        "Percent Asian" = "asian"
      )
      
      y = switch (input$var,
                  "Percent White" = "black",
                  "Percent Black" = "brown",
                  "Percent Hispanic" = "yellow",
                  "Percent Asian" = "blue"
      )
      percent_map(counties[,x], col = y, input$var, input$range[1], input$range[2])
    })
      
  }
)
    