### Where to start?

- See results
    - If you want to see an example of results go to the `report folder`, 
click [here][report] to see the notebook.

- Do it yourself (DIY)
   - If you want to run the code in your own computer, the steps are:

   - Download, clone or fork the project 
   - Go to the [`scripts` folder][scripts]
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
    - After collecting the sentences, go to the report and [run the search][reportRmd].


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

Once you have data using the script `webScrapping.R` you can tweak the 
[report][reportRmd] to search for your own words.

The `webScrapping.R` script saves all the jobs in text file with a date, so you 
can rerun the script many times and look for adds over many days. 
All the job ads look for sentences, there are other kinds of tokes you can try.

[reportRmd]: https://github.com/orchid00/jobWordSearch/blob/master/report/sentenceSearch.Rmd
[report]: https://orchid00.github.io/jobWordSearch/report/sentenceSearch.nb.html
[installPkgs]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/00_installPkgs.R 
[customeFunctions]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/01_custome_functions.R 
[webScrapping]: https://github.com/orchid00/jobWordSearch/blob/master/scripts/webScrapping.R