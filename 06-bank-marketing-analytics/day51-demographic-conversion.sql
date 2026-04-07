-- Day 51: Conversion by Demographics

-- Question:
-- Which demographic groups are most likely to subscribe?

-- Solution
--------------------------------------------------
-- 1️⃣ Conversion by Age Group
--------------------------------------------------
SELECT 
   CASE
      WHEN age < 30 THEN 'Under 30'
      WHEN age < 50 THEN '30-50'
      ELSE '+50'
   END AS age_group, 
   COUNT(*) AS total_clients,
   SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 1.0
   / COUNT(*) AS conversion_rate
FROM credit_scoring
GROUP BY age_group
ORDER BY conversion_rate DESC;

--------------------------------------------------
-- 2️⃣ Conversion by Job Type
--------------------------------------------------
SELECT 
   job, 
   COUNT(*) AS total_clients,
   SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 1.0
   / COUNT(*) AS conversion_rate
FROM credit_scoring
GROUP BY job
ORDER BY conversion_rate DESC;

--------------------------------------------------
-- 3️⃣ Conversion by Education Level
--------------------------------------------------
SELECT 
   education_level, 
   COUNT(*) AS total_clients,
   SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 1.0
   / COUNT(*) AS conversion_rate
FROM credit_scoring
GROUP BY education_level
ORDER BY conversion_rate DESC;

-- Inisghts:
-- * Under 30 has the highest conversion (17.60%), while despite being the largest segment, 
--   the 30–50 group has the lowest conversion (10.01%).
-- * Students (28.68%) and retired customers (22.79%) convert the most.
-- * Tertiary education has the highest conversion, and primary education has the lowest.
-- * The largest groups (30–50 and blue-collar) have lower conversion, showing room for improvement in targeting.

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Credit Scoring for Borrowers in Bank
