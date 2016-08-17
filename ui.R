#


library(shiny)
options(digits = 12)
# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  headerPanel( "China/Latin America GDP Correlations"),
  sidebarPanel( "Select GDP Correlation",
    checkboxInput("argentina", label = "Argentina", value = TRUE),
    checkboxInput("brazil", label = "Brazil", value = FALSE),
    checkboxInput("chile", label = "Chile", value = FALSE),
    checkboxInput("mexico", label = "Mexico", value = FALSE),
    checkboxInput("peru", label = "Peru", value = FALSE)
  ),
  mainPanel(
    tabsetPanel(
      tabPanel(
    "Click Here For Plot",
     plotOutput('plot1')),
    tabPanel(
      "How to Use This App", includeMarkdown("index.md"))
    ))))


