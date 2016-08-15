#


library(shiny)
options(digits = 12)
# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  headerPanel( "China/Latin America GDP Correlations"),
  sidebarPanel( "Select GDP Correlation",
    checkboxInput("argentina", label = "Argentina", value = TRUE),
    checkboxInput("brazil", label = "Brazil", value = TRUE),
    checkboxInput("chile", label = "Chile", value = TRUE),
    checkboxInput("mexico", label = "Mexico", value = TRUE),
    checkboxInput("peru", label = "Peru", value = TRUE)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("How to Use This App", verbatimTextOutput("summary")),
      tabPanel("Click Here For Plot", plotOutput('plot1'))
))))

