-- =========================================================
-- PROJECT : BANKING CUSTOMER SEGMENTATION ANALYSIS
-- FILE    : 05_ADVANCED_SQL
-- PURPOSE : CTE, WINDOW FUNCTIONS & VIEWS
-- =========================================================

-- CUSTOMER BALANCE RANKING

SELECT Customer_ID,
       City,
       Balance,
       RANK() OVER(
           ORDER BY Balance DESC
       ) AS Balance_Rank
FROM banking_customer_data_clean;

-- TOP 5 CUSTOMERS IN EACH CITY

SELECT *
FROM
(
    SELECT Customer_ID,
           City,
           Balance,
           RANK() OVER(
               PARTITION BY City
               ORDER BY Balance DESC
           ) AS Rank_No
    FROM banking_customer_data_clean
) t
WHERE Rank_No <= 5;

-- CTE : CITY AVERAGE BALANCE

WITH city_balance AS
(
    SELECT City,
           AVG(Balance) AS Avg_Balance
    FROM banking_customer_data_clean
    GROUP BY City
)

SELECT *
FROM city_balance
ORDER BY Avg_Balance DESC;

-- VIEW : HIGH VALUE CUSTOMERS

CREATE VIEW high_value_customers AS
SELECT *
FROM banking_customer_data_clean
WHERE Balance > 500000;

SELECT *
FROM high_value_customers;