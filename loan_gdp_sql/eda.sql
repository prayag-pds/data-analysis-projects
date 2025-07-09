--total loans due of country to the latest available GDP data
WITH index_gdp AS (
    SELECT country, year, gdp,
           ROW_NUMBER() OVER (PARTITION BY country ORDER BY year DESC) as rn
    FROM gdp_data
    WHERE gdp IS NOT NULL
)
SELECT 
    ibrd.country,
	SUM(ibrd.due_usd) AS ibrd_due,
	SUM(ida.due_usd) AS ida_due,
    SUM(ibrd.due_usd + ida.due_usd) AS total_due,
    ig.gdp AS latest_gdp,
	ROUND(SUM(ibrd.due_usd + ida.due_usd)/ig.gdp, 7) AS due_vs_gdp,
    ig.year AS gdp_year
FROM ibrd_loans_latest AS ibrd
JOIN ida_loans_latest AS ida 
	ON ibrd.country = ida.country AND ibrd.year = ida.year
JOIN index_gdp AS ig 
	ON ibrd.country = ig.country AND ig.rn = 2
--WHERE ibrd.region LIKE '%SOUTH ASIA%'
GROUP BY ibrd.country, ig.gdp, ig.year
ORDER BY due_vs_gdp DESC
LIMIT 10
.
------------------------------------------------------------------------------------
.
--year on year percent change
WITH all_years AS (
	SELECT DISTINCT year FROM ibrd_loans_latest
	UNION
	SELECT DISTINCT year FROM ida_loans_latest
),
country_years AS (
	SELECT 'India' AS country,
	year
	FROM all_years
),
all_loans AS (
	SELECT 
		cy.country,
		cy.year,
		SUM(COALESCE(ibrd.disbursed_amount_usd, 0)) AS ibrd_loans,
		SUM(COALESCE(ida.disbursed_amount_usd, 0)) AS ida_loans,
		SUM(COALESCE(ibrd.disbursed_amount_usd, 0) + COALESCE(ida.disbursed_amount_usd, 0)) AS total_loans
	FROM country_years AS cy
	LEFT JOIN ibrd_loans_latest AS ibrd
		ON cy.country = ibrd.country AND cy.year = ibrd.year
	LEFT JOIN ida_loans_latest AS ida
		ON cy.country = ida.country AND cy.year = ida.year
	WHERE cy.country = 'India'
	GROUP BY cy.country, cy.year
		
)
SELECT 
	country, 
	year,
	total_loans AS current_year_loans,
	LAG(total_loans) OVER ( PARTITION BY country ORDER BY year) AS previous_year_loans,
	--year on year amount
	LAG(total_loans) OVER ( PARTITION BY country ORDER BY year) - total_loans AS yoy_change_amount,
	--yoy percent
	CASE
		WHEN LAG(total_loans) OVER (PARTITION BY country ORDER BY year) = 0
			THEN NULL
		ELSE ROUND((LAG(total_loans) OVER ( PARTITION BY country ORDER BY year) - total_loans) / LAG(total_loans) OVER ( PARTITION BY country ORDER BY year), 5)
		END AS yoy_change_percent 
FROM all_loans
ORDER BY country, year
.
------------------------------------------------------------------------------------
.
--loan to gdp ratio
WITH all_years AS (
    SELECT DISTINCT year FROM ibrd_loans_latest
    UNION
    SELECT DISTINCT year FROM ida_loans_latest
    UNION
    SELECT DISTINCT year FROM gdp_data
),
country_years AS (
    SELECT 
        'India' as country,
        year
    FROM all_years
)
SELECT cy.country,
    cy.year,
    COALESCE(gdp.gdp, 0) as gdp,
    COALESCE(SUM(ibrd.disbursed_amount_usd), 0) AS ibrd_loan,
    COALESCE(SUM(ida.disbursed_amount_usd), 0) AS ida_loan,
    COALESCE(SUM(ibrd.disbursed_amount_usd), 0) + COALESCE(SUM(ida.disbursed_amount_usd), 0) AS total_loan,
    CASE 
        WHEN COALESCE(gdp.gdp, 0) = 0 THEN 0
        ELSE ROUND(((COALESCE(SUM(ibrd.disbursed_amount_usd), 0) + COALESCE(SUM(ida.disbursed_amount_usd), 0)) / gdp.gdp), 5)
    END AS loan_to_gdp_ratio
FROM country_years AS cy
LEFT JOIN gdp_data gdp 
    ON cy.country = gdp.country AND cy.year = gdp.year
LEFT JOIN ibrd_loans_latest ibrd 
    ON cy.country = ibrd.country AND cy.year = ibrd.year
LEFT JOIN ida_loans_latest ida 
    ON cy.country = ida.country AND cy.year = ida.year
WHERE cy.country LIKE '%India%'
GROUP BY cy.country, cy.year, gdp.gdp
ORDER BY cy.year
