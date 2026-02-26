CREATE VIEW book_edition_info AS
SELECT b.title,
       a.first_name, a.last_name,
       g.genre, 
       p.name AS publisher_name,
       be.publication_year, be.pages, be.price_eur, be.isbn
FROM book_author AS ba
JOIN books AS b ON ba.book_id = b.id
JOIN authors AS a ON ba.author_id = a.id
JOIN genres AS g ON b.genre_id = g.id
JOIN book_editions AS be ON ba.book_id = be.book_id
JOIN publishers AS p ON be.publisher_id = p.id;