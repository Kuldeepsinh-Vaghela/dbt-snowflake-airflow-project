select 
    TO_NUMBER(to_char(order_date,'YYYYMMDD')) as date_id,
    order_date,
    date_part('day',order_date) as order_day,
    date_part('month', order_date) as order_month,
    date_part('year', order_date) as order_year,
    {{ get_month_name("order_month")}} as month_name,
    date_part('quarter', order_date) as quarter_of_year,
    dayofweekiso(order_date) as day_of_week,
    dayname(order_date) as weekday_name
from {{ ref("stg_sales")}}