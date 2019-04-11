/*Change the query shown so that it displays Nobel prizes for 1950.*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1960

 /*Show who won the 1962 prize for Literature.*/
 SELECT winner
  FROM nobel
 WHERE yr = 1960
   AND subject = 'Physics'

/*Show the year and subject that won 'Albert Einstein' his prize.*/
select yr, subject from nobel where winner='Albert Einstein';

/*Give the name of the 'Peace' winners since the year 2000, including 2000.*/
select winner from nobel where subject='Peace' AND yr>=2000;

/*Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.*/
select * from nobel where subject='Literature' AND yr between 1980 and 1989;

/*Show all details of the presidential winners*/
SELECT * FROM nobel
 WHERE yr = 1970
  AND subject IN ('Cookery',
                  'Chemistry',
                  'Literature');

/*Show the winners with first name John*/
select winner from nobel where winner like 'John%';

/*Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.*/
  SELECT * FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980)
  OR (subject = 'Chemistry' AND yr = 1984);
  
/*Show the winners for 1980 excluding the Chemistry and Medicine*/
select * from nobel where yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

/*Show who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)*/
select * from nobel where (subject  = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr >= 2004);

/*Find all details of the prize won by PETER GRÜNBERG*/
select * from nobel where winner LIKE 'peter gr%nberg';

/*Find all details of the prize won by EUGENE O'NEILL*/
select * from nobel where winner LIKE 'EUGENE O''NEILL';

/*List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.*/
SELECT winner, yr, subject from nobel where winner LIKE 'sir%' ORDER BY yr DESC, winner;

/*Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.*/
SELECT winner, subject
  FROM nobel where yr = 1984
  ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner;