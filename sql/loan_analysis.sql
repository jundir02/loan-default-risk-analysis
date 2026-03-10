-- Loan Default Risk Analysis
-- SQL Queries for Loan Portfolio Analysis

-- 1 Total Loan Portfolio
SELECT 
COUNT(*) AS total_loans,
AVG(loan_amount) AS avg_loan_amount,
SUM(loan_amount) AS total_loan_value
FROM loans;

-- 2 Loan Distribution by Region
SELECT 
region,
COUNT(*) AS total_loans,
AVG(loan_amount) AS avg_loan
FROM loans
GROUP BY region
ORDER BY total_loans DESC;

-- 3 Average Income by Loan Purpose
SELECT 
loan_purpose,
AVG(income) AS avg_income,
COUNT(*) AS total_borrowers
FROM loans
GROUP BY loan_purpose
ORDER BY avg_income DESC;

-- 4 Credit Score Distribution
SELECT 
credit_score,
COUNT(*) AS total_loans
FROM loans
GROUP BY credit_score
ORDER BY credit_score DESC;

-- 5 Average Loan by Age
SELECT 
age,
COUNT(*) AS total_loans,
AVG(loan_amount) AS avg_loan
FROM loans
GROUP BY age
ORDER BY avg_loan DESC;

-- 6 Loan Risk by LTV Category
SELECT 
CASE 
WHEN ltv < 60 THEN 'Low LTV'
WHEN ltv BETWEEN 60 AND 80 THEN 'Medium LTV'
ELSE 'High LTV'
END AS ltv_category,
COUNT(*) AS total_loans
FROM loans
GROUP BY ltv_category;

-- 7 Interest Rate Analysis
SELECT 
loan_type,
AVG(rate_of_interest) AS avg_interest_rate
FROM loans
GROUP BY loan_type;

-- 8 Property Value vs Loan Amount
SELECT 
AVG(property_value) AS avg_property_value,
AVG(loan_amount) AS avg_loan_amount
FROM loans;

-- 9 Borrower Income Segmentation
SELECT 
CASE
WHEN income < 50000 THEN 'Low Income'
WHEN income BETWEEN 50000 AND 100000 THEN 'Middle Income'
ELSE 'High Income'
END AS income_segment,
COUNT(*) AS total_borrowers
FROM loans
GROUP BY income_segment;

-- 10 High Risk Borrower Detection
SELECT 
id,
income,
credit_score,
ltv,
dtir1,
loan_amount
FROM loans
WHERE credit_score < 600
AND ltv > 80
AND dtir1 > 40
ORDER BY credit_score ASC;