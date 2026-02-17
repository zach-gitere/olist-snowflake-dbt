with orders as (
    select * from {{ ref('stg_olist_orders') }}
),

customers as (
    select * from {{ ref('stg_olist_customers') }}
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.purchased_at,
    c.city,
    c.state,
    c.zip_code
from orders o
left join customers c 
    on o.customer_id = c.customer_id