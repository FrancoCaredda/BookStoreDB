SELECT id, first_name, last_name, alias
FROM authors
WHERE first_name IS NULL AND last_name IS NULL AND alias IS NULL;