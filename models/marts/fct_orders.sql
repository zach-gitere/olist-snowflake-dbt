with orders as (
    select * from {{ ref('stg_olist_orders') }}
),

customers as (
    select * from {{ ref('stg_olist_customers') }}
),

order_items as (
    select 
        order_id,
        sum(price) as total_item_revenue,
        sum(shipping_cost) as total_shipping_revenue
    from {{ ref('stg_items') }}
    group by 1
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.purchased_at,
    c.city,
    c.state,
    i.total_item_revenue,
    i.total_shipping_revenue,
    (i.total_item_revenue + i.total_shipping_revenue) as total_order_value
from orders o
left join customers c on o.customer_id = c.customer_id
left join order_items i on o.order_id = i.order_id