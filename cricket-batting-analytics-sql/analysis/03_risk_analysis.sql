/*
3. Bad innings frequency (risk analysis)
-- Percentage of low scores (less than 20) and total number of low scores [exclude players with very few innings]
   Sort by lowest to highest percent as the least to most risky
*/

WITH low_score_innings AS (
SELECT p.Player_Id, p.Player_Name,
	   SUM(CASE WHEN (i.Runs <= 20) THEN 1 ELSE 0 END) AS low_score_innings,
	   CAST(ROUND(SUM(CASE WHEN i.Runs <= 20 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Float) AS low_score_percent,
	   AVG(i.Runs) AS Average_Runs,
	   NTILE(3) OVER (ORDER BY SUM(CASE WHEN (i.Runs <= 20) THEN 1 ELSE 0 END)) AS risk_bucket
FROM players p INNER JOIN innings i
ON p.Player_Id = i.Player_Id
--INNER JOIN matches m ON i.Match_Id = m.Match_Id
GROUP BY p.Player_Id, Player_Name
HAVING COUNT(*) > 5 -- Exclude players with very few innings
)

SELECT Player_Id, Player_Name, low_score_innings, low_score_percent,
	   CASE WHEN risk_bucket = 1 THEN 'Low Risk'
	   WHEN risk_bucket = 2 THEN 'Medium Risk'
	   WHEN risk_bucket = 3 THEN 'High Risk'
	   END AS Reliability_status
FROM low_score_innings
ORDER BY low_score_percent ASC, Average_Runs DESC
