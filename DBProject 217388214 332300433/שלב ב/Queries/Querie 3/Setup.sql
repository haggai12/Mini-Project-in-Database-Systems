INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (700, 'TEST_DRONE', '2000-03-15', 1);

INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (30000, '2026-03-15', 'testing querie 3', 0.00, 700);

INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (30001, '2026-03-17', 'testing querie 3', 0.00, 700);
