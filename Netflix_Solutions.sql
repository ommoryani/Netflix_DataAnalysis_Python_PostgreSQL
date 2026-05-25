-- Netflix Project
drop table if exists netflix;
create table  netflix
(
	show_id      VARCHAR(5),
    type         VARCHAR(10),
    title        VARCHAR(250),
    director     VARCHAR(550),
    casts        VARCHAR(1050),
    country      VARCHAR(550),
    date_added   VARCHAR(55),
    release_year INT,
    rating       VARCHAR(15),
    duration     VARCHAR(15),
    listed_in    VARCHAR(250),
    description  VARCHAR(550)
);

select * from netflix;

SELECT 
	COUNT(*) as total_content
FROM netflix;

SELECT 
	distinct type
FROM netflix;

select * from netflix;

-- 15 Problems and Their solution -- 
	--1. Count the number of Movies vs TV Shows
SELECT 
	 TYPE , COUNT(*) AS TOTAL_CONTENT
FROM netflix 
group by type;


	-- 2. Find the most common rating for movies and TV shows--
SELECT 
    type,
    RATING
FROM
(
    SELECT 
        type,
        RATING,
        COUNT(*),
        RANK() OVER (PARTITION BY TYPE ORDER BY COUNT(*) DESC) AS RANKING
    FROM NETFLIX
    -- This WHERE clause filters out the messy duration data in the rating column
    WHERE RATING NOT LIKE '%min%' 
    GROUP BY 1, 2
) AS T1
WHERE RANKING = 1;

	-- 3. List all movies released in a specific year (e.g., 2020)--
SELECT * FROM netflix
WHERE type = 'Movie' 
  AND release_year = 2020;

	--4. Find the top 5 countries with the most content on Netflix--
select 
	UNNEST(STRING_TO_ARRAY(country,',')) AS NEW_COUNTRY,
	count(show_id) as total_content
from netflix
group by 1
ORDER BY 2 DESC
LIMIT 5

	--5. Identify the longest movie --
select * FROM NETFLIX
WHERE TYPE='Movie'
and 
duration=(select MAX(DURATION) FROM NETFLIX);
	
	--6. Find content added in the last 5 years--
SELECT 
	*
FROM NETFLIX 
WHERE 
	to_date(date_added,'Month DD, YYYY')>=current_date-interval '5 years'

	--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!--
SELECT show_id type  , title , director from netflix where director ilike '%Rajiv Chilaka%'

	--8. List all TV shows with more than 5 seasons--
select 
	*, 
	split_part(duration,'',1) as seasons
from netflix 
where type='TV Show'  
AND SPLIT_PART(duration, ' ', 1)::INT > 5;

	--9. Count the number of content items in each genre--
select 
	UNNEST(String_To_Array(listed_in,',')) AS genre,
	count(show_id) as total_content
from netflix
group by 1

	--10. Find the average release year for content produced in a specific country--
select 
	EXTRACT(YEAR  FROM TO_DATE(date_added,'Month DD, YYYY')) as year,
	count(*),
	round(
	count(*)::numeric/(select count(*) from netflix where country='India')::numeric * 100
	,2)as avg_content_per_year
from netflix 
where country='India'
group by 1

	--11. List all movies that are documentaries--
SELECT * FROM NETFLIX 
WHERE LISTED_IN ILIKE '%documentaries%'

	--12. Find all content without a director--
select * from netflix 
where director is null

	--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!--
select * from netflix
where 
	casts ilike '%Salman Khan%'
	and 
	release_year > extract( year from current_date)-10
	
	--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.--
select 
unnest(string_to_array(casts,',')) as actors,
count(*) as total_content
from netflix
where country ilike '%india%'
group by 1
order by 2 desc
limit 10

	--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. Label content containing these keywords as 'Bad' and all other content as 'Good'. Count how many items fall into each category--
with new_table
as 
(select 
	*, 
	case 
	when 
		description ilike '%kill%' or description ilike '%violence%' then 'Bad_Content'
		else 'Good Content'
	end category
from netflix
) 
select category , count(*) as total_content from new_table group by 1


