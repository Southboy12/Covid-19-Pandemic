# **Data Engineering Project: Covid-19 Analysis**

## **Getting Started**
<p>
This script downloads COVID-19 data from a Google Drive URL, transforms the data, and loads it into a PostgreSQL database. The script is written in Python and requires several dependencies, including pandas, opendatasets, and psycopg2.
</p>

```python copyable
pip install pandas
pip install opendatasets
pip install psycopg2
```
<p>Next, create a .env file in the root directory of the project and add the following environment variables:
</p>

```python copyable
DB_USER_NAME=<your_database_user_name>
DB_PASSWORD=<your_database_password>
DB_NAME=<your_database_name>
DB_PORT=<your_database_port>
DB_HOST=<your_database_host>
```

## **Running the Script**
<p>
To run the script, simply execute the following command:
</p>

```python copyable
python covid_19.py
```
<p>
This will download the COVID-19 data from the Google Drive URL, transform the data, and load it into your PostgreSQL database. You should see several success messages printed to the console indicating that the data was extracted, transformed, and loaded successfully.
</p>

## **Conclusion**

<p>
This script provides a simple way to download, transform, and load COVID-19 data into a PostgreSQL database. With some modifications, you can adapt this script to work with other datasets and databases.
</p>
