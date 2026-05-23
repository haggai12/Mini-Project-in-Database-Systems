-- Delete 2: Remove old "ghost" missions (older than 1 year) that were never assigned
DELETE FROM missions
WHERE mission_id NOT IN (
    SELECT mission_id 
    FROM mission_assignments
)
AND mission_date < CURRENT_DATE - INTERVAL '1 year';