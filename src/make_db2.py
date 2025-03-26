import os
import sqlite3 as sql
import pandas as pd
from pandas.errors import EmptyDataError

def load_db(db_location: str, folder_location: str):
    # Connect
    print(f"Loading db at {db_location}")
    db = sql.connect(db_location)

    # Create Table
    db.execute(f"CREATE TABLE IF NOT EXISTS taxi_point(id INT, date DATETIME, lon FLOAT, lat FLOAT)")
    db.commit()

    # List files in dir
    files = os.listdir(folder_location)
    total_files: int = len(files)

    # Iterate files and keep count
    for i, filename in enumerate(files):
        # Progress bar
        progress = "#" * (i * 10 // total_files) + "-" * (10 - i * 10 // total_files)
        print(f'Progress: [{progress}] file {i} of {total_files}', end='\r', flush=True)

        # Try and read csv file, skip if empty
        try:
            df = pd.read_csv(
                os.path.join(folder_location, filename),
                date_format='%Y-%M-%D %H:%M:%S', # to allow parsing into DATETIME column from yyyy-mm-dd hh-mm-ss
                header=None, # panda expects first row to be column names, we do not have that
                names=['id', 'date', 'lon', 'lat'] # to match column names
            )
            df.to_sql(
                'taxi_point', # table name
                db, # db connection to parse directly into
                if_exists='append', # avoid overwriting table columns and values
                index=False # avoid writing the row index column
            )
        except EmptyDataError:
            print(f"File {filename} is empty" + ' ' * 50)

        # Avoid producing a too big commit to db
        if i % 200 == 0:
            db.commit()

    db.commit()
    db.close()
    print("\nDone!")


load_db('sqlite/db.sqlite', "sqlite/csv/taxi_log_2008_by_id")