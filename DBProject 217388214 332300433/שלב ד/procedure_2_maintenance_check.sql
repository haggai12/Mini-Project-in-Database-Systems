-- Procedure 2: Identifies drones purchased before a certain date and flags them for maintenance
CREATE OR REPLACE PROCEDURE flag_drones_for_maintenance(purchase_cutoff DATE)
LANGUAGE plpgsql AS $$
DECLARE
    -- Explicit cursor declaration to fetch specific drones
    drone_cursor CURSOR FOR 
        SELECT Drone_ID 
        FROM DRONES 
        WHERE Purchase_Date < purchase_cutoff AND Drone_Status = 'Available';
    current_drone_id INT;
BEGIN
    -- Open the explicit cursor
    OPEN drone_cursor;
    
    LOOP
        -- Fetch row by row
        FETCH drone_cursor INTO current_drone_id;
        EXIT WHEN NOT FOUND;
        
        -- DML: Update drone status to Maintenance
        UPDATE DRONES 
        SET Drone_Status = 'Maintenance' 
        WHERE Drone_ID = current_drone_id;
        
        RAISE NOTICE 'Drone ID % sent to maintenance.', current_drone_id;
    END LOOP;
    
    -- Close the explicit cursor
    CLOSE drone_cursor;
END;
$$;