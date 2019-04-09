/*Show the name for the countries that have a population of at least 200 million.*/
SELECT name FROM world
WHERE population >= 200000000 

/*Give the name and the per capita GDP for those countries with a population of at least 200 million.*/
SELECT name, gdp/population from world where population >= 200000000 ;

/*Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.*/
select name, population/1000000 from world where continent='South America';

/*Show the name and population for France, Germany, Italy*/
select name, population from world where name in ('France','Germany', 'Italy');

/*Show the countries which have a name that includes the word 'United'*/
select name from world where name like '%united%';

/*Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area.*/
select name, population, area from world where population > 250000000 OR area>3000000;

/*Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.*/
select name, population, area from world where population > 250000000 XOR area>3000000;

/*Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

For South America show population in millions and GDP in billions both to 2 decimal places.*/
select name, round(population/1000000, 2), round(gdp/1000000000, 2) from world where continent='South America';