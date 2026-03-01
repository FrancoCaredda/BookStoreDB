SELECT coi.id, be.id AS book_edition_id, be.stock_amount
FROM customer_order_items AS coi
JOIN book_editions AS be ON coi.book_edition_id = be.id
WHERE be.stock_amount = 0;