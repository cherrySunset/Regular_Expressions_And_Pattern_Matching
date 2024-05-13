CREATE OR REPLACE FUNCTION validate_product_name()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.Product_name ~ '^[A-Z][a-zA-Z0-9 ]{4,}$' THEN
        RETURN NEW;
    ELSE
        RAISE EXCEPTION 'Product name must start with an uppercase letter and be at least five characters long';
    END IF;
END;
$$ LANGUAGE plpgsql;



-- Create the trigger
CREATE TRIGGER product_name_validation
BEFORE INSERT ON Products
FOR EACH ROW
EXECUTE FUNCTION validate_product_name();


---------------------------- Trigger testing
BEGIN;

-- Correct data
INSERT INTO Products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES 
    (78, 'Apple', 25, 1, '5 kg', 10, 6, 0, 30, 0),
    (79, 'Banana', 17, 4, '3 kg', 19, 8, 0, 15, 0);

-- Incorrect data
INSERT INTO Products (product_id, product_name, supplier_id, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES 
    (80, '12345', 14, 2, '400 ml', 30, 5, 0, 0, 0), 
    (81, 'a1234', 2, 1, '53 kg', 32.9, 12, 0, 0, 0); 

COMMIT;


