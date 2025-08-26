select 
    order_id,
    customer_id,
    product_id,
    quantity,
    unit_price,
    discount,
    dd.date_id
from {{ ref("stg_sales")}} ss
inner join {{ ref("dim_date")}} dd 
on ss.order_date = dd.order_date