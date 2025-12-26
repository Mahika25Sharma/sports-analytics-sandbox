/*
2. Who is currently in form?
-- Recent matches using rolling average [last 3, 5, or 10 innings]
   Calculate the rolling average of last 5 innings based on StartDate and compare alongside career average
   Add Case statement to determine whether player is in form or out of form
*/

-- CTE to calculate current (last 5 innings) Average of players
WITH Players_Current_Averages AS (
SELECT p.Player_Name,m.Start_Date, i.Runs,
       ROUND(AVG(i.Runs) OVER(PARTITION BY p.Player_Name ORDER BY m.Start_Date 
	                    ROWS BETWEEN 4 PRECEDING AND CURRENT ROW), 2) AS Average_Last_5_Innings,
	   ROUND(AVG(i.Runs) OVER(PARTITION BY p.Player_Name), 2) AS Career_Average
FROM players p INNER JOIN innings i ON p.Player_Id = i.Player_Id
INNER JOIN matches m ON i.Match_Id = m.Match_Id
)

SELECT Player_Name, Start_Date, Runs, 
       Average_Last_5_Innings, Career_Average,
       CASE WHEN Average_Last_5_Innings >= 60 THEN 'In-Form'
	   ELSE 'Out-Of-Form'
	   END AS Current_Form
FROM Players_Current_Averages
-- WHERE Start_Date > '2025-09-01'
ORDER BY Start_Date, Player_Name
