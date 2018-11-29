# Indeed web Scrapping for KSAs

[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.png?v=103)](https://github.com/ellerbrock/open-source-badge/) 

## Overview
This a fairly simple web scrapping solution. It saves job ads from 
**indeed.com**. as text files in `results > data > pages` and then
for each job ad a search for sentences is performed and saved in
`results > data > sentences`. After collecting the sentences,the report looks 
for keywords identified around knowledge skills and abilities (KSA's). 

### Where to start?
- If you want to see results go to the `report folder`.
- If you want to run the code in your own computer, the steps are:

- Download the project 
- Go to the `scripts` folder
- `00_installPkgs.R` This script is optional, to be run at the 
begining of the analysis for setting the environment with all necesary packages
- `01_custome_functions.R` This script contains custome functions to search
content on the web and do custome filters for **indeed.com**
This script is called from the main script `webScrapping.R` (that means you 
don't need to run it separately).
- `webScrapping.R` This is the main script to collect data from **indeed.com**.
It will save the job ads as text files in `results > data > pages` and then
for each job ad, it will perform a search for sentences and save results in text
form in `results > data > sentences`.
After collecting the sentences, go to the report and run the search.

### Notes
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

Everyday is likely to have new job adds, hence the search will store files with
date. You can save them all and then run the search of key words in the report 
when you have the adds that you need (or have selected).


## Contributing

Thanks for coming by, this is an open source project and I welcome your 
contributions. There are a number of ways you can help make this code better:

- If something is unclear please send an issue so we I can address anything
that is confusing.
- If you spot a typo, feel free to edit the underlying page and send a 
pull request. If you've never done this before, follow the 
[hello world example from github pages](https://guides.github.com/activities/hello-world/).
- If you have any suggestions to improve the code, please leave a comment as an 
issue.
- If you make a significant contributions you will be listed as an author.

## License

This **GNU General Public License v3.0** is a strong copyleft license
conditioned on making available complete source code of licensed works and 
modifications, which include larger works using a licensed work, under the 
same license. Copyright and license notices must be preserved. 
Contributors provide an express grant of patent rights. For more details see 
[LICENSE](LICENSE.md).

## Citation

"Indeed web Scrapping for KSA", November 2018. 
[Paula Andrea Martinez](https://orcid.org/0000-0002-8990-1985) with ORCID iD 
0000-0002-8990-1985 https://github.com/. GNU General Public License v3.0.