-- Subquery version
SELECT co.id
FROM customer_orders AS co
WHERE NOT EXISTS (
    SELECT customer_order_id FROM customer_order_items WHERE customer_order_id = co.id
);

-- LEFT JOIN version
-- SELECT co.id
-- FROM customer_orders AS co
-- LEFT JOIN customer_order_items AS coi ON coi.customer_order_id = co.id
-- WHERE coi.customer_order_id IS NULL;