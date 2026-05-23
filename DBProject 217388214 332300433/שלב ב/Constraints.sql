-- constraint #1
alter table clients
add constraint check_valid_email_address
check (contact_email LIKE '%_@_%');

-- constraint #2
alter table missions
add constraint check_valid_mission_status
check (mission_status in ('Completed', 'Canceled', 'In Progress',
                          'Pending', 'Review Required', 'Scheduled') );

-- constraint #3
alter table operators
add constraint check_operator_names_not_empty
check (TRIM(first_name) <> '' AND TRIM(last_name) <> '');