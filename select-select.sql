/*1. List each country name where the population is larger than that of 'Russia'.*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');

/*2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.*/
SELECT name FROM world WHERE continent='Europe' AND gdp/population>(SELECT gdp/population FROM world WHERE name='United Kingdom');

/*3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.*/
SELECT name, continent FROM world WHERE continent in 
(SELECT continent FROM world WHERE name in('Argentina', 'Australia'))order by name;

/*4. Which country has a population that is more than Canada but less than Poland? Show the name and the population.*/
SELECT name, population FROM world WHERE population between 
(SELECT population FROM world WHERE name='Canada') AND (SELECT population FROM world WHERE name='Poland') AND  name NOT IN ('Canada', 'Poland'); 

/*5. Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.*/
SELECT name, concat(round(population/
(SELECT population FROM world WHERE name = 'Germany')*100,0), '%')
FROM world WHERE continent = 'Europe';

/*6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)*/
SELECT name FROM world WHERE gdp > all (SELECT gdp FROM world WHERE continent ='Europe' and gdp is not null );

/*7. Find the largest country (by area) in each continent, show the continent, the name and the area:*/
SELECT continent, name, area FROM world 
  WHERE area in
    (SELECT max(area) from world group by continent);

/*8. List each continent and the name of the country that comes first alphabetically.*/
SELECT continent, name FROM world x 
WHERE name <= ALL(SELECT name FROM world y WHERE x.continent = y.continent);
  
/*9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.*/
SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0);

/*10. Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.*/
SELECT a.name, a.continent FROM world AS a
	WHERE a.population/3 > ALL(
		SELECT b.population FROM world AS b
			WHERE a.continent = b.continent AND
			a.name <> b.name);
