/*The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime.
Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'*/
SELECT matchid, player FROM goal 
  WHERE teamid LIKE '%GER';

/*Show id, stadium, team1, team2 for just game 1012*/
SELECT distinct id,stadium,team1,team2
  FROM game inner join goal 
on game.id = goal.matchid where matchid=1012;

/*Modify it to show the player, teamid, stadium and mdate for every German goal.*/
SELECT player,teamid,stadium,mdate
  FROM game JOIN goal ON (id=matchid) where teamid='GER';

/*Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'*/
SELECT team1, team2,player  FROM game JOIN goal ON (id=matchid) where player like 'Mario%';

/*Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10*/
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on teamid=id
 WHERE gtime<=10;

/*List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.*/
select mdate, teamname from game join eteam on (team1=eteam.id) where coach='Fernando Santos';

/*List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'*/
select player from game join goal on (id = goal.matchid)
where stadium='National Stadium, Warsaw';


/*The example query shows all goals scored in the Germany-Greece quarterfinal.
Instead show the name of all players who scored a goal against Germany.*/
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid!= 'GER';


/*Show teamname and the total number of goals scored.*/
SELECT teamname, count(player)
  FROM eteam JOIN goal ON id=teamid
 group by teamname;

/*Show the stadium and the number of goals scored in each stadium.*/
SELECT stadium, count(stadium)
  FROM game JOIN goal ON id=matchid
 group by stadium;

/*For every match involving 'POL', show the matchid, date and the number of goals scored.*/
SELECT matchid,mdate, count(teamid) FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') group by matchid, mdate;


/*For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'*/
SELECT matchid,mdate, count(teamid) FROM game JOIN goal ON matchid = id 
 WHERE teamid = 'GER' group by matchid, mdate;


/*List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.*/
SELECT mdate,
team1, 
sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END)score1,
team2,
sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END)score2
from game left JOIN goal ON (id = matchid)
GROUP BY mdate,team1,team2
order by mdate, matchid, team1, team2