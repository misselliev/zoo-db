/*List each country name where the population is larger than that of 'Russia'.*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

/*Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/
select name from world where continent='Europe' AND gdp/population>(Select gdp/population from world where name='United Kingdom');

/*List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.*/
select name, continent from world where continent in 
(select continent from world where name in('Argentina', 'Australia'))order by name;

/*Which country has a population that is more than Canada but less than Poland? Show the name and the population.*/
select name, population from world where population between 
(select population from world where name='Canada') AND (select population from world where name='Poland') AND  name NOT IN ('Canada', 'Poland'); 

/*Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.*/
select name, concat(round(population/
(select population from world where name = 'Germany')*100,0), '%')
from world where continent = 'Europe';

/*Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)*/
select name from world where gdp > all (select gdp from world where continent ='Europe' and gdp is not null );

/*Find the largest country (by area) in each continent, show the continent, the name and the area:*/
SELECT continent, name, area FROM world 
  WHERE area in
    (SELECT max(area) from world group by continent);

/*List each continent and the name of the country that comes first alphabetically.*/
SELECT continent, name FROM world x 
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);
  
/*Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.*/
SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0);

/*Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.*/
SELECT a.name, a.continent FROM world AS a
	WHERE a.population/3 > ALL(
		SELECT b.population FROM world AS b
			WHERE a.continent = b.continent AND
			a.name <> b.name);
