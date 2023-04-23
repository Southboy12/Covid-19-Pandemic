# **Data Engineering Project: Covid-19 Analysis**

<p>This project analyzes sample data related to COVID-19 cases as recorded from January 2019 to December 2020. The data is provided as a CSV file, and PostgreSQL is used as the database tool. The project involves creating a database and a table to hold the data, defining the data types, downloading and loading the data into the database, and writing suitable SQL queries to generate insights from the data.</p>

## **Requirements**

* PostgreSQL
* Python 3.x
* PGAdmin or any other PostgreSQL client
* Covid_19_data.csv file

## **Instructions**

1. Download and install PostgreSQL. You can follow this link to download, install and set up a Postgresql database if you don’t currently have PostgreSQL installed: https://www.postgresqltutorial.com/install-postgresql/
2. Create a database and a table called covid_19_data to hold the data in PostgreSQL.
3. Define the data type of ObservationDate as DATE type in the database instead of String as shown on the data summary image above.
4. Use a Python script to download the Covid_19_data.csv file and load into a PostgreSQL database.
5. Use PGAdmin or any other PostgreSQL client for writing and running your SQL Queries.
6. Write suitable SQL queries to analyze and generate insights from the data.

## **Tasks**

1. Write a Python script to download the Covid_19_data.csv file using this link.
2. The script should also be used to load the data into the table you created in a PostgreSQL Database.
3. Write suitable SQL queries to analyze and generate insights from the data.

<p>Below are the questions you are to write SQL queries to find answers to:</p>

1. Retrieve the total confirmed, death, and recovered cases.
2. Retrieve the total confirmed, deaths, and recovered cases for the first quarter of each year of observation.
3. Retrieve a summary of all the records. This should include the following information for each country:

* The total number of confirmed cases
* The total number of deaths
* The total number of recoveries

4. Retrieve the percentage increase in the number of death cases from 2019 to 2020.
5. Retrieve information for the top 5 countries with the highest confirmed cases.
6. Compute the total number of drop (decrease) or increase in the confirmed cases from month to month in the 2 years of observation.
