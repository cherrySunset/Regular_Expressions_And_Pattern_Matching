CREATE OR REPLACE FUNCTION classify_customer_by_postal_code(postal_code VARCHAR) 
RETURNS VARCHAR AS $$
DECLARE
    pattern TEXT;
BEGIN
    -- Define the pattern to match local postal codes
    pattern := '^\d{5}$';

    -- Check if the postal code matches the local pattern
    IF postal_code ~ pattern THEN
        RETURN 'Local';
    END IF;

    -- Define the pattern to match national postal codes
    pattern := '^\d{3}-\d{3}$';

    -- Check if the postal code matches the national pattern
    IF postal_code ~ pattern THEN
        RETURN 'National';
    END IF;

    -- If the postal code does not match any of the above patterns, classify as International
    RETURN 'International';
END;
$$ LANGUAGE plpgsql;

-----
SELECT *,
       classify_customer_by_postal_code(postal_code) AS Classification
FROM Customers
LIMIT 10;