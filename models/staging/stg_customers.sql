select
    customer_id,
    coalesce(replace(customer_name, ' ', ''), 'UNKNOWN_NAME') as customer_name,
    coalesce(REGEXP_SUBSTR(email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.com$'), 'UNKNOWN_EMAIL') as email,
    coalesce(address,'UNKNOWN_ADDRESS') as address,
    case 
        when length(REGEXP_REPLACE(phone, '[\s\.\(\)\-]','')) = 10 then REGEXP_REPLACE(phone, '[\s\.\(\)\-]','')
        ELSE'UNKNOWN_PHONENUMBER'  
    END as phone
from {{ source('raw','raw_customers') }}
