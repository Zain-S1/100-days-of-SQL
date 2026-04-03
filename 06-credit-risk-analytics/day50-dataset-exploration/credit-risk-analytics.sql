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
SELECT
    AVG(delivery_time_hours) AS avg_delivery_time
FROM deliveries;

--------------------------------------------------
-- 4. Defult Rate
--------------------------------------------------
SELECT
    AVG(delivery_cost) AS avg_delivery_cost
FROM deliveries;

--------------------------------------------------
-- 5. Average Customer Rating
--------------------------------------------------
SELECT
    AVG(delivery_rating) AS avg_delivery_rating
FROM deliveries;

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
