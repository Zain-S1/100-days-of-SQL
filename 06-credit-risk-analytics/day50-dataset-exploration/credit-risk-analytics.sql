-- Day 40: Kaggle Dataset Exploration — Credit Risk Analytics
-- Dataset: Credit Scoring for Borrowers in Bank

-- Columns:

-- age, job, marital, education, defult
-- balance, housing, loan, contact, day,
-- month, diration, campaign, pdays, 
-- previous, pouycome, y

--------------------------------------------------
-- 1. Total Clients
--------------------------------------------------
SELECT
    COUNT(*) AS total_clients
FROM credit_scoring;

--------------------------------------------------
-- 2. Subscription Rate
--------------------------------------------------


--------------------------------------------------
-- 3. Average Balance
--------------------------------------------------


--------------------------------------------------
-- 4. Defult Rate
--------------------------------------------------


--------------------------------------------------
-- 5. Loan Distribution
--------------------------------------------------


--------------------------------------------------
-- 6. Delay Rate by Delivery Mode
--------------------------------------------------
SELECT
    delivery_mode,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY delivery_mode
ORDER BY delay_rate DESC;

--------------------------------------------------
