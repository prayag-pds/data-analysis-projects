# crime_india_power_bi
# Author - Prayag Das
email - prayag.pds@gmail.com  
website - https://prayagpds.wixsite.com/my-site-1
# DATA DESCRIPTION-
Source- https://www.kaggle.com/datasets/sudhanvahg/indian-crimes-dataset  
Time Frame - 2020-2024,
Size - 40000+
# ETL-
- [ ] Addressed formatting issues in the 'Date of occurrence' column using Power BI’s Transform tab and applied the appropriate Locale to correct language and region settings.   
- [ ] Extracted the date from the “Date Reported” field and created a separate “Time Reported” column for clarity.   
- [ ] Ensured only the date was extracted in the “Date of Occurrence” column, as a “Time of Occurrence” column already existed.   
- [ ] Standardized values in the “Victim Gender” column by converting 'M' to 'Male', 'F' to 'Female', and retaining 'X' as is.   
- [ ] Resolved anomalies in the crime domain, such as reclassifying Homicide from other crimes to violent crimes by creating a calculated column using DAX. 
# EDA-
- [ ] Resolved initial visualization challenges caused by gaps in the date range by creating a “Date Lookup” table using DAX and establishing a relationship with the original Crime table for continuous date representation.   
- [ ] Developed several DAX measures, including:
  - [ ] Total crimes committed
  - [ ] Unsolved crimes
  - [ ] Unsolved crime percentage
  - [ ] All crimes
  - [ ] Case Duration in Days(Calculated Column)
  - [ ] Average Days taken to Solve
  - [ ] Average Police Deployed
# CONCLUSION-
- [ ] Analyzed a total of 40,160 crimes, with nearly 50.04% of cases remaining unsolved.
- [ ] Arson was the most frequently reported offence.
- [ ] Females were the most affected gender (55.83% of victims), followed by males (33.38%) and other gender identities (10.79%).
- [ ] Ages 22 and 26 were equally the most impacted.
- [ ] While arson had the highest individual numbers, violent crimes collectively surpassed fire-related incidents; traffic fatalities were the lowest among major categories.
- [ ] Delhi reported the highest total crimes (5,400), followed by Mumbai (4,415) and Bangalore (3,588).
- [ ] Most cities had an unsolved crime rate close to 50%, with Delhi slightly higher at 51%, and Bangalore and Chennai just above 50%.
- [ ] In all top cities, solved crimes remained fewer than half of the total, highlighting persistent challenges in crime resolution.
- [ ] Police deployment averages 10 officers across crimes. Yet, case resolution varies greatly, up to 450 days for homicide and sexual assault, but about 50 days for others, indicating resolution depends on crime type, not the number of officers deployed.
- [ ] 
<img width="1286" height="727" alt="Screenshot 2025-07-25 215412" src="https://github.com/user-attachments/assets/6448a25a-a9a3-46a5-802c-ea4c6f8b2052" />


