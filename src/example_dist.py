import sqlite3 as sql
import pandas as pd


def get_dist(traj1, traj2):
    db = sql.connect('../sqlite/db.sqlite')
    two_trajectories_df = pd.read_sql("SELECT * FROM taxi_point WHERE id = ? OR id = ?", db, params=[traj1, traj2])
    print(two_trajectories_df)
    dist_df = pd.read_sql("WITH traj1 AS (SELECT *, row_number() OVER (ORDER BY id) row FROM taxi_point WHERE id = ?), "
                     "traj2 AS (SELECT *, row_number() OVER (ORDER BY id) row FROM taxi_point WHERE id = ?) "
                     "SELECT SUM(abs(traj1.lat - traj2.lat) + abs(traj1.lon - traj2.lon)) AS distance FROM traj1 INNER JOIN traj2 USING (row)", db, params=[traj1, traj2])
    print(dist_df)

get_dist(1,2)