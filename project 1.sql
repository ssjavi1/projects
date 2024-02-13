use shop;
select * from titles;

# top 10 movies based on imdb score
select title from titles order by imdb_score limit 10;
select title, type,imdb_score from titles
where type ='MOVIE'
order by imdb_score desc limit 10;

# How many movies and shows fall in each decade in Netflix's library?

select concat(floor(release_year/10)*10,'s')as decade,
count(*) as movies_shows_count
from titles
where release_year>1940
group by decade
order by decade;

# average imdb score for each age certifiation

select distinct age_certification, round(avg(imdb_score),2)as avg_imdb_score
from titles
group by age_certification
order by avg_imdb_score desc;

select avg(imdb_score) as average, age_certification from titles group by age_certification; (my code)

# Top 10 most common genres for MOVIES

select type, genres, count(*) as title_count
from titles
where type='Movie'
group by genres
order by title_count desc
limit 10;

# Top 3 most common genres OVERALL
select * from titles;
select genres, count(*) as genre_count
from titles
where type='MOVIE' or type='SHOW'
group by genres
order by genre_count desc
limit 3;




