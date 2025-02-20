import sqlite3
import pandas as pd

def mango():
    # Create a SQL connection to our SQLite database
    con = sqlite3.connect("sqlite/tdrive")

    cur = con.cursor()

    # The result of a "cursor.execute" can be iterated over by row
    if not cur.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='test';"):
        cur.execute("CREATE TABLE test (column1 INT, column2 STRING, column3 float);")
    cur.execute("INSERT INTO test VALUES (5, 'hey', 2.0)")
    for row in cur.execute("SELECT * FROM test;"):
        print(row)

    con.commit() # saves row from line 13

    #df = pd.read_sql_query("", con)

    # Be sure to close the connection
    con.close()