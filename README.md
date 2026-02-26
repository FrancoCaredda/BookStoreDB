# BookStore Database
BookStore database is part of my portfolio that models a simple business scenario for an online store.  
The goal is to showcase my ability to use SQL to find bugs, inconsistencies in data, and overall knowledge of relational databases.  

## Requirements
Before cloning the repository, make sure that the necessary tools are installed.

|Tool|Version|
|--|--|
|PostgreSQL|18.2|
|Python|3.14.3|

Python packages:
* psycopg2

## How to run?
1. Clone the repository `https://github.com/FrancoCaredda/BookStoreDB.git`  
2. Open the cloned folder in a terminal  
3. Create a new database `bookstore`, using psql  
4. Run `psql -U <username> -d bookstore -f schema/schema.sql`  
5. Enter your credentials  
6. Run `python import_data.py bookstore <username> <password>`
7. Once you see the success message in the terminal, the db is ready

## Test cases

|ID|Description|Precondition|Steps|Expected Results|Actual Results|Severity|Notes|
|--|--|--|--|--|--|--|--|
|BK-001|Verify that the books data has been imported correctly|Connection with the db + imported data|1. Run *tests/validate_book_info.sql*; 2. Compare the results with *tests/expected/book_info.csv*; 3. Observe the results|The result coincides with the expected data|-|High|-|
|BK-002|Verify that the prices of books are not negative|Connection with the db + imported data|1. Run *tests/check_on_negative_price.sql*; 2. Observe the results|No rows are returned|-|High|-|

## Schema
![bookstore_diagram](bookstore_diagram.jpg "Schema")