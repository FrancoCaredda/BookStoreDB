SELECT coi.id AS customer_order_item_id, be.id AS book_edition_id, coi.quantity AS order_quantity, be.stock_amount
FROM customer_order_items AS coi
JOIN book_editions AS be ON be.id = coi.book_edition_id
WHERE coi.quantity > be.stock_amount;