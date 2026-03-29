
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (1, 'Yosef', 'Cohen');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (2, 'Avital', 'Levi');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (3, 'Daniel', 'Shapiro');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (4, 'Rachel', 'Mizrachi');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (5, 'Tamir', 'Friedman');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (6, 'Shira', 'Baruch');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (7, 'Noam', 'Goldstein');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (8, 'Ilan', 'Peretz');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (9, 'Michal', 'Agmon');
INSERT INTO OPERATORS (Operator_ID, First_Name, Last_Name) VALUES (10, 'Eitan', 'Katz');

INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (1, 'Israel Electric Corporation', 'ops@iec.co.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (2, 'Netivei Israel', 'inspections@netivei.co.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (3, 'Mekorot Water Company', 'survey@mekorot.co.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (4, 'Israel Nature and Parks Authority', 'research@parks.org.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (5, 'Rafael Advanced Defense Systems', 'logistics@rafael.co.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (6, 'Haifa Municipality', 'urban@haifa.muni.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (7, 'Technion Research Labs', 'aero@technion.ac.il');
INSERT INTO CLIENTS (Client_ID, Client_Name, Contact_Email) VALUES (8, 'Elbit Systems', 'field@elbitsystems.com');

INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (1, 'DJI', 2.7, 55.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (2, 'DJI', 0.9, 46.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (3, 'DJI', 1.6, 28.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (4, 'Skydio', 1.0, 35.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (5, 'Autel Robotics', 0.8, 42.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (6, 'Autel Robotics', 3.0, 120.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (7, 'Parrot', 0.5, 32.0);
INSERT INTO DRONE_MODELS (Model_ID, Manufacturer, Max_Payload_Weight, Max_Flight_Time) VALUES (8, 'Freefly', 6.8, 15.0);

INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (1, 'RGB Camera 48MP', 0.35);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (2, 'Thermal Infrared FLIR Vue Pro R', 0.42);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (3, 'LIDAR Velodyne Puck', 0.83);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (4, 'Multispectral MicaSense RedEdge-P', 0.18);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (5, 'Gas Detector MQ-135', 0.12);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (6, 'Hyperspectral Headwall Nano', 0.68);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (7, 'Magnetometer GEM GSMP-35', 0.54);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (8, 'RGB Camera 20MP Wide', 0.22);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (9, 'Thermal Infrared DJI Zenmuse H20T', 0.76);
INSERT INTO SENSORS (Sensor_ID, Sensor_Type, Weight_Kg) VALUES (10, 'LIDAR Livox Avia', 0.59);

INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (1, 'DJI-M350-00142A', '2024-03-15', 1);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (2, 'SKD-X10-007891', '2024-06-20', 4);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (3, 'DJI-MV3E-02814B', '2024-01-10', 2);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (4, 'AUT-EVO2-11583', '2023-11-05', 5);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (5, 'DJI-M30T-00287C', '2024-08-01', 3);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (6, 'SKD-S2P-004512', '2025-01-12', 4);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (7, 'DJI-INS3-00091D', '2023-09-28', 1);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (8, 'AUT-DGF-00034E', '2025-02-18', 6);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (9, 'PAR-ANF4-07721', '2024-04-22', 7);
INSERT INTO DRONES (Drone_ID, Serial_Number, Purchase_Date, Model_ID) VALUES (10, 'FRF-ALT-00008F', '2025-03-01', 8);

INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (1, 'Highway 6 Bridge Inspection', '2026-03-26', 'Inspection', 'Inspect structural integrity of support beams along southern span using thermal and RGB imaging', 'Completed', 2);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (2, 'Haifa Port Security Survey', '2026-03-26', 'Surveillance', 'Perimeter surveillance flight over Haifa port facility during shift change hours', 'In Progress', 6);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (3, 'Carmel Forest Fire Assessment', '2026-03-25', 'Survey', 'Post-fire damage assessment and vegetation recovery mapping with multispectral imaging', 'Completed', 4);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (4, 'Kinneret Water Level Scan', '2026-03-27', 'Survey', 'Shoreline mapping and water level measurement using LIDAR along the western shore', 'Scheduled', 3);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (5, 'Negev Solar Farm Inspection', '2026-03-28', 'Inspection', 'Thermal scan of 12000 panels at Ashalim solar facility to detect hotspots and defects', 'Scheduled', 1);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (6, 'Tel Aviv Coastline Erosion', '2026-03-24', 'Survey', 'High-resolution coastline mapping from Herzliya to Jaffa for erosion rate calculation', 'Completed', 6);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (7, 'Power Line Corridor North', '2026-03-26', 'Inspection', 'Transmission tower and line inspection from Hadera to Afula using LIDAR and thermal', 'In Progress', 1);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (8, 'Technion Campus 3D Mapping', '2026-03-22', 'Survey', 'Full campus photogrammetry for construction planning of new engineering building', 'Completed', 7);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (9, 'Dead Sea Sinkhole Monitoring', '2026-03-29', 'Survey', 'Recurring sinkhole monitoring flight along Route 90 using LIDAR and RGB', 'Pending', 4);
INSERT INTO MISSIONS (Mission_ID, Mission_Title, Mission_Date, Mission_Type, Mission_Description, Mission_Status, Client_ID) VALUES
  (10, 'Rafael Test Range Recon', '2026-03-23', 'Surveillance', 'Pre-test range clearance and perimeter documentation flight', 'Completed', 5);

INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (1, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (1, 2);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (1, 3);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (1, 4);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (2, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (2, 3);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (2, 6);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (3, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (3, 6);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (3, 8);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (4, 2);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (4, 4);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (4, 7);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (5, 4);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (5, 7);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (6, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (6, 8);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (7, 6);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (7, 8);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (8, 2);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (8, 3);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (8, 5);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (9, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (9, 3);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (10, 1);
INSERT INTO FITS (Sensor_ID, Model_ID) VALUES (10, 6);

INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-09-01', '2027-09-01', 1, 1);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-06-15', '2027-06-15', 2, 1);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-03-20', '2027-03-20', 2, 2);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-11-10', '2027-11-10', 3, 3);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-07-05', '2027-07-05', 4, 4);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2025-01-15', '2028-01-15', 6, 4);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-04-22', '2027-04-22', 4, 5);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2025-02-01', '2028-02-01', 4, 6);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-08-30', '2027-08-30', 7, 7);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2025-03-10', '2028-03-10', 8, 8);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-05-18', '2027-05-18', 1, 9);
INSERT INTO OPERATOR_CERTIFICATIONS (License_Issue_Date, License_Expiration_Date, Model_ID, Operator_ID) VALUES ('2024-12-01', '2027-12-01', 5, 10);

INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (1, 1, 1, 1);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (2, 2, 3, 2);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (3, 3, 5, 3);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (4, 4, 8, 3);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (5, 5, 2, 4);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (6, 1, 7, 5);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (7, 6, 6, 6);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (8, 7, 9, 6);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (9, 3, 1, 7);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (10, 8, 10, 8);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (11, 2, 5, 9);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (12, 9, 4, 10);

INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (1, 1);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (2, 1);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (1, 2);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (4, 3);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (3, 4);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (3, 5);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (2, 6);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (8, 7);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (1, 8);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (9, 9);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (10, 9);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (1, 10);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (3, 11);
INSERT INTO ASSIGNMENT_SENSORS (Sensor_ID, Assignment_ID) VALUES (8, 12);

INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (1, '2026-03-25', 'Motor #3 replacement due to bearing wear detected during post-flight check', 1850.00, 4);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (2, '2026-03-24', 'LIDAR sensor calibration and alignment verification', 420.00, 3);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (3, '2026-03-22', 'Battery cell replacement - cells 3 and 4 below capacity threshold', 2200.00, 1);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (4, '2026-03-20', 'Full airframe inspection and propeller replacement at 200hr mark', 680.00, 7);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (5, '2026-03-18', 'Flight controller firmware update v4.2.1 and IMU recalibration', 0.00, 5);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (6, '2026-03-15', 'Landing gear strut replacement after hard landing incident', 1200.00, 2);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (7, '2026-03-12', 'ESC board replacement on motor arm 2', 1550.00, 8);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (8, '2026-03-10', 'GPS module antenna swap and compass calibration', 380.00, 6);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (9, '2026-03-08', 'Routine 100hr service - filters, propellers, visual inspection', 250.00, 9);
INSERT INTO MAINTENANCE_LOGS (Log_ID, Maintenance_Date, Work_Description, Cost, Drone_ID) VALUES
  (10, '2026-03-05', 'Gimbal motor replacement and vibration dampener install', 890.00, 10);

INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (1, '2026-03-26', 5, 'Battery below critical threshold - forced RTH initiated', 1);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (2, '2026-03-26', 3, 'Wind speed exceeded 30 knots at current altitude', 2);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (3, '2026-03-26', 5, 'GPS signal lost - position hold engaged', 3);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (4, '2026-03-26', 3, 'Approaching restricted airspace perimeter', 9);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (5, '2026-03-26', 1, 'Sensor calibration drift detected on LIDAR unit', 4);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (6, '2026-03-26', 4, 'Motor #3 temperature exceeding operational threshold', 2);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (7, '2026-03-25', 5, 'Proximity sensor offline - obstacle avoidance degraded', 12);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (8, '2026-03-25', 1, 'Waypoint WP-07 reached - transitioning to survey pattern', 7);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (9, '2026-03-25', 3, 'Telemetry latency exceeded 500ms threshold', 8);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (10, '2026-03-24', 2, 'Flight controller firmware update available v4.2.1', 5);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (11, '2026-03-24', 5, 'Propeller vibration anomaly - immediate inspection required', 12);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
  (12, '2026-03-23', 3, 'Geofence perimeter reached - position hold active', 10);
