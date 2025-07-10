--create table for IBRD loans & Guarantees
CREATE TABLE ibrd_loans_latest (

	end_of_period VARCHAR(100),
	loan_number VARCHAR(100),
	region TEXT,
	country_code TEXT,
	country TEXT,
	borrower TEXT,
	guarantor_country_code TEXT,
	guarantor TEXT,
	loan_type TEXT,
	loan_status TEXT,
	interest_rate REAL,
	currency_of_commitment VARCHAR(500),
	project_id VARCHAR(250),
	project_name VARCHAR(500),
	original_amount_usd NUMERIC(30,2),
	cancelled_amount_usd NUMERIC(30,2),
	undisbursed_amount_usd NUMERIC(30,2),
	disbursed_amount_usd NUMERIC(30,2),
	repaid_usd NUMERIC(30,2),
	due_usd NUMERIC(30,2),
	exchange_adjustment_usd NUMERIC(30,2),
	borrower_obligation_usd NUMERIC(30,2),
	sold_third_party_usd NUMERIC(30,2),
	repaid_third_party_usd NUMERIC(30,2),
	due_third_party_usd NUMERIC(30,2),
	loans_held_usd NUMERIC(30,2),
	first_repayment_date VARCHAR(100),
	last_repayment_date VARCHAR(100),
	agreement_signing_date VARCHAR(100),
	board_approval_date VARCHAR(100),
	effective_date VARCHAR(100),
	closed_date VARCHAR(100),
	last_disbursement_date VARCHAR(100)
	
	
)
.
.
.
-- create table for IDA Credit, Grants & Guarantees
CREATE TABLE ida_credits_latest (

  end_of_period VARCHAR(100),
  credit_number VARCHAR(100),
  region TEXT,
  country_code TEXT,
  country TEXT,
  borrower TEXT,
  credit_status TEXT,
  service_rate REAL,
  currency_of_commitment VARCHAR(500),
  project_id VARCHAR(250),
  project_name VARCHAR(500),
  original_amount_usd NUMERIC(30,2),
  cancelled_amount_usd NUMERIC(30,2),
  undisbursed_amount_usd NUMERIC(30,2),
  disbursed_amount_usd NUMERIC(30,2),
  repaid_usd NUMERIC(30,2),
  due_usd NUMERIC(30,2),
  exchange_adjustment_usd NUMERIC(30,2),
  borrower_obligation_usd NUMERIC(30,2),
  sold_third_party_usd NUMERIC(30,2),
  repaid_third_party_usd NUMERIC(30,2),
  due_third_party_usd NUMERIC(30,2),
  credits_held_usd NUMERIC(30,2),
  first_repayment_date VARCHAR(100),
  last_repayment_date VARCHAR(100),
  agreement_signing_date VARCHAR(100),
  board_approval_date VARCHAR(100),
  effective_date VARCHAR(100),
  closed_date VARCHAR(100),
  last_disbursement_date VARCHAR(100)
  
)
.
.
.
--created table for GDP
CREATE TABLE gdp_data(
	country TEXT,
	country_code TEXT,
	indicator_name VARCHAR(100),
	indicator_code VARCHAR(100),
	year int,
	gdp NUMERIC
)
.
.
.
---Adding The tables of ibrd and ida with year column
--ibrd
--adding a column year by extracting from board_approval_date
ALTER TABLE ibrd_loans_latest
ADD COLUMN year INT
.
--setting year column with values from board_approval_date
UPDATE ibrd_loans_latest
SET YEAR = EXTRACT(YEAR FROM board_approval_date::DATE)
.
.
--ida
--adding a column year by extracting from board_approval_date
ALTER TABLE ida_loans_latest
ADD COLUMN year INT
.
--setting year column with values from board_approval_date
UPDATE ida_loans_latest
SET YEAR = EXTRACT(YEAR FROM board_approval_date::DATE)
