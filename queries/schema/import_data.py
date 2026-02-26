import psycopg2
import sys
import os
import csv

DATA_PATH = os.path.join(os.path.dirname(__file__), "data")
FILE = sys.argv[1]
DELIMITER = ";"

columns = None

with open(os.path.join(DATA_PATH, FILE), "r") as file:
    csvReader = csv.DictReader(file, delimiter=DELIMITER)
    columns = tuple(csvReader.fieldnames)

with psycopg2.connect("dbname={dbname} user={user} password={password}".format(
    dbname=sys.argv[2],
    user=sys.argv[3],
    password=sys.argv[4]
)) as connection:
    with connection.cursor() as cursor:
        with open(os.path.join(DATA_PATH, FILE), "r") as file:
            tableName = FILE[:FILE.index(".")]
            file.readline()
            cursor.copy_from(file, tableName, columns=columns, sep=DELIMITER)
            connection.commit()

print("Data has been copied successfully!");