import psycopg2
import sys
import os
import csv

DATA_PATH = os.path.join(os.path.dirname(__file__), "data")
FILES = [
    "genres.csv", 
    "publishers.csv", 
    "authors.csv", 
    "books.csv", 
    "book_author.csv", 
    "book_editions.csv", 
    "customers.csv", 
    "customer_orders.csv", 
    "customer_order_items.csv"
]
DELIMITER = ";"

tables = {}

for file in FILES:
    with open(os.path.join(DATA_PATH, file), "r") as reader:
        csvReader = csv.DictReader(reader, delimiter=DELIMITER)
        
        tableName = file[:file.index(".")]
        tables[tableName] = tuple(csvReader.fieldnames)

with psycopg2.connect("dbname=bookstore user={user} password={password}".format(
    user=sys.argv[1],
    password=sys.argv[2]
)) as connection:

    with connection.cursor() as cursor:
        for file in FILES:
            with open(os.path.join(DATA_PATH, file), "r") as reader:
                tableName = file[:file.index(".")]
                reader.readline()
                cursor.copy_from(reader, tableName, columns=tables[tableName],sep=DELIMITER)
                connection.commit()

print("Data has been copied successfully!")