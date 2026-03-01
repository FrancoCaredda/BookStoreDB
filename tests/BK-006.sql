SELECT email, COUNT(email) AS repetitions
FROM customers
GROUP BY email
HAVING COUNT(email) > 1;