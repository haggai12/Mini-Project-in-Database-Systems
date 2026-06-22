-- Adding a status column to manage drone availability dynamically
ALTER TABLE DRONES 
ADD COLUMN Drone_Status VARCHAR(20) DEFAULT 'Available';

-- Adding a Field_ID to MISSIONS to directly connect local missions to remote agriculture fields
ALTER TABLE MISSIONS 
ADD COLUMN Field_ID INT;