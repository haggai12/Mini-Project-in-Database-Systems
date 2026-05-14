DELETE FROM flight_alerts 
where alert_id between 30000 and 30013;

delete from mission_assignments
where assignment_id in (700, 701, 702);

delete from missions
where mission_id = 700;