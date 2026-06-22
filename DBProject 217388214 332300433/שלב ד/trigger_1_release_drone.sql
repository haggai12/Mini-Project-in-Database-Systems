-- Trigger Function 1: Updates drone status to 'Available' when a mission is completed
CREATE OR REPLACE FUNCTION release_drone_on_mission_complete()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if the mission status was just updated to 'Completed'
    IF NEW.Mission_Status = 'Completed' AND OLD.Mission_Status <> 'Completed' THEN
        -- Update the drone's status. We find the drone via the MISSION_ASSIGNMENTS table.
        UPDATE DRONES
        SET Drone_Status = 'Available'
        WHERE Drone_ID IN (
            SELECT Drone_ID 
            FROM MISSION_ASSIGNMENTS 
            WHERE Mission_ID = NEW.Mission_ID
        );
        
        RAISE NOTICE 'Mission % completed. Drone released.', NEW.Mission_ID;
    END IF;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger 1 Definition: Fires AFTER an UPDATE on the MISSIONS table
CREATE TRIGGER trg_release_drone
AFTER UPDATE ON MISSIONS
FOR EACH ROW
EXECUTE FUNCTION release_drone_on_mission_complete();