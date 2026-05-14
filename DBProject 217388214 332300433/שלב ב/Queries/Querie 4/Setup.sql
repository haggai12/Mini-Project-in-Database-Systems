INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (700, 1, 1, 700);
INSERT INTO MISSION_ASSIGNMENTS (Assignment_ID, Operator_ID, Drone_ID, Mission_ID) VALUES (701, 2, 2, 700);

INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
(30000, '2026-05-14 08:27:31.467', 5, 'Alert # 1 for a test', 700);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
(30001, '2026-05-14 08:28:31.467', 4, 'Alert # 2 for a test', 700);
INSERT INTO FLIGHT_ALERTS (Alert_ID, Alert_Timestamp, Severity_Level, Alert_Message, Assignment_ID) VALUES
(30002, '2026-05-14 08:30:31.467', 3, 'Alert # 3 for a test', 700);