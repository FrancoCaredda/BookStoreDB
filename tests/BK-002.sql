SELECT b.id
FROM books AS b
WHERE NOT EXISTS (
    SELECT book_id FROM book_author WHERE book_id = b.id
);