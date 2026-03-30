-- Day 48: Delay Risk Analysis

-- Question:
-- Which combinations of factors lead to the highest delay rates?

-- Solution
SELECT
    delivery_mode,
    weather_condition,
    vehicle_type,
    region,
    COUNT(*) AS total_deliveries,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) AS delayed_deliveries,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY
    delivery_mode,
    weather_condition,
    vehicle_type,
    region
HAVING COUNT(*) >= 50   -- filter small/noisy groups
ORDER BY delay_rate DESC
LIMIT 10;

-- Insights:
-- 🔴 Highest Risk
--    Express + (Stormy / Rainy) + Any Vehicle + High-density regions
--    → Delay rates: ~85%–96%
-- 🟠 Moderate Risk
--    Same-day + Bad Weather
--    → Delay rates: ~38%
-- 🟢 Lowest Risk
--    Standard / Two-day + Any Weather
--    → Delay rates: ~0%

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
