-- NUMBER 1 --

SELECT SUM("Confirmed") AS Total_confirmed FROM covid_19_data;


-- NUMNBER 2 --

SELECT
	EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) AS year,
	SUM(CASE WHEN EXTRACT(MONTH FROM CAST("ObservationDate" AS DATE)) BETWEEN 1 AND 3 THEN "Confirmed" ELSE 0 END) AS total_confirmed,
	SUM(CASE WHEN EXTRACT(MONTH FROM CAST("ObservationDate" AS DATE)) BETWEEN 1 AND 3 THEN "Deaths" ELSE 0 END) AS total_deaths,
	SUM(CASE WHEN EXTRACT(MONTH FROM CAST("ObservationDate" AS DATE)) BETWEEN 1 AND 3 THEN "Recovered" ELSE 0 END) AS total_recovered
FROM
	covid_19_data
GROUP BY
	year
ORDER BY
	year ASC;


-- NUMBER 3 --

SELECT
	"Country",
	SUM("Confirmed") AS total_confirmed,
	SUM("Deaths") AS total_deaths,
	SUM("Recovered") AS total_recovered
FROM
	covid_19_data
GROUP BY
	"Country"
ORDER BY
	total_confirmed DESC;


-- NUMBER 4 --

SELECT 
    ROUND(
        (
            SUM(
                CASE WHEN EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) = 2020 THEN "Deaths" END
            ) - 
            SUM(
                CASE WHEN EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) = 2019 THEN "Deaths" END
            )
        ) / 
        SUM(
            CASE WHEN EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) = 2019 THEN "Deaths" END
        ) * 100, 
        2
    ) AS death_increase_percentage
FROM 
    covid_19_data
WHERE 
    EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) BETWEEN 2019 AND 2020;



-- NUMBER 5 --

SELECT 
	"Country", SUM("Confirmed") AS total_confirmed
FROM 
	covid_19_data
GROUP BY 
	"Country"
ORDER BY
	total_confirmed DESC
LIMIT 5;


-- NUMBER 6 --

SELECT
	year,
	month,
	CASE WHEN ("confirmed_diff") > 0 THEN 'Increased' ELSE 'Decrease' END AS change_type,
	COUNT(*) AS total_num
FROM
	(select 
		*, "Confirmed" - LAG("Confirmed") 
	OVER 
		(ORDER BY EXTRACT(MONTH FROM CAST("ObservationDate" AS DATE))) AS confirmed_diff, 
		EXTRACT(MONTH FROM CAST("ObservationDate" AS DATE)) AS month,
		EXTRACT(YEAR FROM CAST("ObservationDate" AS DATE)) AS year
	FROM 
		covid_19_data) AS data_with_diff
WHERE 
	confirmed_diff IS NOT NULL
GROUP BY
	year, month, change_type
ORDER BY
	year, month;





