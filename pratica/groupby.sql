-- datacamp - group by
-- Get the release year and count of films released in each year.
SELECT
    release_year,
    count(*)
FROM
    films
GROUP BY
    release_year;

-- Get the release year and average duration of all films, grouped by release year.
SELECT
    release_year,
    avg(duration)
FROM
    films
GROUP BY
    release_year;

-- Get the release year and largest budget for all films, grouped by release year.
SELECT
    release_year,
    max(budget)
FROM
    films
GROUP BY
    release_year;

-- Get the IMDB score and count of film reviews grouped by IMDB score in the reviews table.
SELECT
    imdb_score,
    count(*)
FROM
    reviews
GROUP BY
    imdb_score;

-- Get the release year and lowest gross earnings per release year.
SELECT
    release_year,
    min(gross)
FROM
    films
GROUP BY
    release_year
ORDER BY
    min(gross) ASC;

-- Get the language and total gross amount films in each language made.
SELECT
    language,
    sum(gross)
FROM
    films
GROUP BY
    language;

-- Get the country and total budget spent making movies in each country.
SELECT
    country,
    sum(budget)
FROM
    films
GROUP BY
    country;

-- Get the release year, country, and highest budget spent making a film for each year, for each country. Sort your results by release year and country.
SELECT
    release_year,
    country,
    max(budget)
FROM
    films
GROUP BY
    release_year,
    country
ORDER BY
    release_year,
    country;

-- Get the country, release year, and lowest amount grossed per release year per country. Order your results by country and release year.
SELECT
    country,
    release_year,
    min(gross)
FROM
    films
GROUP BY
    country,
    release_year
ORDER BY
    country,
    release_year;

-- In how many different years were more than 200 movies released?
SELECT
    release_year,
    count(*)
FROM
    films
GROUP BY
    release_year
HAVING
    count(*) > 200;

-- Now you're going to write a query that returns the average budget and average gross earnings for films in each year after 1990, if the average budget is greater than $60 million.
SELECT
    release_year,
    avg(budget) avg_budget,
    avg(gross) avg_gross
FROM
    films
WHERE
    release_year > 1990
GROUP BY
    release_year
HAVING
    AVG(budget) > 60000000
ORDER BY
    avg(gross) DESC;

-- Get the country, average budget, and average gross take of countries that have made more than 10 films. Order the result by country name, and limit the number of results displayed to 5. You should alias the averages as avg_budget and avg_gross respectively.
SELECT
    country,
    avg(budget) avg_budget,
    avg(gross) avg_gross
FROM
    films
GROUP BY
    country
HAVING
    count(country) > 10
ORDER BY
    country
LIMIT
    5