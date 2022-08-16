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

/*Find the top 10 apps most rated. PANDORA, BIBLE, PAC-MAN, WEATHER, GOOGLE EARTH
EBAY, WEATHER BUG, EVERNOTE, PAYPAL, OPENTABLE */
SELECT track_name, rating_count_tot from apple_sample
order by rating_count_tot DESC LIMIT 10;

/*Find the top 10 apps best rated by users. OPENTABLE, STARWALK, SOLITAIRE,
PCALC, BIBLE, SHANGAI, PAYPAL, PANDORA, EBAY, PAC-MAN*/
SELECT track_name, user_rating from apple_sample
order by user_rating DESC LIMIT 10;

/*7/Take a look at the data you retrieved in question 5. Give some insights.
The Pandora app, an app for music is the one that has been the most rated 
followed by PAC-MAN and the bible.

8/Take a look at the data you retrieved in question 6. Give some insights.
OpenTable, Star Walk and Soltaire are not the most rated but are the best rated.

9/Now compare the data from questions 5 and 6. What do you see?
An app's popularity doesn't guarantee its quality*/

/*/10/How could you take the top 3 regarding both user ratings and number of votes?
The */

SELECT track_name, rating_count_tot/user_rating from apple_sample
order by rating_count_tot/user_rating DESC LIMIT 3;



SELECT track_name, price, user_rating FROM apple_sample
order by user_rating DESC LIMIT 10;

/*11/Do people care about the price of an app? Do some queries, comment why are you doing them 
and the results you retrieve. What is your conclusion?
People do not care about the price. The average rating for free apps is lower than for pricy apps.  */

SELECT AVG(user_rating) FROM apple_sample WHERE price>0;
SELECT AVG(user_rating) FROM apple_sample WHERE price=0;












