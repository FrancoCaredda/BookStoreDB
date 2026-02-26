SELECT co.id
FROM customer_orders AS co
WHERE NOT EXISTS (
    SELECT customer_order_id
    FROM customer_order_items
    WHERE customer_order_id = co.id
);