-- =========================================================
-- PROJECT : BANKING CUSTOMER SEGMENTATION ANALYSIS
-- FILE    : 04_BUSINESS_ANALYSIS
-- PURPOSE : BUSINESS INSIGHTS
-- =========================================================

-- BUSINESS QUESTION 01
-- WHICH CITY HAS THE HIGHEST AVERAGE BALANCE?

SELECT City,
       ROUND(AVG(Balance),0) AS Avg_Balance
FROM banking_customer_data_clean
GROUP BY City
ORDER BY Avg_Balance DESC;

-- BUSINESS QUESTION 02
-- WHO ARE THE TOP 10 CUSTOMERS BY BALANCE?

SELECT Customer_ID,
       City,
       Balance
FROM banking_customer_data_clean
ORDER BY Balance DESC
LIMIT 10;

-- BUSINESS QUESTION 03
-- LOAN STATUS DISTRIBUTION

SELECT Loan_Status,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY Loan_Status;

-- BUSINESS QUESTION 04
-- TOTAL LOAN AMOUNT BY CITY

SELECT City,
       ROUND(SUM(Loan_Amount),0) AS Total_Loan
FROM banking_customer_data_clean
GROUP BY City
ORDER BY Total_Loan DESC;

-- BUSINESS QUESTION 05
-- CHURN RISK ANALYSIS

SELECT Churn_Risk,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY Churn_Risk;

-- BUSINESS QUESTION 06
-- FRAUD ANALYSIS

SELECT Fraud_Flag,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY Fraud_Flag;

-- BUSINESS QUESTION 07
-- ACCOUNT TYPE ANALYSIS

SELECT Account_Type,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY Account_Type;

-- BUSINESS QUESTION 08
-- HIGHEST BALANCE BY CITY

SELECT City,
       MAX(Balance) AS Highest_Balance
FROM banking_customer_data_clean
GROUP BY City;