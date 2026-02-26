SELECT id
FROM customer_orders
WHERE id IN (
    SELECT customer_order_id
    FROM customer_order_items
);