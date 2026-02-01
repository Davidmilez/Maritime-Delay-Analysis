/*
Project: Maritime Delay Analysis
Author: David
Tools: SQL Server, Excel, Python
Description:
This SQL script analyzes maritime vessel delays using a fact table
and a delay reason dimension table. It includes exploratory analysis,
delay classification, and delay reason impact analysis.
*/

-- =====================================================
-- 1. DATA OVERVIEW & VALIDATION
-- =====================================================

-- Total number of records in maritime operations fact table
SELECT COUNT(*) AS total_rows
FROM dbo.maritime_operations_fact;

-- Preview first 10 records from fact table
SELECT TOP 10 *
FROM dbo.maritime_operations_fact;

-- Total number of delay reasons in dimension table
SELECT COUNT(*) AS total_reasons
FROM dbo.delay_reasons_dim;

-- Preview delay reasons dimension table
SELECT *
FROM dbo.delay_reasons_dim;


-- =====================================================
-- 2. DELAY STATUS DISTRIBUTION
-- =====================================================

-- Distribution of vessels by delay status (On Time vs Late)
SELECT
Delay_Status,
COUNT(*) AS vessel_count,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM dbo.maritime_operations_fact
GROUP BY Delay_Status;


-- =====================================================
-- 3. DELAY SEVERITY ANALYSIS
-- =====================================================

-- Average delay days for delayed vessels only
SELECT
ROUND(AVG(Delay_Days), 2) AS avg_delay_days
FROM dbo.maritime_operations_fact
WHERE Delay_Days > 0;


-- =====================================================
-- 4. PORT-LEVEL DELAY ANALYSIS
-- =====================================================

-- Average delay by port
SELECT
Port,
COUNT(*) AS calls,
ROUND(AVG(Delay_Days), 2) AS avg_delay
FROM dbo.maritime_operations_fact
GROUP BY Port
ORDER BY avg_delay DESC;

