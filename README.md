# yelp
yelp api shiny app

Here we are trying to create a user friendly Yelp look up shiny web app that allows clients to use their yelp api key and query up to 200 results based on key words, location, and distance (in miles) to create almost a digital phone book (name of business, phone, address, city, zip code). Users are also able to download their results to save them.  


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
