from psycopg2 import sql

import psycopg2
import os
import sys

SCHEMA_PATH = os.path.join(os.path.dirname(__file__), "schema")
SCHEMA_VIEWS_PATH = os.path.join(SCHEMA_PATH, "views")
SCHEMA_VIEWS_DIRECTORY = os.listdir(SCHEMA_VIEWS_PATH)

def create_database():
    connection = psycopg2.connect("dbname=postgres user={user} password={password}".format(
        user=sys.argv[1],
        password=sys.argv[2]
    ))
    connection.set_session(autocommit=True)

    with connection.cursor() as cursor:
        cursor.execute(sql.SQL("CREATE DATABASE bookstore"))

    connection.close()

def create_schema():
    schema_sql = ""

    with open(os.path.join(SCHEMA_PATH, "schema.sql"), "r") as file:
        schema_sql = file.read()

    with psycopg2.connect("dbname=bookstore user={user} password={password}".format(
        user=sys.argv[1],
        password=sys.argv[2]
    )) as connection:
        connection.set_session(autocommit=True)

        with connection.cursor() as cursor:
            cursor.execute(schema_sql)

def create_views():
    queries = []

    for view_file in SCHEMA_VIEWS_DIRECTORY:
        with open(os.path.join(SCHEMA_VIEWS_PATH, view_file), "r") as file:
            queries.append(file.read())

    with psycopg2.connect("dbname=bookstore user={user} password={password}".format(
        user=sys.argv[1],
        password=sys.argv[2]
    )) as connection:
        connection.set_session(autocommit=True)

        with connection.cursor() as cursor:
            for query in queries:
                cursor.execute(query)

if __name__ == "__main__":
    create_database()
    create_schema()
    create_views()
    print("The database bookstore is now up and running.")