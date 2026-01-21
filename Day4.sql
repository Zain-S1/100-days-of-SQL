-- Day 4: Aggregations — Measuring Employee Work Time

-- Question:
-- How much total time did each employee spend working across all sessions?

-- Solution
SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
    AND recyclable = 'Y';

-- Source:
-- LeetCode 1757 — Recyclable and Low Fat Products
