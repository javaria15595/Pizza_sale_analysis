
SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;