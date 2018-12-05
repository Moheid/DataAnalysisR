Author: Paula Andrea Martinez

Date: December 5, 2018

# Indeed web Scrapping for KSAs

## Overview
This a fairly simple web scrapping solution. It saves job ads from 
**indeed.com** as text files in `results > data > pages` and then,
for each job ad a search for sentences is performed and saved in
`results > data > sentences`. After collecting the sentences, the report looks 
for keywords identified around knowledge skills and abilities (KSA's) and shown
in a table [here][report]. 

The code is written in R version 3.5.1 (2018-07-02), 
using packages listed in 00_installPkgs.R [here][installPkgs], 
developed on a x86_64-pc-linux-gnu platform.

### Where to start?
- Want to see the results? (this is meant for users)
    - If you want to see an example of results go to the `report folder`, 
    click [here][report] to see the notebook.


- Do it yourself (DIY) approach (this is meant for contributors and developers)
    - If you want to run the code in your own computer, the steps are:
    - You need to download the `scripts` and the `report` folders with their 
   contents (all the results files are generated when running the scripts).
    - Go to the [`scripts` folder][scripts] run the `00_installPkgs.R` 
    [script][installPkgs] at the begining of the analysis 
    (this is needed only at the start of the project). This script will 
    set the environment with all necessary packages, and will create the folder 
    structure for the project (below). 
    - `01_custome_functions.R` [This script][customeFunctions] contains custome 
    functions to search content on the web and do custome filters 
    for **indeed.com**. This script is called from the main script
    `webScrapping.R` (that means you don't need to run it separately).
    - `webScrapping.R` [This is the main script][webScrapping] to collect 
    data from **indeed.com**. It will save the job ads as text files in 
    `results > data > pages` and then for each job ad, it will perform a search 
    for sentences and save results in text form in `results > data > sentences`.
    All the adds and sentences are saved as text with date for reproducibility 
    of the analysis.
    - After collecting the sentences, go to the report and 
    [run the search][reportRmd].
    
#### Folder structure

The project structure looks like this: 

```
└── scripts
|   ├── 00_installPkgs.R
|   ├── 01_custome_functions.R
|   ├── README.md
|   └── webScrapping.R
├── report
│   ├── sentenceSearch.nb.html
│   └── sentenceSearch.Rmd
└── results
    ├── data
    │   ├── pages
    │   ├── rawhtml
    │   └── sentences
    │       └── allsentences
    └── RData
```

Every day is likely to have new job ads, hence the search will store files with
the date included in the name. You can save adds on different dates, then run 
the search of key words in the report when you have the adds that you need 
(or have selected some of the ads).

## Notes

You can run the `webScrapping.R` from the console, from the main folder

```
Rscript --vanilla scripts/webScrapping.R --help
```

It will display the needed options

```
Usage: scripts/webScrapping.R [options]


Options:
    -u URL, --url=URL
        URL for search such as [default]

    -t JOBTITLE, --jobtitle=JOBTITLE
        words for jobtitle, use + instead of space

    -c CONTAINS, --contains=CONTAINS
        Words contained in the search, use + instead of space

    -h, --help
        Show this help message and exit
```

You can either provide arguments or it will use defaults:

```
Searching arguments
 url: https://www.indeed.com/ 
 job title: data+steward 
 contains words: life+sciences 
```

Once you have data using the script `webScrapping.R` you can tweak the report 
to search for your own words.

The `webScrapping.R` script saves all the jobs in text file with a date, 
so you can rerun the script many times and look for adds over many days. 
All the job ads look for sentences, there are other kinds of tokes you can try
on your own.
