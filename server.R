#
# 
library(shiny); library(ggplot2); library(scales)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  options(scipen = 999)
  
output$summary <-  renderText({paste("text to be read", input$argentina)})
  
 
 WBGDP <- read.csv("WB_GDP.csv", header = TRUE)
   output$plot1 <- renderPlot({
  
     a <- c("#E5F5F9")
     b <- c("#E5F5F9")
     c <- c("#E5F5F9")
     d <- c("#E5F5F9")
     e <- c("#E5F5F9")
    
     
     if (input$argentina) { 
       a <- c("#1f78b4")
     }   
     
     if (input$brazil) { 
       b <- c("#b2df8a")
     } 
     
     if (input$chile) { 
       c <- c("#33a02c")
     } 
     
     if (input$mexico) { 
       d <- c("#fb9a99")
     }
     
     if (input$peru) { 
       e <- c("#e31a1c")
     }
     
     Plt <- c(a, b, c, d, e) 
     Shp <- c(8, 15, 17, 18, 16)
 p <-   ggplot(WBGDP, aes(China, GDP, colour = Country, shape = Country, size = 4)) 
 p <- p + labs(title = "Selected Correlations", x = "China GDP in $ Millions", y = "Comparison GDP in $ Milliions")
 p <- p + theme(plot.title = element_text(face = "bold", size = 20))
 p <- p + theme(axis.title = element_text(face = "bold", size = 16))
 p <- p + geom_point() + scale_color_manual(values = Plt) + scale_shape_manual(values = Shp)
 p <- p + scale_x_continuous(labels = comma) + scale_y_continuous(labels = comma)
 p <- p + theme(panel.background = element_rect(fill = "#E5F5F9")) + theme(legend.position = "none")
 p <- p + geom_smooth(method = lm, size = 1, se = FALSE)
 
  print(p)
    
  })
  
})
