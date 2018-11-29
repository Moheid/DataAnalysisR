#! /usr/bin/env Rscript

#
#   Description: This is the main script to collect data from **indeed.com**.
#                It will save the job ads as text files in 
#                `results > data > pages` and then
#                for each job ad, it will perform a search for sentences and 
#                save results in text form in `results > data > sentences`.
#                After collecting the sentences, go to the report and run 
#                the search. 
#   Date: 2018, November 28
#   Paula Andrea Martinez
#   ORCID iD 0000-0002-8990-1985

suppressPackageStartupMessages(library(here))
suppressPackageStartupMessages(library(optparse))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(xml2))
suppressPackageStartupMessages(library(rvest))
suppressPackageStartupMessages(library(tidytext))
suppressPackageStartupMessages(library(here))

# Get input from the command
option_list <- list(
    make_option(c("-u", "--url"), action = "store", 
                default = "https://www.indeed.com/",
                type = "character",
                help = "URL for search such as [default]"),
    make_option(c("-t", "--jobtitle"), default = "data+steward",
                type = "character",
                help = "words for jobtitle, use + instead of space"),
    make_option(c("-c", "--contains"), default = "life+sciences",
                type = "character",
                help = "Words contained in the search, use + instead of space")
)

opt <- parse_args(OptionParser(usage = "usage: %prog [options]",
                               option_list = option_list))

rm(option_list)

cat("\nSearching arguments\n", 
            "url:", opt$url, "\n", 
            "job title:", opt$jobtitle, "\n",
            "contains words:", opt$contains, "\n\n")


# Start by sourcing the custome functions --------------------------------------
source(file = here("scripts", "01_custome_functions.R"))

start_page <- getStartPage(opt$url, opt$jobtitle, opt$contains)

links <- getLinks(start_page)
job_count_total <- length(links)

cat("Total job count: ", job_count_total, "\n")

# Here is our results object starts with 0
results <- list("num_jobs" = 0)
css_class <- ".jobsearch-JobComponent-description"


if (job_count_total != 0) {
    cat("Scraping jobs in Start Page\n")
    results <- ScrapeJobLinks(opt$url, results, links, css_class)
}

