-- SQLite 3.25+; returns are ratios, not percentage points.
WITH r AS (SELECT date,price,price/LAG(price) OVER(ORDER BY date)-1 AS monthly_return FROM fact)
SELECT substr(date,1,4) AS year,COUNT(monthly_return) AS return_observations,
AVG(monthly_return) AS mean_monthly_return,MIN(monthly_return) AS worst_month FROM r GROUP BY 1 ORDER BY 1;