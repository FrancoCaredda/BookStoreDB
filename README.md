# BookStore Database
BookStore database is part of my portfolio that models a simple business scenario for an online store.  
The goal is to showcase my ability to use SQL to find bugs, inconsistencies in data, and overall knowledge of relational databases.  

## Requirements
Before cloning the repository, make sure that the necessary tools are installed.

|Tool|Version|
|--|--|
|PostgreSQL|18.2|
|Python|3.14.3|

## How to run?
1. Clone the repository ``  
2. Open the cloned folder in a terminal  
3. Create a new database `bookstore`, using psql  
4. Run `psql -U <username> -d bookstore -f queries/schema/schema.sql`  
5. Enter your credentials  
6. Run `pip install psycopg2`
7. Run `python queries/schema/import_data.py bookstore <username> <password>`
8. Once you see `Finished!` in the terminal, the db is ready

## Schema
![bookstore_diagram](bookstore_diagram.jpg "Schema")
