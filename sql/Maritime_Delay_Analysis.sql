SELECT COUNT(*) AS total_rows
FROM dbo.maritime_operations_fact;

SELECT TOP 10 *
FROM dbo.maritime_operations_fact;

SELECT COUNT(*) AS total_reasons
FROM dbo.delay_reasons_dim;

SELECT *
FROM dbo.delay_reasons_dim;

SELECT
Delay_Status,
COUNT(*) AS vessel_count,
ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM dbo.maritime_operations_fact
GROUP BY Delay_Status;

SELECT
ROUND(AVG(Delay_Days), 2) AS avg_delay_days
FROM dbo.maritime_operations_fact
WHERE Delay_Days > 0;

SELECT
Port,
COUNT(*) AS calls,
ROUND(AVG(Delay_Days), 2) AS avg_delay
FROM dbo.maritime_operations_fact
GROUP BY Port
ORDER BY avg_delay DESC;

