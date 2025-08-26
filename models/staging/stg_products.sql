select 
    product_id,
    case
        when product_name is null and category is not null then 'Product_'|| category || '_' || product_id
        when product_name is null and category is null then 'UNKNOWN_PRODUCT'
        else 'Product_' || REGEXP_SUBSTR(product_name, '[0-9]+$')
        end as product_name,
        category,
        price,
        case when price is null then true else false end as price_missing
from
    {{ source('raw','raw_products')}}