SELECT customer_order_id, book_edition_id, COUNT(*) AS repetitions
FROM customer_order_items
GROUP BY customer_order_id, book_edition_id
HAVING COUNT(*) > 1;