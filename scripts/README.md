### Where to start?

- If you want to see results go to the `report folder`, 
click [here][report] to see the notebook.
- If you want to run the code in your own computer, the steps are:

- Download, clone or fork the project 
- Go to the `scripts` folder
- `00_installPkgs.R` [This script][installPkgs] is optional, to be run at the 
begining of the analysis for setting the environment with all necesary packages
- `01_custome_functions.R` [This script][customeFunctions] contains custome 
functions to search
content on the web and do custome filters for **indeed.com**
This script is called from the main script `webScrapping.R` (that means you 
don't need to run it separately).
- `webScrapping.R` [This is the main script][webScrapping] 
to collect data from **indeed.com**.
It will save the job ads as text files in `results > data > pages` and then
for each job ad, it will perform a search for sentences and save results in text
form in `results > data > sentences`.
After collecting the sentences, go to the report and run the search.


[report]: https://orchid00.github.io/jobWordSearch/report/sentenceSearch.nb.html
[installPkgs]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/00_installPkgs.R 
[customeFunctions]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/01_custome_functions.R 
[webScrapping]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/webScrapping.R