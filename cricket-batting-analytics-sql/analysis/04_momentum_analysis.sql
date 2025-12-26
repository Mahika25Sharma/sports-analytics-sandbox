/*
4. Which player shows sustained momentum?
-- Calculate number of consistent good innings (Runs >= 50) by each player
*/

-- Provide rank to all innings for each player
WITH Ranked_Innings AS (
SELECT p.Player_Id, p.Player_Name, i.Runs, m.Start_Date,
	   ROW_NUMBER() OVER (PARTITION BY p.Player_Id ORDER BY m.Start_Date) AS original_rn
FROM players p INNER JOIN innings i ON p.Player_Id = i.Player_Id
		 INNER JOIN matches m ON i.Match_Id = m.Match_Id
),
-- Provide rank to all good innings for each player
Good_innings_ranked AS (
SELECT Player_Id, Player_Name, Runs, Start_Date, original_rn, ROW_NUMBER() OVER (PARTITION BY Player_Id ORDER BY Start_Date) AS good_innings_rn
FROM (
	SELECT Player_Id, Player_Name, Runs, Start_Date,original_rn
	FROM Ranked_Innings
	WHERE Runs >= 50
		 ) AS t
),
streak_islands AS (
SELECT Player_Id, Player_Name, Runs, Start_Date, 
	   (original_rn - good_innings_rn) AS island_key -- Difference b/w Rank in all innings and Rank in good innings will be constant per streak
FROM Good_innings_ranked
)

SELECT  Player_Name, MIN(Start_Date) AS Streak_Start,
		MAX(Start_Date) AS Streak_End, COUNT(*) AS Streak_Length
FROM streak_islands
GROUP BY Player_Id, Player_Name, island_key
