# Collecting KSA sentences from external data

A few job ads were selected and saved in a google drive in different formats. 
The drive is not public, but the data used for this analysis is and is saved in the data folder.

To describe what has been done

- Selected only jobs in English from the drive.
- Downloaded the selected documents.
- Rename files to remove spaces in names.
- Added a new folder structure for external_data, that was not previously contemplated.
- Added extra code to read files in different formats doc, docx and pdf and clean the formatting `scripts/01_custom_external_data.R`.
- There was a bit of a problem with text in tables (it was read horizontally not per column). This might be something to work on in the future, for the time being I've extracted the text manually removing the tables in that file.
- After all that I've run the KSA search and save the results in Rmd and PDF, please report folder.

If needed the initial data, results, scripts and report have been saved in here: https://github.com/orchid00/jobWordSearch/tree/master/external_data

Last updated Dec 12th, 2018

