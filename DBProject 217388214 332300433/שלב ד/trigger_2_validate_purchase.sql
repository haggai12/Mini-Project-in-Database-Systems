-- Trigger Function 2: Validates that a new drone's purchase date is not in the future
CREATE OR REPLACE FUNCTION validate_drone_purchase_date()
RETURNS TRIGGER AS $$
BEGIN
    -- Branching and Exception: Prevent future dates to maintain data integrity
    IF NEW.Purchase_Date > CURRENT_DATE THEN
        RAISE EXCEPTION 'Invalid Purchase_Date: Cannot register a drone from the future (%).', NEW.Purchase_Date;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger 2 Definition: Fires BEFORE an INSERT on the DRONES table
CREATE TRIGGER trg_validate_purchase
BEFORE INSERT ON DRONES
FOR EACH ROW
EXECUTE FUNCTION validate_drone_purchase_date();