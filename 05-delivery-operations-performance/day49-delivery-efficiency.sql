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
-- 2️⃣ Accuracy by Delivery Mode
--------------------------------------------------
SELECT
    delivery_mode,
    AVG(delivery_time_hours - expected_time_hours) AS avg_delay_hours,
    AVG(ABS(delivery_time_hours - expected_time_hours)) AS avg_absolute_delay
FROM deliveries
GROUP BY delivery_mode
ORDER BY avg_absolute_delay DESC;

--------------------------------------------------
-- 3️⃣ Accuracy by Delivery Partner
--------------------------------------------------
SELECT
    delivery_partner,
    AVG(delivery_time_hours - expected_time_hours) AS avg_delay_hours,
    AVG(ABS(delivery_time_hours - expected_time_hours)) AS avg_absolute_delay
FROM deliveries
GROUP BY delivery_partner
ORDER BY avg_absolute_delay DESC;

--------------------------------------------------
-- 4️⃣ Accuracy by Distance Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN distance_km < 5 THEN '0-5 km'
        WHEN distance_km < 10 THEN '5-10 km'
        WHEN distance_km < 20 THEN '10-20 km'
        ELSE '20+ km'
    END AS distance_bucket,
    AVG(delivery_time_hours - expected_time_hours) AS avg_delay_hours,
    AVG(ABS(delivery_time_hours - expected_time_hours)) AS avg_absolute_delay
FROM deliveries
GROUP BY distance_bucket
ORDER BY avg_absolute_delay DESC;

-- Inisghts:
-- * Delays are the single biggest driver of customer dissatisfaction
-- * Ratings decrease as cost increases

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
