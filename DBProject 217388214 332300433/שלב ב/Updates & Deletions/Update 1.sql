update missions
set mission_status = 'Review Required'
where mission_id IN (select ma.mission_id
                        from mission_assignments ma
                        JOIN flight_alerts fa ON ma.assignment_id = fa.assignment_id
                        where fa.severity_level = 5);