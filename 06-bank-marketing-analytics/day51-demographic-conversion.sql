-- Day 47: Conversion by Demographics

-- Solution
--------------------------------------------------
-- 1️⃣ Conversion by Age Group
--------------------------------------------------


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


-- Inisghts:
-- * 
-- * 

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Credit Scoring for Borrowers in Bank
