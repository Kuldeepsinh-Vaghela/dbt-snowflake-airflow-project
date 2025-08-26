select
    o.value:order_id::string as order_id,
    {{ clean_dates('o.value:order_date::string')}} order_date,
    o.value:customer_id::string as customer_id,
    o.value:currency::string as currency,
    li.value:product_id::string as product_id,
    li.value:quantity::number as quantity,
    li.value:unit_price::float as unit_price,
    coalesce(li.value:discount::float,0) as discount
from {{ source('raw','raw_sales') }} t,
lateral flatten(input => t.value) o,          -- flatten top-level array
lateral flatten(input => o.value:line_items) li
order by product_id

