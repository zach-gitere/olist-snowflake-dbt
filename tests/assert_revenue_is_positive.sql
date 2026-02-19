-- This test returns rows where total_revenue is less than 0.

SELECT 
    order_id, 
    total_order_value -- This matches your model's final SELECT
FROM {{ ref('fct_orders') }}
WHERE total_order_value < 0