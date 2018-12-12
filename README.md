# Indeed web Scrapping for KSAs

[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badge/) 
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1998210.svg)](https://zenodo.org/record/1998210)

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

If you are interested in knowing more about the process you can read about the 
[experience][experience_shared].

## Contributing

Thanks for coming by, this is an open source project and I welcome your 
contributions. There are a number of ways you can help make this code better, see
the [contribution guide][contributing].

## License

This **GNU General Public License v3.0** is a strong copyleft license
conditioned on making available complete source code of licensed works and 
modifications, which include larger works using a licensed work, under the 
same license. Copyright and license notices must be preserved. 
For more details see 
[LICENSE](https://orchid00.github.io/jobWordSearch/LICENSE.html).

## Citation

"Indeed web scrapping for KSAs" v0.3, December 2018. 
[Paula Andrea Martinez](https://orcid.org/0000-0002-8990-1985) with ORCID iD 
0000-0002-8990-1985.
[https://github.com/orchid00/jobWordSearch](https://github.com/orchid00/jobWordSearch). 
GNU General Public License v3.0. [https://zenodo.org/record/1998210](https://zenodo.org/record/1998210)

[experience_shared]: https://orchid00.github.io/jobWordSearch/experiences_shared.html
[contributing]: https://orchid00.github.io/jobWordSearch/CONTRIBUTING.html
[reportRmd]: https://github.com/orchid00/jobWordSearch/blob/master/report/sentenceSearch.Rmd
[report]: https://orchid00.github.io/jobWordSearch/report/sentenceSearch.nb.html
[installPkgs]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/00_installPkgs.R 
[customeFunctions]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/01_custome_functions.R 
[webScrapping]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/webScrapping.R
[scripts]: https://github.com/orchid00/jobWordSearch/tree/master/scripts