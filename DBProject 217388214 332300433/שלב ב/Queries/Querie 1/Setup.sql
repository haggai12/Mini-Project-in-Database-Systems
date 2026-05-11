INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, 
					  Mission_Status, Client_ID) VALUES
					(700, 'part 2 Query 1', '2025-08-30', 
					'Test', 'add a mission to see if it gets of the query', 'in progress', 600);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) 
VALUES							(700		  , 390		   , 136	 , 700);