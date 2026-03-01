SELECT email, COUNT(email) AS repetitions
FROM publishers
GROUP BY email
HAVING COUNT(email) > 1;