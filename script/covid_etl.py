import pandas as pd
import opendatasets as od
from pathlib import Path
import os, dotenv
from sqlalchemy import create_engine
from dotenv import dotenv_values
import psycopg2



def get_database_conn():
    dotenv.load_dotenv('./.env')
    db_user_name = os.getenv('DB_USER_NAME')
    db_password = os.getenv('DB_PASSWORD')
    db_name = os.getenv('DB_NAME')
    port = os.getenv('DB_PORT')
    host = os.getenv('DB_HOST')
    return create_engine(f'postgresql+psycopg2://{db_user_name}:{db_password}@{host}:{port}/{db_name}')


def extract_data(url) ->pd.DataFrame:
    """download and read the file into a DataFrame"""

    # od.download(url, './data/')
    df = pd.read_csv('./data/covid_19_data.csv')
    print('Date successfully extracted to csv file')
    return df

def transform(df: pd.DataFrame) -> Path:
    """Set ObservationDate as datetype and write the transformed date to a csv file"""

    df['ObservationDate'] = pd.to_datetime(df.ObservationDate) 
    transformed_path = './data/transformed_covid_data.csv'
    df.to_csv(transformed_path, index=False)
    print('Data successfully transformed and written to csv file')
    return transformed_path

def load(path: Path) -> None:
    """Load the DataFrame into postgresql"""

    df = pd.read_csv(path)
    engine = get_database_conn()
    df.to_sql('covid_19_data', con=engine, if_exists='replace', index=False)
    print('Data successfully written to postgreSQL database')

def main():
    url = "https://drive.google.com/file/d/1SzmRIwlpL5PrFuaUe_1TAcMV0HYHMD_b/view"
    df = extract_data(url)
    path = transform(df)
    load(path)



if __name__ == "__main__":
    main()