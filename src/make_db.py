import os
import sqlite3 as sql

class Car:
    def __init__(self, id, trajs):
        self.Id = id
        self.Trajectories = trajs


class trajectory:
    def __init__(self, id, date, x, y):
        self.Id = id
        self.Date = date
        self.X = x
        self.Y = y


def main():
    car_list = []


    for id in range(1,3):
        strId = str(id)
        car = getFileLineByLine(strId)
        car_list.append(car)
    
    makeDatabase(car_list)
    

def getFileLineByLine(id):
    dir = os.getcwd() + "/sqlite/csv/taxi_log_2008_by_id/"
    objList = []

    with open(dir+id+'.txt', 'r') as file:
    # Read each line in the file
        for line in file:
            obj = createObj(line)
            objList.append(obj)

    file.close()
    return Car(id, objList)


def createObj(line):
    dl = line.split(',')
    return trajectory(dl[0], dl[1], dl[2], dl[3])


def makeDatabase(car_list):
    db = sql.connect('sqlite/carbase.db')
    db.cursor()

    for car in car_list:
        db.execute(f"CREATE TABLE car{car.Id}(id, date, x, y)")

        for traj in car.Trajectories:
            db.execute(f"INSERT INTO car{car.Id} VALUES ({traj.Id}, '{traj.Date}', {traj.X}, {traj.Y})")
    
    db.commit()

main()