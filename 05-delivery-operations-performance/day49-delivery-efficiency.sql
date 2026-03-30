-- Day 49: Delivery Efficiency (Expected vs Actual)

-- Question:
-- How accurate are delivery time estimates?

-- Solution
--------------------------------------------------
-- 1️⃣ Overall Delivery Accuracy
--------------------------------------------------
SELECT
    AVG(delivery_time_hours - expected_time_hours) AS avg_delay_hours,
    AVG(ABS(delivery_time_hours - expected_time_hours)) AS avg_absolute_delay
FROM deliveries;

--------------------------------------------------
-- 2️⃣ Rating by Delivery Time Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN delivery_time_hours < 3 THEN '< 3 hrs'
        WHEN delivery_time_hours < 6 THEN '3-6 hrs'
        WHEN delivery_time_hours < 10 THEN '6-10 hrs'
        ELSE '10+ hrs'
    END AS time_bucket,
    AVG(delivery_rating) AS avg_rating
FROM deliveries
GROUP BY time_bucket
ORDER BY avg_rating DESC;

--------------------------------------------------
-- 3️⃣ Rating by Delivery Cost Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN delivery_cost < 500 THEN 'Low Cost'
        WHEN delivery_cost < 1000 THEN 'Medium Cost'
        ELSE 'High Cost'
    END AS cost_bucket,
    AVG(delivery_rating) AS avg_rating
FROM deliveries
GROUP BY cost_bucket
ORDER BY avg_rating DESC;

-- Inisghts:
-- * Delays are the single biggest driver of customer dissatisfaction
-- * Ratings decrease as cost increases

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
