# Data Analysis of phone usage in metropolitan cities of India using Excel
# Author - Prayag Das
email - prayag.pds@gmail.com  
website - https://prayagpds.wixsite.com/my-site-1
# DATA DESCRIPTION
Source - https://www.kaggle.com/datasets/akashsharma0105/phone-usage-in-india
Size - 17000 rows and 16 columns
# DATA ANALYSIS
- [ ] Checked data for bias and confirmed samples are unbiased and equally taken
      ![image](https://github.com/user-attachments/assets/8d9bb85c-2f71-496b-b994-c74fde530969)

- [ ] Standardized brand and operating system entries using formulas  
      `=IF(E2 = "Nokia", "Feature", IF(E2 = "Apple", "iOS", "Android"))`
- [ ] Ensured: In India, Nokia only sells 'Feature' phones and 'iOS' is exclusive to 'Apple'
      ![image](https://github.com/user-attachments/assets/bae7565d-0e47-4eba-8292-186990a9e8ff)


### Analysis & Visualization

- [ ] Created Pivot Table for each column
- [ ] Applied conditional formatting (largest to smallest) by age
      ![image](https://github.com/user-attachments/assets/fe0f63e6-a838-4458-9028-5dfb667c56bb)

- [ ] Used `SUMIFS` to calculate metrics for different age groups (teens, 20s, 30s, 40s, 50s)   
      `=SUMIFS(L$4:L$49,$K$4:$K$49, ">=50")`   
      `=SUMIFS(L$4:L$49,$K$4:$K$49, ">=40", $K$4:$K$49, "<50")`   
      `=SUMIFS(L$4:L$49,$K$4:$K$49, ">=30", $K$4:$K$49, "<40")`   
      `=SUMIFS(L$4:L$49,$K$4:$K$49, ">=20", $K$4:$K$49, "<30")`   
      `=SUMIFS(L$4:L$49, $K$4:$K$49, "<20")`
      ![image](https://github.com/user-attachments/assets/acb44f88-b6c7-4f73-89ef-544326d53912)

- [ ] Created Pivot Chart to identify buying patterns
      ![image](https://github.com/user-attachments/assets/9cfeef9c-ef92-4ba2-a1d2-eaffbc3d8928)

- [ ] Created Pivot Chart for primary use case analysis
      ![image](https://github.com/user-attachments/assets/16eb6b2f-d00c-4ee3-968c-139a9cbb6725)

# CONCLUSION
### Usage & Spending Patterns
- [ ] Noted that individuals aged 58 exhibit the highest phone usage and spending metrics
- [ ] Identified that individuals aged 43 show the lowest engagement
- [ ] Observed that users in their 50s spend significantly more time on phones than other age groups
- [ ] Confirmed that users in their 40s, 30s, and 20s have relatively similar usage patterns

### Spending Behaviour
- [ ] Found that e-commerce purchases are led by female users, followed by other gender identities, with male users spending the least
- [ ] Verified that monthly recharge expenditures are fairly linear across all groups

### Primary Usage Trends
- [ ] Determined that people in their 50s dominate phone usage, including Education and Gaming activities

### Market Leadership
- [ ] Established that Nokia leads the market, maintaining a strong presence despite not being a smartphone
- [ ] Confirmed that Chinese brands dominate overall, indicating widespread adoption among consumers

