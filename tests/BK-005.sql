SELECT id, order_date
FROM customer_orders
WHERE order_date > CURRENT_DATE;