-- Day 40: Kaggle Dataset Exploration — Bank Marketing Analytics
-- Dataset: Credit Scoring for Borrowers in Bank

-- Columns:

-- age, job, marital_status, education_level, has_credit_defult, 
-- balance, has_housing_loan, has_personal_loan, 
-- contact_type, contact_day, contact_month, call_duration_seconds, 
-- campaign_contacts, days_since_last_contact, previous_contacts, 
-- previous_campaign_outcome, subscribed

--------------------------------------------------
-- 1. Total Clients
--------------------------------------------------
SELECT
    COUNT(*) AS total_clients
FROM credit_scoring;

--------------------------------------------------
-- 2. Subscription Rate
--------------------------------------------------
SELECT
    SUM(CASE WHEN subscribed = 'yes' THEN 1 ELSE 0 END) * 1.0
    / COUNT(*) AS subscription_rate
FROM credit_scoring;

--------------------------------------------------
-- 3. Average Balance
--------------------------------------------------
SELECT
    AVG(balance) AS avg_balance
FROM credit_scoring;

--------------------------------------------------
-- 4. Credit Defult Rate
--------------------------------------------------
SELECT
    SUM(CASE WHEN has_credit_defult = 'yes' THEN 1 ELSE 0 END) * 1.0
    / COUNT(*) AS defult_rate
FROM credit_scoring;

--------------------------------------------------
-- 5. Loan Distribution
--------------------------------------------------
SELECT
    has_housing_loan,
    has_personal_loan,
    COUNT(*) AS customers
FROM credit_scoring
GROUP BY has_housing_loan, has_personal_loan;

--------------------------------------------------
