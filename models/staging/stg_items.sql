with raw_order_items as (
    select * from {{ ref('olist_order_items_dataset') }}
)

select
    order_id,
    order_item_id,
    product_id,
    price,
    freight_value as shipping_cost
from raw_order_items