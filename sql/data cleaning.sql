-- =========================================================
-- PROJECT : BANKING CUSTOMER SEGMENTATION ANALYSIS
-- FILE    : 02_DATA_CLEANING
-- PURPOSE : DATA VALIDATION & DUPLICATE REMOVAL
-- =========================================================
USE Banking_Project;

-- =========================================================
-- AGE VALIDATION
-- =========================================================
SELECT *
FROM banking_customer_data
WHERE Age < 18
   OR Age > 100;

-- =========================================================
-- CREDIT SCORE VALIDATION
-- =========================================================
SELECT *
FROM banking_customer_data
WHERE Credit_Score < 300
   OR Credit_Score > 900;

-- =========================================================
-- NEGATIVE BALANCE CHECK
-- =========================================================
SELECT *
FROM banking_customer_data
WHERE Balance < 0;

-- =========================================================
-- NEGATIVE LOAN AMOUNT CHECK
-- =========================================================
SELECT *
FROM banking_customer_data
WHERE Loan_Amount < 0;

-- =========================================================
-- CHURN RISK VALIDATION
-- =========================================================
SELECT DISTINCT Churn_Risk
FROM banking_customer_data;

-- =========================================================
-- CREATE CLEAN DATASET
-- =========================================================
CREATE TABLE banking_customer_data_clean AS
SELECT DISTINCT *
FROM banking_customer_data;

-- =========================================================
-- CLEAN DATASET RECORD COUNT
-- =========================================================
SELECT COUNT(*) AS Clean_Records
FROM banking_customer_data_clean;

-- =========================================================
-- REVALIDATION AFTER CLEANING
-- =========================================================
SELECT COUNT(*) AS Invalid_Age_Records
FROM banking_customer_data_clean
WHERE Age < 18
   OR Age > 100;

SELECT COUNT(*) AS Invalid_Credit_Score_Records
FROM banking_customer_data_clean
WHERE Credit_Score < 300
   OR Credit_Score > 900;

SELECT COUNT(*) AS Negative_Balance_Records
FROM banking_customer_data_clean
WHERE Balance < 0;

SELECT COUNT(*) AS Negative_Loan_Records
FROM banking_customer_data_clean
WHERE Loan_Amount < 0;
  
