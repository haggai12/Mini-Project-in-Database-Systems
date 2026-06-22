-- Function 2: Finds an available drone capable of carrying the required payload weight
CREATE OR REPLACE FUNCTION find_available_drone(required_payload_kg FLOAT)
RETURNS INT AS $$
DECLARE
    selected_drone_id INT := -1;
    drone_rec RECORD;
BEGIN
    -- Loop through all available drones using a Record
    FOR drone_rec IN 
        SELECT d.Drone_ID, dm.Max_Payload_Weight
        FROM DRONES d
        JOIN DRONE_MODELS dm ON d.Model_ID = dm.Model_ID
        WHERE d.Drone_Status = 'Available'
    LOOP
        -- Branching: Check if the current drone model can carry the required weight
        IF drone_rec.Max_Payload_Weight >= required_payload_kg THEN
            selected_drone_id := drone_rec.Drone_ID;
            EXIT; -- Exit the loop as soon as a suitable drone is found
        END IF;
    END LOOP;

    -- Exception handling: If no drone was found, raise an error
    IF selected_drone_id = -1 THEN
        RAISE EXCEPTION 'No available drone found capable of carrying % kg', required_payload_kg;
    END IF;

    RETURN selected_drone_id;
END;
$$ LANGUAGE plpgsql;