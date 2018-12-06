# ELIXIR Training implementations studies

Author: Paula Andrea Martinez

Date: Dec 5th, 2018

## Overview

The Implementation studies (IS) for Learning paths (LP) and Towards Data Stewardship (DM) are proposing a web scrapping solution to search for job ads and look for descriptions of knowledge skills and abilities (KSA's).

## Starting question

Look for job ads and find key descriptions which can be aligned to KSA's. These
will serve to build profiles. The starting point is to build a Data Steward profile.

## Process description

Heidi, Paula and Dietlind have started the search manually looking for job ads.
This process can be scalable and that's is what we describe here.

From the start Paula, picked **indeed** as job database for the search. This decision
was based on the availability of examples on how to scrape indeed. After that the search 
using indeed uses by default your location, hence jobs were only searched in Belgium.
The first problem encountered about the location is that each European country has a 
different URL to search ads using indeed, for example, be.indeed.com, de.indeed.com,
indeed.co.uk. Just for the purpose of testing the search also this URL was used www.indeed.com/q-Europe-jobs.html. The second problem is that not all job ads in
Europe are in English, which make it difficult to parse. After filtering all those
the search found no matches or only 2 or 3, in some instances these were the same
ad but posted in two different platforms. 

Then for those obstacles, the decision was to only search in the United States, 
using the URL **indeed.com**. Using that location, enough jobs ads in English were 
found for several job titles.

Once we found some jobs to parse, the other question was, what to look for. For 
text mining, there are a few options, sentences, words or group of words. The first
test was with sentences, but that came up to be the first problem. Many ads use
bullet points, which don't end up with a period. In any case, I continued to look 
for words in an attempt to see which ones were the most common words and what does that 
tell me. Most common words for ads related to "Data Steward" are data, business, 
management and experience, [with 96% and above occurrence in the job ads searched](https://github.com/orchid00/jobsScrapping/blob/master/figures/top20words.pdf).
That was a bit interesting, but didn't say much to continue. I've also looked for 
word groups, 2 or 3 up to 6, trying to make sense of the search.
Apart from not giving me any interesting results, I came across with the problem 
of duplicated ads, which I just decided to avoid.

Finally, after some weeks of leaving it aside. The idea of cleaning the HTML before 
parsing it was what lead to the current implementation. From the HTML code the process is: 
1. to replace the end of lines with a period (which is super useful with lists, and 
helps down to the road to have sentences). 
2. To replace all strange characters like
`\t`, `\r`, `/`, `<`, `>`, `|`, `:` `\` for a simple space. 
3. To replace any 
double periods, that I might have added in the first replacement. 
4. To replace any `&` with `and`. Then the clean parsed files were saved as text.
The rest of the process is described next in results.

 
### Describing the results

The current solution searches and saves job ads from **indeed.com** as text 
(CSV, HTML) and then it collects sentences for each job ad. After collecting 
the sentences, the report looks for keywords identified around KSA's. 
An example of this result table is [here](https://goo.gl/BFqoQn).

The process can be split into two parts.
1. Searching for job ads from indeed.com based on a filter
2. Searching for KSA based on a set of words per category

Part one of the process runs pretty quickly saving ~ 10 jobs per minute. 
Each job ad is saved as HTML without any cleaning, only removing the style 
(that means no pictures or background colours). Each job ad is then extracted as
text and cleaned as describe above. Every day is likely to have new job ads, hence
each job add is saved with the date and a numeric identifier. 
For each job add sentences are then extracted. 
The first part is well described [here](https://orchid00.github.io/jobWordSearch/reference.html)
if you want to run it yourself.

Once you have the adds that you need (or have selected some of the ads),
the second part of the process is to collect all the sentences (this sentence files
can also be filtered based on the name of the file). The report holds all the code 
needed for searching KSA's; the words used are in current review and an example can 
be seen [here](https://goo.gl/BFqoQn).


