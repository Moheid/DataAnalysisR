#! /usr/bin/env Rscript

#
#   Description: This script contains custome functions to search
#                content on the web and do custome filters for indeed.com.
#                This script is called from the main script webScrapping.R
#   Date: 2018, December 28
#   Paula Andrea Martinez
#   ORCID iD 0000-0002-8990-1985

# load libraries ----------------------------------------------------------
suppressPackageStartupMessages(library(rvest))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(tidytext))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(here))
suppressPackageStartupMessages(library(textreadr))

# get page content as tbl ------------------------------------------------------
getPageContent <- function(name, num){
    
    name <- here("external_data", "data", name)
    #             #"5_Part-time_Data_Steward_Positions_—_AcademicTransfer.pdf")
    #             #"UMCG_Datasteward_profile__Medical_Sciences__draft20180.docx")
    #             "RDO_st_andrews.doc")
    
    
    mytext <- textreadr::read_document(name) %>%
            paste(collapse = "\n") %>%
            # clean text
            str_replace_all(regex("\n"), "\\. ") %>%
            str_replace_all(regex("\\||\t|\r|/|<|>|\\:|\""), " ") %>%
            str_squish() %>% 
            str_replace_all(regex("\\"), "") %>%  #  remove strange characters 
            str_replace_all(regex("\\.\\."), "\\.") %>%
            str_replace_all(regex("&"), "and")
    
    page_content <-
        mytext %>% 
        tibble(doc = as.numeric(num), text = .) # convert character to a tibble
    
    write_csv(page_content, 
              path = here("external_data", "results", "data", "pages", 
                          paste0(Sys.Date(), "_", num, ".csv"))
    )
    
    return(page_content)
}

# get sentences --------------------------------------------------------------------
getPageSentences <- function(page_content, nam){
    
    collected_sentences <-
        page_content %>%
        unnest_tokens(sentence, text, token = "sentences")
    
    write_csv(collected_sentences, 
              path = here("external_data", "results", "data", "sentences", 
                          paste0(Sys.Date(), "_", nam, ".csv"))
    )
    
    return(collected_sentences)
}

# Read external data -----------------------------------------------------------
ReadExternaldataDocs <- function(myfiles) {
    for (i in seq_along(myfiles)) {
        
        cat(paste0("Reading job ", i, "\n"))
        
        tryCatch({
            page_content <- getPageContent(myfiles[i], as.character(i))
            my_sentences <- getPageSentences(page_content, as.character(i))
        }, error = function(e) {
            cat("ERROR :", conditionMessage(e), "\n")
        })
    }
}

myfiles <- list.files(here("external_data", "data"))

if (length(myfiles) != 0) {
    cat("Scraping jobs from external data \n")
    results <- ReadExternaldataDocs(myfiles)
}

# Rscript --no-save external_data/scripts/01_custom_external_data.R
