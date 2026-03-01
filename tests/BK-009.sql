SELECT id, first_name, last_name
FROM authors
WHERE first_name IS NULL AND last_name IS NOT NULL;