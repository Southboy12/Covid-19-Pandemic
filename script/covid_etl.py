import pandas as pd
import opendatasets as od
from pathlib import Path
import os


def extract_data(url) ->pd.DataFrame:
    """download and read the file into a DataFrame"""

    # od.download(url, './data/')
    df = pd.read_csv('./data/covid_19_data.csv')
    return df

def transform(df: pd.DataFrame) -> pd.DataFrame:
    """Set ObservationDate as datetype and write the transformed date to a csv file"""

    df['ObservationDate'] = pd.to_datetime(df.ObservationDate)
    print(df.info())
    print(df.head())
    return df

def load(df: pd.DataFrame) -> None:
    """Load the DataFrame into postgresql"""




def main():
    url = "https://drive.google.com/file/d/1SzmRIwlpL5PrFuaUe_1TAcMV0HYHMD_b/view"
    df = extract_data(url)
    clean_df = transform(df)



if __name__ == "__main__":
    main()