-- Day 46: Package Weight & Type Impact

-- Question:
-- How do package weight and type affect delivery performance?

-- Solution
--------------------------------------------------
-- 1️⃣ Performance by Package Type
--------------------------------------------------
SELECT
    package_type,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    AVG(delivery_rating) AS avg_rating,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY package_type
ORDER BY delay_rate DESC;

--------------------------------------------------
-- 2️⃣ Performance by Weight Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN package_weight_kg < 1 THEN '0-1 kg'
        WHEN package_weight_kg < 5 THEN '1-5 kg'
        WHEN package_weight_kg < 10 THEN '5-10 kg'
        ELSE '10+ kg'
    END AS weight_bucket,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY weight_bucket
ORDER BY delay_rate DESC;

-- Insights:
-- * High-priority categories perform worse (Pharmacy & groceries)
--   → Likely due to urgency pressures or higher service expectations.
-- * Speed and cost don’t fully explain delays (by type)
--   - Clothing → slowest (6.40) but not worst delays.
--   - Fragile items → fastest (6.15) and low delays.
-- * Although heavier shipments are usually expected to be harder, lighter packages perform worse.
--   Maybe because heavier shipments are planned more carefully, while lighter shipments have
--   high-volume → more stops → more exposed to delays.

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
