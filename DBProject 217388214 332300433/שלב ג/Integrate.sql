-- Step 1: Enable the postgres_fdw extension to allow connecting to external PostgreSQL databases
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Step 2: Configure the connection to the remote Smart Agriculture database (DB2)
-- Replace the host with your actual Supabase DB2 host address found under Project Settings -> Database
CREATE SERVER agriculture_server
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (
    host 'aws-1-ap-southeast-1.pooler.supabase.com', 
    port '6543', 
    dbname 'postgres'
);

-- Step 3: Map the current user to the remote database user and provide the credentials
-- Replace 'YOUR_DB2_PASSWORD' with the actual password you set when creating the Agriculture project
CREATE USER MAPPING FOR current_user
SERVER agriculture_server
OPTIONS (
    user 'postgres', 
    password 'YOUR_DB2_PASSWORD'
);

-- Step 4: Import specific foreign tables from the agriculture database into the local public schema
-- We import 'fields' and 'pest_reports' to seamlessly connect crop health issues with drone mission planning
IMPORT FOREIGN SCHEMA public
LIMIT TO (fields, pest_reports)
FROM SERVER agriculture_server
INTO public;