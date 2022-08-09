use pubs;

/*Challenge 1*/

select authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id;

/*Challenge 2*/

select authors.au_lname, authors.au_fname, authors.au_id, count(titleauthor.title_id), titles.pub_id, titles.title, publishers.pub_name
from authors
left join titleauthor
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id=titles.title_id
left join publishers
on titles.pub_id=publishers.pub_id
group by authors.au_id, titleauthor.title_id
order by count(titleauthor.title_id) desc;

/*Challenge 3*/

select authors.au_lname, authors.au_fname, authors.au_id, count(titles.title) as 'total'
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
group by authors.au_id
order by count(titles.title) desc
limit 3;

/*Challenge 4*/

select authors.au_lname, authors.au_fname, authors.au_id, count(titles.title) as 'total'
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
group by authors.au_id
order by count(titles.title) desc
limit 23;