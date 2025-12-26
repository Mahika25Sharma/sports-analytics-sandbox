/* 
Schema -> 
-- players: Player_Id, Player_Name, Country
-- matches: Match_Id, Start_Date, Ground, Opposition
-- innings: Inning_Id, Match_Id, Player_Id, Runs, Balls_Faced {Match_Id -> matches, Player_Id -> players}
*/

CREATE TABLE players (
Player_Id INT PRIMARY KEY,
Player_Name VARCHAR(50),
Country VARCHAR(50)
)

CREATE TABLE matches(
Match_Id INT PRIMARY KEY,
Start_Date DATE,
Ground VARCHAR(50),
Opposition VARCHAR(30)
)

CREATE TABLE innings(
Inning_Id INT PRIMARY KEY,
Match_Id INT,
Player_Id INT,
Runs INT,
Balls_Faced INT,
FOREIGN KEY (Match_Id) REFERENCES matches(Match_Id),
FOREIGN KEY (Player_Id) REFERENCES players(Player_Id)
)
