#! /usr/bin/env Rscript

#
#   Description: Setting up the environment before running analysis
#                Run this script first
#   Date: 2018, November 23
#   Paula Andrea Martinez
#   ORCID iD 0000-0002-8990-1985


# To run the analysis some packages need to be previously installed.
# Check installed packages before installing new packages.
# This script is optional, to be run at the 
# begining of the analysis for setting the environment with all necesary 
# packages

list_of_packages <- c("knitr", "tidyverse", "DBI", "ggmap", "likert",
                      "mapproj", "RColorBrewer", "forcats", "extrafont",
                      "scales", "wordcloud", "tm", "SnowballC", "grid",
                      "ggthemes", "here", "rvest", "tidytext", "gridExtra",
                      "optparse", "xml2")

#check which packages need to be installed
new_packages <- list_of_packages[!(list_of_packages %in% installed.packages()[,"Package"])]

# install packages
if (length(new_packages)) install.packages(new_packages, 
                                          repos = "https://cran.rstudio.com/")

# remove list
rm(list_of_packages, new_packages)

#Message
print(paste("All needed packages have been installed on", Sys.Date()))

      