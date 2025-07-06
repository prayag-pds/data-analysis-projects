# Netflix data cleaning using Power Query and DAX
# Author - Prayag Das
email - prayag.pds@gmail.com  
website - https://prayagpds.wixsite.com/my-site-1
# DATA DESCRIPTION
Data from 2021.  
8808 rows and 13 columns.
# DATA CLEANING  
- [ ] Load the `netflix_titles` dataset
- [ ] Review data in Power Query to identify inconsistencies
- [ ] Remove rows with errors in the first column and other columns
- [ ] Identify and remove any rows with inconsistent values across columns
- [ ] Cross-check `show_id` to find and address similar problematic rows
- [ ] Use Excel for manual replacement of specific values as needed
- [ ] Explore all columns and fill remaining `null` and error values
- [ ] Replace excessive nulls in `director`, `cast`, and `country` columns with `"NA"`
- [ ] For missing `country` values:
    - [ ] Identify rows where director information is present
    - [ ] Use DAX to infer country based on director’s known country in other entries
    - [ ] Calculate and create a new column with inferred country values   
          `=IF(
	ISBLANK(netflix_cleaned[country]) || netflix_cleaned[country] = "" || netflix_cleaned[country] = " ",
	VAR country_fill = 
	CALCULATE(
		MAX(netflix_cleaned[country]),
		FILTER(netflix_cleaned,
			netflix_cleaned[director] = EARLIER(netflix_cleaned[director]) && 
			NOT(ISBLANK(netflix_cleaned[country])) && netflix_cleaned[country] <> "" && netflix_cleaned[country] <> " " && netflix_cleaned[country] <> "NA"
			 && NOT(ISBLANK(netflix_cleaned[director])) && netflix_cleaned[director] <> "NA"
			)
		)
		RETURN IF(ISBLANK(country_fill), "NA", country_fill)
		, netflix_cleaned[country]
	)`
     ![image](https://github.com/user-attachments/assets/fe72a12d-805a-49f9-89fa-6f1ba117f971)

- [ ] Address any remaining blank spaces in the `country` column after trimming
- [ ] List the top 10 countries represented in the Netflix dataset   
      ![image](https://github.com/user-attachments/assets/f23cca6d-6bdd-4fa4-9a7f-f8659244397e)

- [ ] Confirm that the data is cleaned and ready for further analysis

# CONCLUSION
- [ ] Cleaned and prepared the 2021 Netflix titles dataset using Excel, Power Query, and DAX
- [ ] Resolved critical errors and inconsistencies by removing problematic rows
- [ ] Manually corrected key entries for accuracy
- [ ] Standardized null values in important columns (`director`, `cast`, `country`) by replacing them with "NA"
- [ ] Used DAX to infer and fill missing `country` values based on shared director information
- [ ] Ensured the resulting dataset is accurate, consistent, and reliable for in-depth analysis of Netflix’s global content trends
