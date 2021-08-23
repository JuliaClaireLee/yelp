# yelp
yelp api shiny app

This is using the yelpr package using (devtools::install_github("OmaymaS/yelpr"))
Here we are trying to create a user friendly Yelp look up app that allows clients to use their api key and query up to 200 results based on key words, 
location, and distance (in miles), a digital phone book. Users are also able to download their results. 

# Needed packages:

library(dplyr)
library(tidyverse)
library(DT)
library(httr)
devtools::install_github("OmaymaS/yelpr")
remotes::install_github("richierocks/yelp")
library(yelp)
library(dplyr)
library(yelpr)
