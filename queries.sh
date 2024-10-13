#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"

# แสดงชื่อของแชมป์ทั้งหมด
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id=games.winner_id WHERE round='Final' ORDER BY year")"

# แสดงชื่อทีมที่เข้าแข่งขันในรอบชิงชนะเลิศครั้งเดียว
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id=games.winner_id OR teams.team_id=games.opponent_id GROUP BY name HAVING COUNT(*) = 1")"

# แสดงจำนวนประตูที่ชนะมากที่สุด
echo "$($PSQL "SELECT MAX(winner_goals) FROM games")"

# แสดงค่าเฉลี่ยของประตูที่ชนะ
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

# แสดงค่าเฉลี่ยของประตูที่ชนะในรอบชิงชนะเลิศ
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games WHERE round='Final'")"

# แสดงชื่อทีมที่ได้แชมป์
echo "$($PSQL "SELECT name FROM teams INNER JOIN games ON teams.team_id=games.winner_id WHERE round='Final'")"
