SELECT name, revenue FROM
(SELECT category, name, revenue,
RANK() OVER(partition by category ORDER BY revenue) AS RN
FROM
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM((order_details.quantity) * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) AS  A) AS B
WHERE RN <= 3
;