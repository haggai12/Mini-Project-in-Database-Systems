-- Method A for the First Query. Find all Drone Models that are available (not in a mission) on a certain date
SELECT distinct Model_Name, Manufacturer, Max_Flight_Time, Max_Payload_Weight
FROM Drone_Models NATURAL join drones d natural join 
						-- Drone_ID that are *NOT* in a Mission on the chosen_date
						(
						-- ALL lDron_ID
						SELECT Drone_ID
						FROM Drones
						
						EXCEPT
						
						-- Only Drone_ID that are in a Mission on the chosen_date
						SELECT Drone_ID
						FROM Missions NATURAL JOIN  Mission_Assignments NATURAL JOIN  Drones
						WHERE Mission_Date = '2025-08-30') AS Available_Drones;