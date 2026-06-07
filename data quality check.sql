-- =========================================================
-- PROJECT : BANKING CUSTOMER SEGMENTATION ANALYSIS
-- FILE    : 01_DATA_QUALITY_CHECK
-- PURPOSE : DATA QUALITY ASSESSMENT
-- =========================================================
CREATE DATABASE Banking_Project;
USE Banking_Project;

-- =========================================================
-- TOTAL RECORD COUNT
-- =========================================================
SELECT COUNT(*) AS Total_Records
FROM banking_customer_data;

-- =========================================================
-- NULL VALUE CHECK
-- =========================================================
SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Credit_Score) AS Credit_Score_Not_Null,
    COUNT(Balance) AS Balance_Not_Null,
    COUNT(Monthly_Income) AS Monthly_Income_Not_Null
FROM banking_customer_data;

-- =========================================================
-- DUPLICATE CUSTOMER CHECK
-- =========================================================
SELECT Customer_ID,
       COUNT(*) AS Duplicate_Count
FROM banking_customer_data
GROUP BY Customer_ID
HAVING COUNT(*) > 1;

-- =========================================================
-- TOTAL DUPLICATE CUSTOMERS
-- =========================================================
SELECT COUNT(*) AS Total_Duplicate_Customers
FROM
(
    SELECT Customer_ID
    FROM banking_customer_data
    GROUP BY Customer_ID
    HAVING COUNT(*) > 1
) duplicates;

-- =========================================================
-- DATASET STRUCTURE
-- =========================================================
DESCRIBE banking_customer_data;

-- =========================================================
-- DATE FORMAT VALIDATION
-- =========================================================
SELECT Customer_Since
FROM banking_customer_data
LIMIT 10;