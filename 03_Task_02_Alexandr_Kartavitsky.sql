SELECT 
    REGEXP_REPLACE(Phone, '^(\d{3})(\d{3})(\d{4})$', '(\1) \2-\3') AS formatted_phone
FROM 
    customers
LIMIT 10;

