-- Day 52: Financial Profile & Conversion

-- Question:
-- How does weather condition affect delivery delays?

-- Solution
--------------------------------------------------
-- 1️⃣ Conversion by Account Balance Bucket
--------------------------------------------------
SELECT 
   CASE
      WHEN balance < 0 THEN 'Negative'
      WHEN balance < 1000 THEN '0-1K'
      WHEN balance < 5000 THEN '1K-5K'
      ELSE '5K+'
   END AS balance_group, 
   COUNT(*) AS total_clients,
   SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 1.0
   / COUNT(*) AS conversion_rate
FROM credit_scoring
GROUP BY balance_group
ORDER BY conversion_rate DESC;

--------------------------------------------------
-- 2️⃣ Conversion by Credit Defult
--------------------------------------------------


--------------------------------------------------
-- 3️⃣ Conversion by Loan Status
--------------------------------------------------


-- Insights:
-- * Stormy weather has the worst performance; with nearly 1 in 3+ deliveries delayed.
-- * Rain significantly impacts operations, only slightly better than stormy conditions.
-- * Fog causes moderate disruption, likely due to low visibility.

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Credit Scoring for Borrowers in Bank
