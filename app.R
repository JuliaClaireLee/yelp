#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(dplyr)
library(tidyverse)
library(DT)
library(httr)
library(shiny)
library(gridExtra)
library(rmarkdown)
library(wordcloud)
library(tm)
library(textdata)
library(rtweet) 
library(tidytext)
library(ggpubr) 
library(tidyverse)
library(wordcloud)
library(RColorBrewer)
#install.packages("RCurl")
library(RCurl)
#install.packages("maps")
library(maps)
library(shiny)
require(ggplot2)
require(ggplot2)
require(ggforce)
require(devtools)
library(tm)
library(yelp)
library(dplyr)
library(yelpr)
require(shinythemes)
library(shiny)
yelp2<-function(lo, t,dist,offset1=0,key){
    
    business_ny<-business_search(api_key = key,
                                 location = lo,
                                 term = t,
                                 radius_m = dist*1609.34,
                                 limit = 50,
                                 offset = offset1)  
    austin<-business_ny$businesses$location
    austin$name<-business_ny$businesses$name
    austin$phone<-business_ny$businesses$display_phone
    austin <- austin %>%
        summarise(name,phone,address = address1, city,zip_code)
    austin<-as.data.frame(austin)
    return(austin)
}
yelp3 <- function(lo, t, dist,key){
    DF <- data.frame()
    for (o in c(0,51,102,153)){
        j<-yelp2(lo, t,dist, o, key)
        DF <- rbind(DF,j)
    }
    return(DF)
}
ui <- fluidPage(theme = shinytheme("united"),
                # Application title
                titlePanel("Yelp"),
                sidebarPanel(
                    textInput("obs2", "Api Key:", value = "type in your api-key", width = NULL, placeholder = "Wf2sGNVh_Ap0z1UQRkTyhFUFv__Z4HkO9Qg46K0hYXYx"),
                    downloadButton('downloadData', 'Download')
                ),
                mainPanel(
                    textInput("obs3", "key word:", value = "Cookies", width = NULL, placeholder = NULL),
                    textInput("obs4", "Location (zip code or city name):", value = "07043", width = NULL, placeholder = NULL),
                    numericInput("obs5", "Distance (in miles):", value = 6 ),
                    DTOutput("data_table") 
                    
                )
                
)
server <- function(input, output) {
     output$data_table<-renderDT(yelp3(input$obs4,input$obs3,input$obs5,input$obs2))
     output$downloadData <- downloadHandler(
         filename = function() { 
             paste('data', '.csv', sep='') },
         content = function(file) {
             write.csv(yelp3(input$obs4,input$obs3,input$obs5,input$obs2) , file)
         })  
}

# Run the application 
shinyApp(ui = ui, server = server)
