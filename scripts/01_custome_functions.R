#! /usr/bin/env Rscript

#
#   Description: This script contains custome functions to search
#                content on the web and do custome filters for indeed.com.
#                This script is called from the main script webScrapping.R
#   Date: 2018, November 28
#   Paula Andrea Martinez
#   ORCID iD 0000-0002-8990-1985

# load libraries ----------------------------------------------------------
suppressPackageStartupMessages(library(rvest))
suppressPackageStartupMessages(library(tidyverse))
suppressPackageStartupMessages(library(tidytext))
suppressPackageStartupMessages(library(gridExtra))
suppressPackageStartupMessages(library(here))

# get page content as tbl ------------------------------------------------------
getPageContent <- function(url, css_class, num){
    #url <- "https://www.indeed.com/rc/clk?jk=788e7e311656fc54&fccid=09fad757f3449fa5&vjs=3"
    #css_class <- ".jobsearch-JobComponent-description"
    
    # added requirement to save html source -- this could be a new function
    htmlpage <-
        read_html(url)
    
    page_content <-
        htmlpage %>% 
        html_nodes(css = css_class) %>% 
        html_text() %>%         # clean text
        str_replace_all(regex("\n"), "\\. ") %>%
        str_replace_all(regex("\t|\r|/|<|>|\\:|\""), " ") %>%
        str_replace_all(regex("\\.\\."), "\\.") %>%
        str_replace_all(regex("&"), "and") %>%
        str_squish() 
    
    page_content
    
    page_content <-
        page_content %>% 
        tibble(doc = as.numeric(num), text = .) # convert character to a tibble
    
    write_html(htmlpage, 
              file = here("results", "data","rawhtml", 
                          paste0(Sys.Date(), "_", num, ".html"))
    )
    
    save(page_content, 
        file = here("results", "RData", 
                    paste0(Sys.Date(), "_", num, ".RData"))
    )
    
    write_csv(page_content, 
        path = here("results", "data","pages", 
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
        path = here("results", "data","sentences", 
                          paste0(Sys.Date(), "_", nam, ".csv"))
    )
    
    return(collected_sentences)
}


# get the html file from search url  -------------------------------------------
getStartPage <- function(url, jobtitle, contains){
    location <- "United+States"
    adv_url <- paste0(url, 
                      "jobs?q=%22", contains, "%22",
                      "title%3A", jobtitle, 
                      "&l=", location,
                      "&radius=50")
    
    cat(paste("Advanced url" , adv_url, "\n"))
    
    # get the html file from search url
    start_page <- xml2::read_html(adv_url)
    
    return(start_page)
}

# get job Counts ---------------------------------------------------------------
getJobCounts <- function(start_page){
    # get the total job count
    job_count <- start_page %>%
        html_node("#searchCount") %>%
        html_text() %>%
        str_trim(side = "both")
    
    job_count_total <-
        unlist(str_split(job_count, " "))[4]
    cat("Total job count: ", job_count_total, "\n")
    
    return(job_count_total)
}

# getLinks ---------------------------------------------------------------------
getLinks <- function(start_page){
    # Get start page job URLs
    links <- start_page %>%
        html_nodes("h2 a") %>%
        html_attr("href") %>% 
        str_replace_all("/rc/clk", "")
    
    save(links, file = here("results", "RData",
                            paste0(Sys.Date(), "_", "links.RData")))
    
    return(links)
}

## Links to scrape -------------------------------------------------------------
ScrapeJobLinks <- function(base_url, res, job_links, css_class) {
    for (i in seq_along(job_links)) {
        job_url <- paste0(base_url, "viewjob" , job_links[i])
        
        Sys.sleep(3)
        cat(paste0("Reading job ", i, "\n"))
        
        tryCatch({
            page_content <- getPageContent(job_url, css_class, as.character(i))
            my_sentences <- getPageSentences(page_content, as.character(i))
        }, error = function(e) {
            cat("ERROR :", conditionMessage(e), "\n")
        })
    }
    return(res)
}

# url <- "https://www.indeed.com/rc/clk?jk=788e7e311656fc54&fccid=09fad757f3449fa5&vjs=3"
# css_class <- ".jobsearch-JobComponent-description"
# page_content <- getPageContent(url, css_class, 54)
# page_content
# # getPageSentences(page_content, "54")


