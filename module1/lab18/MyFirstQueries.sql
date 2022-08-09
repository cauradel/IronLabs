CREATE DATABASE apple_store;

select price, currency from apple_store.apple_sample
where currency='USD'
order by price DESC;

select prime_genre, avg(rating_count_tot) from apple_store.apple_sample
where currency='USD'
group by prime_genre;

use apple_store;
CREATE TABLE test (
ID int,
Name CHAR(20));

INSERT INTO test(ID,Name)
VALUES (1,'Sam'),(2,'Tom');

SET SQL_SAFE_UPDATES = 0;

UPDATE test
SET Name = 'Tim'
WHERE ID = 2;

SELECT rating_count_tot, prime_genre from apple_sample
order by rating_count_tot DESC;

/* Which is the genre with most apps? GAMES*/ 
/*Which is the genre with least? PRODUCTIVITY, SHOPPING, REFERENCE, FINANCE, MUSIC, UTILITIES*/
SELECT count(track_name), prime_genre from apple_sample
group by prime_genre; 

/*Find the top 10 apps most rated. */
SELECT track_name, rating_count_tot from apple_sample
order by rating_count_tot DESC LIMIT 10;





