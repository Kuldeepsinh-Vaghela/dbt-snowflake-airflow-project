{% macro get_month_name(column_name)%}
case
    when {{column_name}} = 1 then 'January'
    when {{column_name}} = 2 then 'February'
    when {{column_name}} = 3 then 'March'
    when {{column_name}} = 4 then 'April'
    when {{column_name}} = 5 then 'May'
    when {{column_name}} = 6 then 'June'
    when {{column_name}} = 7 then 'July'
    when {{column_name}} = 8 then 'August'
    when {{column_name}} = 9 then 'September'
    when {{column_name}} = 10 then 'October'
    when {{column_name}} = 11 then 'November'
    else 'December'
end
{% endmacro %}