# Lib
library(dplyr)
library(ggplot2)
library(reshape2)
#Df
df_ini <- read.csv2("data/bd_shiny102.csv", stringsAsFactors = FALSE, encoding = "UTF-8")

##Para tema de los errores
options(shiny.sanitize.errors = FALSE)