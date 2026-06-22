CREATE OR REPLACE PROCEDURE auto_assign_urgent_missions(min_severity INT)
LANGUAGE plpgsql AS $$
DECLARE
    report_rec RECORD;
    assigned_drone_id INT;
    new_mission_id INT;
    valid_client_id INT; 
BEGIN
    -- Get the maximum mission ID to generate a new one safely
    SELECT COALESCE(MAX(Mission_ID), 0) INTO new_mission_id FROM MISSIONS;
    
    
    SELECT COALESCE(MIN(Client_ID), 0) INTO valid_client_id FROM CLIENTS;

    -- Loop iterating over the remote pest reports
    FOR report_rec IN 
        SELECT report_id, field_id, severity_level 
        FROM pest_reports 
        WHERE severity_level >= min_severity
    LOOP
        BEGIN
            -- Attempt to find a drone capable of carrying a 5.0 kg payload
            assigned_drone_id := find_available_drone(5.0);
            
            new_mission_id := new_mission_id + 1;
            
            -- DML: Insert a new mission using the VALID client ID!
            INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID, Field_ID)
            VALUES (new_mission_id, 'Urgent Pest Control', CURRENT_DATE, 'Spraying', 'Auto-assigned mission for severe pest outbreak', 'Pending', valid_client_id, report_rec.field_id);
            
            -- DML: Update the assigned drone's status to indicate it is busy
            UPDATE DRONES 
            SET Drone_Status = 'In Mission' 
            WHERE Drone_ID = assigned_drone_id;
            
            RAISE NOTICE 'Mission created successfully for report % with drone %', report_rec.report_id, assigned_drone_id;
            
        EXCEPTION 
            -- Exception Handling: Catch any error and print it cleanly
            WHEN OTHERS THEN
                RAISE NOTICE 'Skipping report %: %', report_rec.report_id, SQLERRM;
        END;
    END LOOP;
END;
$$;