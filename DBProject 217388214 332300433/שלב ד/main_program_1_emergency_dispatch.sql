-- Main Program 1: Handles emergency agricultural reports
-- Calls Function 1 (get_urgent_pest_reports) and Procedure 1 (auto_assign_urgent_missions)
DO $$
DECLARE
    urgent_cursor refcursor;
    report_rec RECORD;
BEGIN
    RAISE NOTICE '--- Starting Main Program 1: Emergency Dispatch ---';
    
    -- 1. Call Function 1 to get the Ref Cursor
    urgent_cursor := get_urgent_pest_reports(4);
    
    -- Fetch the first record to prove the function works
    FETCH urgent_cursor INTO report_rec;
    IF FOUND THEN
        RAISE NOTICE 'Function Success: Found urgent report for field % with severity %.', report_rec.field_id, report_rec.severity_level;
    ELSE
        RAISE NOTICE 'Function Success: No urgent reports found at the moment.';
    END IF;
    CLOSE urgent_cursor;
    
    RAISE NOTICE 'Calling Procedure 1 to auto-assign missions...';
    
    -- 2. Call Procedure 1 to perform the DML updates
    CALL auto_assign_urgent_missions(4);
    
    RAISE NOTICE '--- Main Program 1 Finished Successfully ---';
END;
$$;