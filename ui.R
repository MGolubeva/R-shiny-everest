library(shiny)
library(plotrix)
library(shinythemes)
library(dygraphs)


data <- read.csv("everest.csv", header = TRUE, sep = ";")

shinyUI(
  fluidPage(
  theme = shinytheme("flatly"),
  titlePanel("Statistic for Everest mountain"),
 	sidebarLayout(
        sidebarPanel(
         selectInput("years", "Years:", 
                     choices =  c("All",
                              data[11:1, 1])
       ),
       actionButton("update", "Change")),

	 mainPanel(
         tabsetPanel(id = "tabs", 
                     tabPanel(title = "Plot", value = "panel1", dygraphOutput("plot")), 
                     tabPanel(title = "Table", value = "panel2", tableOutput("table")),
                     tabPanel(title = "Bar Diagram", value = "panel3", plotOutput("plot2")),
                     tabPanel(title = "Pie Diagram", value = "panel3", plotOutput("diagram"))
          )
	   )
)))