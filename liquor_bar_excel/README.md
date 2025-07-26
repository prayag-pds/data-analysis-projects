# ANALYSIS OF LIQUOR BAR PURCHASES   
# Author: Prayag Das   
E-Mail: prayag.pds@gmail.com   
Website: https://prayagpds.wixsite.com/my-site-1   

Tool Used – Excel

## CONTENT-
1.	Introduction
2.	Data Description
3.	Data Preparation
4.	Exploratory Data Analysis
5.	Conclusion
6. Recommendation 

## INTRODUCTION-  
This project analyses the monthly stock data of liquor for the period from April 2021 to March 2024, aligning with the fiscal year that begins in April. The objective is to identify patterns in demand fluctuations, particularly periods of increase or decrease. So that stakeholders can better anticipate and prepare for potential changes in supply requirements.

## DATA DESCRIPTION-
- [ ] Source: Independently collected data (xlsx file Attached above). Some sensitive data have been removed
- [ ] Time Frame: April 2021 – March 2024
- [ ] Size: 520 Rows & 11 Columns
- [ ] Variables: Date, Invoice no., Opening Balance, Credit Amount, **BL**, **LPL**, Sale amount, VAT(Tax), TCS(tax), Grand Total, Closing Balance.    
      **BL** & **LPL** : Volumes in Liters
  - [ ] Beer - BL unit = Liters
  - [ ] Liquor - LPL unit = 0.75 Liters **(LPL = 0.75 BL)**

## DATA PREPARATION
- [ ] **Invoice Type**: Invoice numbers were categorized into 2 types, OSBC: Govt’s Invoice & INV(BAL): Retailer’s Invoice.    
      Renamed them for better understanding and usability.    
      `=IF(ISNUMBER(SEARCH("OSBC", C2)), "GOVT", "RETAIL")`    
- [ ] **Item Type**: Categorised the 2 types of alcohols, Beer & Liquor by referencing the BL & LPL columns respectively.    
      `=IF($G2<>0,"Beer",IF($H2<>0,"Liquor","-"))`    
- [ ] **Normalised unit**: As BL is normal Liters and LPL is 0.75 times that, so added a normalised Liter column.
      `=IF($G2<>0,$G2,IF($H2<>0,$H2/0.75,0))`

## EXPLORATORY DATA ANALYSIS
- [ ] **Seasonal Demand:**
      <img width="1001" height="355" alt="image" src="https://github.com/user-attachments/assets/c86622d7-1a08-417f-a2d2-edb864f285c7" />
    - [ ] **Beer’s demand** is higher during the **summers**, whereas **Liquor’s demand** increases during the **winters**.
Liquor, likes of whisky and rum.
    - [ ] The initial spike occurred due to complete stock refilling.   
    - [ ] Overall, **customers prefer beer** over Liquor.   
- [ ] **Price Comparison:**
      <img width="1016" height="341" alt="image" src="https://github.com/user-attachments/assets/c0f0e8df-9123-410f-9136-3f7cc5fc5973" />   
    - [ ] The graph shows that although the **volume of beer** brought in is **higher**, **liquors are priced significantly higher.**

## CONCLUSION
- [ ] Beer demand peaks during the summer months, while demand for liquor (such as whisky and rum) increases in winter.
- [ ] The early spike in purchase data corresponds to a period of complete stock refilling, not necessarily a surge in customer demand.
- [ ] Throughout the period analysed, beer is the preferred choice among customers compared to liquor.
- [ ] Despite a higher volume of beer transactions, liquors are consistently priced much higher than beers.

## RECOMMENDATIONS:
- [ ] As the fiscal year ends, stockpiling the Liquors beforehand could be beneficial as they have indefinite shelf life. Rather than paying a hefty amount at a time, especially when combined with the substantial cost of license renewal, it would be wise to stockpile.
- [ ] Beer should be purchased when the demand rises, given its limited shelf life, depending on the type. Also, they are significantly affordable than Liquor.
- [ ] These strategies are expected to enhance both financial efficiency and inventory management.
