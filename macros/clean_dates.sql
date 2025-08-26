{% macro clean_dates(column_name) %}
case
        when try_to_date({{column_name}}, 'YYYY-MM-DD') 
            between '1900-01-01' and '2100-12-31'
        then try_to_date({{column_name}}, 'YYYY-MM-DD')

        when try_to_date({{column_name}}, 'DD-MM-YY') 
            between '1900-01-01' and '2100-12-31'
        then try_to_date({{column_name}}, 'DD-MM-YY')

        when try_to_date({{column_name}}, 'MM-DD-YY') 
            between '1900-01-01' and '2100-12-31'
        then try_to_date({{column_name}}, 'MM-DD-YY')

        when try_to_date({{column_name}}, 'DD/MM/YYYY') 
            between '1900-01-01' and '2100-12-31'
        then try_to_date({{column_name}}, 'DD/MM/YYYY')
    end 
{% endmacro %}