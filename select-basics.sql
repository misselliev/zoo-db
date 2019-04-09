
/*1. Select population of Germany*/

SELECT population FROM world WHERE name = 'Germany';

/*2. Checking a list The word IN allows us to check if an item is in a list.  Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.*/

SELECT name, population FROM world WHERE name IN ('Sweden', 'Norway', 'Denmark');

/*Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values).*/
SELECT name, area FROM world WHERE area BETWEEN 200000 AND 250000; 