-- =========================================================
-- PROJECT : BANKING CUSTOMER SEGMENTATION ANALYSIS
-- FILE    : 03_EXPLORATORY_DATA_ANALYSIS
-- PURPOSE : CUSTOMER DISTRIBUTION ANALYSIS
-- =========================================================

-- CUSTOMER DISTRIBUTION BY CITY
SELECT City,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY City
ORDER BY Customers DESC;

-- CUSTOMER DISTRIBUTION BY GENDER
SELECT Gender,
       COUNT(*) AS Customers
FROM banking_customer_data_clean
GROUP BY Gender;

-- CUSTOMER DISTRIBUTION BY AGE GROUP
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '55+'
    END AS Age_Group,

    COUNT(*) AS Customers

FROM banking_customer_data_clean

GROUP BY Age_Group

ORDER BY Customers DESC;