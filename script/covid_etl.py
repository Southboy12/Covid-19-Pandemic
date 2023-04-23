import pandas as pd
import opendatasets as od
from pathlib import Path
import os


def extract_data(url) ->pd.DataFrame:
    """download and read the file into a DataFrame"""

    url = "https://drive.google.com/file/d/1SzmRIwlpL5PrFuaUe_1TAcMV0HYHMD_b/view"
    # od.download(url, './data/')
    df = pd.read_csv('./data/covid_19_data.csv')
    return df


def main():
    extract_data()



if __name__ == "__main__":
    main()