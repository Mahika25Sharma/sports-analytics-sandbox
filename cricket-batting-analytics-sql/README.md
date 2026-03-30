# Cricket Batting Analytics using SQL

An end-to-end SQL analytics project evaluating batting performance across four dimensions: consistency, form, risk, and momentum. Built on a synthetic dataset modelled on international cricket match structures (T20 format).

## Data Model
- Players
- Matches
- Innings
 
## Analysis modules

**01_consistency_analysis.sql** — Scores batters using average runs, standard deviation, and coefficient of variation. Surfaces consistent performers that raw averages miss.

**02_form_analysis.sql** — Calculates 5-innings rolling averages using window functions and compares short-term form against career baseline.

**03_risk_analysis.sql** — Measures low-score frequency (runs ≤ 20) and classifies players into reliability tiers using NTILE.

**04_momentum_analysis.sql** — Detects consecutive high-scoring streaks (runs ≥ 50) using a gaps-and-islands approach with LAG and conditional row numbering.

**Key SQL features used:** CTEs, window functions (STDDEV, NTILE, ROW_NUMBER, AVG OVER), rolling aggregations, conditional classification logic.
 
## Sample finding
