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
3. Run `python build.py <username> <password>` 
4. Run `python import_all_tables.py <username> <password>`
5. Once you see the success message in the terminal, the db is ready

## Test cases

|ID|Description|Precondition|Steps|Expected Results|Severity|
|--|--|--|--|--|--|
|BK-001|Verify that the books data has been imported correctly|Connection with the db + imported data|1. Run *tests/validate_book_info.sql*; 2. Compare the results with *tests/expected/book_info.csv*; 3. Observe the results|The data from the query coincides with the csv file|High|
|BK-002|Verify that the prices of books are not negative|Connection with the db + imported data|1. Run *tests/check_on_negative_price.sql*; 2. Observe the results|No rows are returned|High|
|BK-003|Verify that books have at least one author associated with them|Connection with the db + imported data|1. Run *test/check_books_on_presence_of_author.sql*; 2. Observe the result|No rows are returned|Critical|
|BK-004|Verify that orders have at least one order item associated with them|Connection with the db + imported data|1. Run *tests/check_orders_on_presence_of_items.sql*; 2. Observe the results|No rows are returned|Critical|
|BK-005|Verify that there are no orders with items that are out of stock|Connection with the db + imported data|1. Find all book editions that have stock_amount = 0; 2. Find the order items that point to these editions; 3. Observe the results|No rows are returned|Critical|
|BK-006|Verify that there are no order items with the quantity greater than the stock amount|Connection with the db + imported data|1. Run *tests/check_on_quantity_being_greated_than_stock.sql*; 2. Observe the results|No rows are returned|Critical|
|BK-007|Verify that there are no book editions with the stock amount less than zero|Connection with the db + imported data|1. Select edition ids where the stock quantity is less than zero; 2. Observe the results|No rows are returned|High|
|BK-008|Verify that there are no order items with the quantity less than zero|Connection with the db + imported data|1. Select order items with the quantiry less than zero; 2. Observe the results|No rows are returned|High|
|BK-009|Verify that there are no orders made in the future|Connection with the db + imported data|1. Select orders with the order date greater than today; 2. Observe the results|No rows are returned|High|


## Schema
![bookstore_diagram](bookstore_diagram.jpg "Schema")