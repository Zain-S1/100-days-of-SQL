-- Day 47: Conversion by Demographics

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
-- * 
-- * 

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Credit Scoring for Borrowers in Bank
