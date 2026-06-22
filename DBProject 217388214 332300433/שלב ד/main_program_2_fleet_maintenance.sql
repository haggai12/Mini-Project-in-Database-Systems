-- Main Program 2: Handles fleet logistics and maintenance
-- Calls Function 2 (find_available_drone) and Procedure 2 (flag_drones_for_maintenance)
DO $$
DECLARE
    available_drone_id INT;
BEGIN
    RAISE NOTICE '--- Starting Main Program 2: Fleet Maintenance ---';
    
    -- 1. Call Function 2 to find a drone capable of carrying 3.5 kg
    BEGIN
        available_drone_id := find_available_drone(3.5);
        RAISE NOTICE 'Function Success: Found available Drone ID % capable of carrying the payload.', available_drone_id;
    EXCEPTION 
        WHEN OTHERS THEN
            RAISE NOTICE 'Function Exception Caught: %', SQLERRM;
    END;
    
    RAISE NOTICE 'Calling Procedure 2 to flag old drones for maintenance...';
    
    -- 2. Call Procedure 2 to perform DML updates (Replace the date with a relevant past date from your DB)
    CALL flag_drones_for_maintenance('2024-01-01');
    
    RAISE NOTICE '--- Main Program 2 Finished Successfully ---';
END;
$$;