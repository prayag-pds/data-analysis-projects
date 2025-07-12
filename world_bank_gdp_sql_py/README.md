# Analysis of South Asia's Top 3 Economies
# Author - Prayag Das
email - prayag.pds@gmail.com  
website - https://prayagpds.wixsite.com/my-site-1   

Tools Used    
- [ ] Cleaning: Python & PostgreSQL   
- [ ] Analysis: PostgreSQL & Tableau

## CONTENT-
1.	Introduction
2.	Data Description
3.	Data Preparation
4.	Exploratory Data Analysis
5.	Conclusion

## INTRODUCTION-   
This project examines the GDP and loans of individual countries. Mainly focused on 3 countries, i.e., India, Bangladesh, and Pakistan as they were once a single country. Focusing on economic development and the crisis sustained over the years after their democracy was established. Analyzing over 70 years of data up until 2024. It examines the relationship between the World Bank’s two departments, the International Bank for Reconstruction and Development (IBRD) and the International Development Association (IDA), and the individual GDPs of countries. The report highlights the year-over-year stats of countries and compares the loans to GDP. This analysis provides insights into the country’s financial stability and economic development.

## DATA DESCRIPTION-
Three datasets are used in this project.
1.	IBRD Statement of Loans and Guarantees
- [ ] Source: https://financesone.worldbank.org/ibrd-statement-of-loans-and-guarantees-latest-available-snapshot/DS00047
- [ ] Time Frame: 1950-2024
- [ ] Size: 9311 Rows & 29 Columns
- [ ] Variables: Region, country, borrower, loan status, interest rate, project name, original amount, repaid amount and other currency columns, board approval date and other date columns.
2.	IDA Statement of Credits, Grants and Guarantees
- [ ] Source: https://financesone.worldbank.org/ida-statement-of-credits-grants-and-guarantees-latest-available-snapshot/DS00001
- [ ] Time Frame: 1950-2024
- [ ] Size: 10864 Rows & 27 Columns
- [ ] Variables: Region, country, borrower, loan status, interest rate, project name, original amount, repaid amount and other currency columns, board approval date and other date columns.
3.	GDP
- [ ] Source: https://data.worldbank.org/indicator/NY.GDP.MKTP.CD
- [ ] Time Frame: 1960-2024
- [ ] Size: 266 Rows & 69 Columns
- [ ] Variables: Country Name, Country Code, Indicator Name, Indicator Code, Year from 1960 to 2024.

## DATA PREPARATION
- [ ] Unpivoted the wide-format GDP dataset using Python’s `pandas.melt()` to create a narrow format.   
- [ ] Created three tables in PostgreSQL: `ibrd_loans_latest`, `ida_loans_latest`, and `gdp_data`.   
- [ ] Imported individual CSV files into the respective PostgreSQL tables for further analysis.   
- [ ] Added a ‘year’ column to both `ibrd_loans_latest` and `ida_loans_latest` tables using SQL.

## EXPLORATORY DATA ANALYSIS
### GDP Analysis of Top 5 South Asian Countries -
<img width="1448" height="723" alt="Screenshot 2025-07-10 132944" src="https://github.com/user-attachments/assets/d8e59f4e-56e0-4da5-bc0d-1e222a7e5ae1" />    

- [ ] Analyzed GDP growth trends for the top 5 South Asian countries.
- [ ] Focused on the top 3 economies: India, Bangladesh, and Pakistan.
    - [ ] India: India’s GDP is significantly larger than all others combined.
        - [ ] Visible GDP dip in 2020 (from $2.836T to $2.675T) due to the pandemic.
        - [ ] The 1991 dip (from $321B to $270B) caused by rupee devaluation.
        - [ ] Steady and rapid growth post-2000.
    - [ ] Bangladesh: GDP position up to 2018 as the 3rd largest economy.
        - [ ] Overtook Pakistan in 2019 (GDP $351B vs. $321B).
        - [ ] Linear and consistent growth trend.
        - [ ] Historical context: previously part of Pakistan (East vs. West).
    - [ ] Pakistan: Current status as the 3rd largest economy in the region.
        - [ ] Gradual and saturated GDP growth compared to India and Bangladesh.
        - [ ] GDP decreases in 2019 and 2020 due to economic instability, declining reserves, tax hikes, currency devaluation, and political factors.

### Rate of Change of GDP - 
<img width="1451" height="724" alt="Screenshot 2025-07-10 141131" src="https://github.com/user-attachments/assets/b3c20ce5-ede8-4d9b-82a8-03654972e1c9" />   

- [ ] Analyzed the annual rate of change in GDP for the top 3 South Asian countries.
    - [ ] **India:**
        - [ ] Two major downturns in 1966 and 1991, both linked to rupee devaluation.
        - [ ] The 1991 crisis: extremely low foreign exchange reserves led to currency devaluation to boost exports.
    - [ ] **Bangladesh:**
        - [ ] Impact of 1971 independence, resulting in war-related destruction and economic collapse.
        - [ ] Economic reforms post-independence and the sharp GDP rise from $6B (1972) to $19B (1975).
        - [ ] The 1976 downturn after the leader’s assassination and the 1974 famine, with GDP falling to $10B.
        - [ ] Persistent inflation due to currency devaluation and supply issues.
    - [ ] **Pakistan:**
        - [ ] The 1971 separation from Bangladesh caused severe economic and structural damage.
        - [ ] Loss of territory, business sectors, and population, plus increased burden from refugees.
        - [ ] Ongoing political instability affecting growth.
        - [ ] The 2000 spike was linked to a 100% YoY change in loans, economic reforms, and debt negotiations.

