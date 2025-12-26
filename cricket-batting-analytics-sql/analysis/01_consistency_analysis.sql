/*
1. Who are the most consistent batters overall?
-- Should have low variance, decent average [exclude players with very few innings]
Rank player on the basis of variance and average (Average - high to low, Variance - low to high)
Can also Calculate Coefficient of variance (StandDev/Avg)
*/

SELECT p.Player_Name, COUNT(*) AS Inning_Count, SUM(i.Runs) AS Total_Runs,
	   ROUND(AVG(i.Runs),2) AS Average, 
	   ROUND(STDEV(i.Runs),2) AS Runs_StDeviation,
	   ROUND(STDEV(i.Runs)/NULLIF(AVG(i.Runs),0),2) AS Coeff_Of_Variation
FROM players p INNER JOIN innings i
ON p.Player_Id = i.Player_Id
GROUP BY p.Player_Name
HAVING COUNT(*) > 5 -- Played more than 5 innings
ORDER BY 
Coeff_Of_Variation ASC,
Average DESC
