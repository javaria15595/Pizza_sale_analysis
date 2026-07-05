
SELECT 
    HOUR(time) AS hour, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY HOUR(time);