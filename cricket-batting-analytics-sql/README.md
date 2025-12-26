# Cricket Batting Analytics using SQL
 
This project analyzes batting performance using advanced SQL analytics.
The goal is to evaluate consistency, form, risk, and momentum using realistic cricket match data.
 
## Data Model
- Players
- Matches
- Innings
 
The dataset simulates real international cricket performances.
 
## Analysis Performed
 
### 1. Batting Consistency
- Used average runs, standard deviation, and coefficient of variation
- Identified consistent performers beyond raw averages
 
### 2. Batting Form
- Calculated rolling averages (last 5 innings)
- Compared short-term form against career performance
 
### 3. Risk & Reliability
- Measured low-score frequency (Runs ≤ 20)
- Classified players into risk buckets using NTILE
 
### 4. Momentum & Streak Analysis
- Detected consecutive high-scoring streaks (Runs ≥ 50)
- Used gaps-and-islands patterns with window functions
 
## Skills Demonstrated
- Advanced SQL
- Window Functions
- CTEs
- Analytical problem solving
- Sports analytics thinking
 