### Year-on-Year World Bank Loan - 
<img width="1449" height="724" alt="Screenshot 2025-07-10 150110" src="https://github.com/user-attachments/assets/1e363efb-573f-4a73-a423-194b440fda67" />

- [ ] **India:**
    - [ ] Significant YoY loan change in 1961 (-1000%), linked to the launch of the 3rd Five-Year Plan and consortium support.
    - [ ] Major loan increases in the 2000s for infrastructure development.
    - [ ] The 2020 spike in loans due to the COVID-19 pandemic.

- [ ] **Bangladesh:**
    - [ ] Start of World Bank loans post-independence (1971).
    - [ ] The 1975 large loan following the 1974 famine and severe floods.
    - [ ] The 1994 loan increase for infrastructure, especially river projects.

- [ ] **Pakistan:**
    - [ ] Five major loan events:
        - [ ] 1964: Large loan (16% of GDP) for highways and railways.
        - [ ] 1982: Loan for the agriculture sector.
        - [ ] 1997: Loan for banking and infrastructure development.
        - [ ] 2004 & 2005: Loans for earthquake relief (magnitudes 5.7 and 7.6).
        - [ ] 2012: Loans for infrastructure, education, health, and governance.
    - [ ] Loan increases in 2019 & 2020 tied to economic instability and reliance on bailouts.

### World Bank Loan Comparison - 

- [ ] Compared World Bank loan data for the top 3 South Asian economies (2023):
    - [ ] **India:** Highest total loan amount among the three countries.
        - [ ] Total due: $199,226,629,408.00
        - [ ] Loan as percentage of GDP: 5.58%
    - [ ] **Pakistan:** Loan burden is the highest relative to its economy.
        - [ ] Total due: $56,156,756,272.58
        - [ ] Loan as percentage of GDP: 16.62%
    - [ ] **Bangladesh:** Minimal World Bank loan burden.
        - [ ] Total due: $1,521,600.75
        - [ ] Loan as percentage of GDP: 0.00%

- [ ] **While India has the largest loan volume, Pakistan’s loans are a much higher share of its GDP, indicating greater vulnerability.**
- [ ] **Bangladesh has a negligible loan burden in comparison to its regional peers.**

## CONCLUSION

#### Overview

- [ ] **India, Bangladesh, and Pakistan** have followed distinct economic paths shaped by policy decisions, external shocks, and structural reforms.
- [ ] Their economic interactions and comparative performances significantly influence the South Asian region.

#### India

- [ ] Stands out as South Asia’s economic powerhouse, with a GDP far exceeding all its neighbors combined.
- [ ] Overcame major downturns in 1966 and 1991 (currency devaluation) and in 2020 (global pandemic).
- [ ] Since 2000, India’s growth has been robust and sustained, reflecting an expanding economic base and effective policy making.
- [ ] Demonstrates strong resilience and recovery from crises.

#### Bangladesh

- [ ] Achieved remarkable progress, overtaking Pakistan as the region’s second-largest economy in 2019.
- [ ] GDP growth has been linear and consistent, driven by successful economic reforms, export growth, and social development.
- [ ] Overcame severe setbacks in the 1970s (war, famine, political instability) through reliance on foreign aid and infrastructure investments.
- [ ] Maintains a relatively low external loan burden.

#### Pakistan

- [ ] Remains the third-largest economy in South Asia, but growth has been gradual and volatile.
- [ ] Economic history marked by frequent external shocks, political instability, and reliance on foreign loans and bailouts.
- [ ] Major downturns coincide with natural disasters, structural weaknesses, and fiscal crises.
- [ ] Loan burden is high relative to GDP (up to 16%), highlighting ongoing challenges in achieving sustainable growth and financial independence.

#### Comparative Insights

- [ ] **Loan Burden:**
    - [ ] India: Largest absolute loan volume, but manageable relative to GDP.
    - [ ] Pakistan: High debt-to-GDP ratio (16%), indicating vulnerability.
    - [ ] Bangladesh: Minimal loan burden compared to peers.
- [ ] **Resilience:** All three economies have shown the ability to recover from shocks (war, famine, devaluation, global crises), shaped by policy responses, external support, and structural reforms.
- [ ] **Growth Patterns:** Bangladesh’s steady rise, India’s rapid post-2000 expansion, and Pakistan’s periodic recoveries reflect the interplay between domestic choices and global conditions.

#### Recommendations

-  [ ] Political stability, effective governance, and prudent debt management are critical for sustained growth.
-  [ ] Regional collaboration and strategic investment are essential for long-term prosperity.
-  [ ] Sound economic management and resilience-building should remain priorities to withstand future crises.
