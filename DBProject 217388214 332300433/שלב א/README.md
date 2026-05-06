# Drone Mission Management System

**Database Mini-Project — Stage 1**

---

**Submitted by:** Yehuda Levy | 332300433
                   Haggai Slater | 217388314

**System:** Drone Mission Management System

**Unit:** Fleet Operations and Mission Coordination

**Course:** Database Structures

**Institution:** Machon Lev — Jerusalem College of Technology

**Date:** March 2026

---

## Table of Contents

1. [Introduction](#1-introduction)
2. [System Description](#2-system-description)
3. [Screen Mockups](#3-screen-mockups)
4. [ERD Diagram](#4-erd-diagram)
5. [DSD Diagram](#5-dsd-diagram)
6. [Design Decisions](#6-design-decisions)
7. [Data Insertion Methods](#7-data-insertion-methods)
8. [Backup and Restore](#8-backup-and-restore)

---

## 1. Introduction

The Drone Mission Management System is a relational database designed to support the operational lifecycle of a commercial drone fleet. The system tracks the full chain from client requests through mission planning, operator assignment, flight execution, sensor payload management, post-flight alerts, and ongoing hardware maintenance.

The core problem the system addresses is resource coordination: ensuring that the right drone with the right sensor payload is assigned to the right operator for each mission, while respecting certification requirements, hardware compatibility, and maintenance schedules. The database enforces these constraints at the schema level through foreign keys, check constraints, and unique constraints.

The data domain was chosen because drone fleet operations naturally produce rich relational structures — many-to-many relationships (missions to drones, sensors to assignments), meaningful date fields (certification windows, mission scheduling, maintenance tracking), and hierarchical dependencies (drone models to individual drones, operators to certifications) — making it well-suited for a normalized relational database project.

---

## 2. System Description

The system manages the following core data:

**Fleet Hardware** — Individual drones are tracked by serial number and linked to a drone model that defines manufacturer specs (max payload weight, max flight time). Sensors are cataloged by type and weight, and a compatibility table (FITS) records which sensors can be mounted on which drone models.

**Personnel** — Operators are registered with basic identity information. Each operator holds certifications for specific drone models, with issue and expiration dates. The system can determine whether an operator is qualified to fly a given drone on a given date.

**Mission Lifecycle** — Clients submit mission requests with a title, type, date, description, and status. Each mission can involve multiple drones and operators through a junction table (MISSION_ASSIGNMENTS). Each assignment can carry multiple sensors through a second junction table (ASSIGNMENT_SENSORS). This structure supports multi-drone swarm missions as well as simple single-operator flights.

**Safety and Maintenance** — Flight alerts are logged against specific assignments with a severity level (1 through 5) and timestamped message. Maintenance logs track all service work performed on each drone, including cost, date, and work description.

**Key Functional Queries the System Supports:**
- Which operators are certified to fly a specific drone model and have a valid (non-expired) license?
- Which sensors are compatible with the drone assigned to a given mission?
- What is the total maintenance cost for each drone over a given period?
- Which missions had critical alerts (severity 4 or 5)?
- Which drones are due for service based on their last maintenance date?
- What is the mission history for a specific client?

---

## 3. Screen Mockups

The UI prototype was built as a single-page HTML application with four interactive screens. The design follows an industrial/utilitarian aesthetic with a dark theme, monospace data readouts, and SVG-based iconography.

### Screen 1 — Fleet Overview (Dashboard)

The main operational dashboard provides a real-time snapshot of fleet status. It includes four KPI summary cards (fleet size, active missions, drones in maintenance, active operators), a situational map with animated position reticles for airborne drones, and a sortable fleet status table showing each drone's ID, model, flight status, battery level, and assigned operator.

![Dashboard Screenshot](screenshots/dashboard.png)

### Screen 2 — Mission Planning

The mission setup screen uses a step-by-step wizard for configuring new missions. The left panel contains the mission form (title, start/end time, type, coordinates, objective, priority level). The right panel shows a calendar with scheduled mission dates and an availability checker listing drones, operators, and sensors with their current status — ready units are selectable, assigned units are grayed out.

![Mission Planning Screenshot](screenshots/mission_planning.png)

### Screen 3 — Maintenance Hangar

The maintenance screen displays health cards for each drone in the fleet, with progress bars for battery health, motor hours consumed, and days until next scheduled service. Color coding (green/amber/red) provides immediate visual triage. Below the cards, a service history table logs all completed and in-progress maintenance work with technician name, cost, and status.

![Maintenance Screenshot](screenshots/maintenance.png)

### Screen 4 — Alert Log

The alert log is a filterable, chronological ledger of flight safety events. Severity filter chips (Critical, Warning, Info) and a date range picker control the visible entries. Clicking an alert row populates a detail sidebar showing the full telemetry snapshot — flight ID, drone ID, timestamp, coordinates, altitude, battery level, and resolution status. Action buttons allow acknowledging alerts, viewing the flight path, or exporting reports.

![Alerts Screenshot](screenshots/alerts.png)

---

## 4. ERD Diagram

The Entity-Relationship Diagram was designed in ERD Plus. The system contains 8 core entities and 4 relationship tables (including 2 junction tables for many-to-many relationships).

![ERD Diagram](diagrams/ERD.png)

**Entity count:** 12 tables total. No separate enum/lookup tables were used — status and type values are stored as VARCHAR fields with application-level validation.

**Relationship summary:**
- OPERATORS (1) --- (M) MISSION_ASSIGNMENTS
- DRONES (1) --- (M) MISSION_ASSIGNMENTS
- MISSIONS (1) --- (M) MISSION_ASSIGNMENTS
- MISSION_ASSIGNMENTS (1) --- (M) ASSIGNMENT_SENSORS
- MISSION_ASSIGNMENTS (1) --- (M) FLIGHT_ALERTS
- DRONES (1) --- (M) MAINTENANCE_LOGS
- DRONE_MODELS (1) --- (M) DRONES
- CLIENTS (1) --- (M) MISSIONS
- SENSORS (M) --- (M) DRONE_MODELS (via FITS)
- OPERATORS (M) --- (M) DRONE_MODELS (via OPERATOR_CERTIFICATIONS)

---

## 5. DSD Diagram

The Data Structure Diagram shows the physical schema with all column names, data types, primary keys, foreign keys, and constraints.

![DSD Diagram](diagrams/DSD.png)

**Table details:**

| Table | Columns | PK | FKs | Notable Constraints |
|---|---|---|---|---|
| OPERATORS | 3 | Operator_ID | — | — |
| CLIENTS | 3 | Client_ID | — | — |
| DRONE_MODELS | 4 | Model_ID | — | Max_Payload_Weight > 0, Max_Flight_Time > 0 |
| SENSORS | 3 | Sensor_ID | — | Weight_Kg > 0 |
| DRONES | 4 | Drone_ID | Model_ID | Serial_Number UNIQUE |
| MISSIONS | 7 | Mission_ID | Client_ID | Mission_Status DEFAULT 'Pending' |
| FITS | 2 | (Sensor_ID, Model_ID) | Sensor_ID, Model_ID | — |
| OPERATOR_CERTIFICATIONS | 4 | (Model_ID, Operator_ID) | Model_ID, Operator_ID | Expiration > Issue date |
| MISSION_ASSIGNMENTS | 4 | Assignment_ID | Operator_ID, Drone_ID, Mission_ID | UNIQUE(Mission_ID, Drone_ID) |
| ASSIGNMENT_SENSORS | 2 | (Sensor_ID, Assignment_ID) | Sensor_ID, Assignment_ID | — |
| MAINTENANCE_LOGS | 5 | Log_ID | Drone_ID | Cost >= 0, NUMERIC(10,2) |
| FLIGHT_ALERTS | 5 | Alert_ID | Assignment_ID | Severity BETWEEN 1 AND 5 |

---

## 6. Design Decisions

**MISSION_ASSIGNMENTS as a junction table with its own surrogate key:**
The original design used a composite primary key of (Assignment_ID, Operator_ID, Drone_ID, Mission_ID). This was simplified to a single-column PK on Assignment_ID because two child tables (FLIGHT_ALERTS and ASSIGNMENT_SENSORS) need to reference assignments via foreign key — referencing a 4-column composite PK from multiple child tables would be unwieldy and error-prone. A UNIQUE constraint on (Mission_ID, Drone_ID) was added to prevent the same drone from being assigned twice to the same mission.

**Separate DRONE_MODELS and DRONES tables:**
Rather than storing manufacturer and spec data on each drone record, the model information is normalized into a separate DRONE_MODELS table. This avoids data redundancy when multiple drones share the same model and allows the FITS compatibility table to reference models rather than individual drones.

**FITS compatibility table:**
Sensor-to-drone compatibility is not a simple attribute — it depends on the drone model, not the individual drone. The FITS junction table allows querying which sensors can be mounted on a given model, which feeds into the mission planning workflow (the UI prototype shows a "Check Compatibility" button that would query this table).

**OPERATOR_CERTIFICATIONS with composite PK:**
An operator can be certified on multiple models, and each certification has its own issue and expiration dates. The composite key (Model_ID, Operator_ID) naturally prevents duplicate certifications and allows date-range queries to determine current eligibility.

**Cost as NUMERIC(10,2) rather than INT or FLOAT:**
Maintenance costs require exact decimal precision for financial records. FLOAT would introduce rounding errors; INT would lose decimal places. NUMERIC(10,2) supports costs up to 99,999,999.99 with exact two-decimal precision.

**Severity as INT with CHECK constraint rather than enum table:**
Severity levels (1 through 5) are a fixed, well-understood scale that is unlikely to change. A CHECK constraint is simpler and more performant than a foreign key lookup to a separate table for this case.

**VARCHAR for Mission_Status and Mission_Type:**
These fields use VARCHAR with application-level validation rather than enum tables. This was a deliberate trade-off — adding enum tables would increase the entity count but add minimal value for fields with a small, stable set of values (Pending, Scheduled, In Progress, Completed for status; Survey, Inspection, Surveillance, Delivery for type).

---

## 7. Data Insertion Methods

Data was inserted using three different methods as required.

### Method 1 — Manual INSERT Statements

Direct SQL INSERT statements were written for the initial seed data across all 12 tables. This method was used to populate the base/parent tables (OPERATORS, CLIENTS, DRONE_MODELS, SENSORS) and a representative sample of dependent table data to verify referential integrity.

File: `insertTables.sql`

![Manual Insert Screenshot](screenshots/insert_manual.png)

### Method 2 — Python Script

A Python script was developed to generate large volumes of realistic data for the high-volume tables (MISSION_ASSIGNMENTS, FLIGHT_ALERTS, MAINTENANCE_LOGS). The script respects all foreign key relationships and CHECK constraints, generating valid random data within the defined bounds.

Files located in: `Programming/`

![Python Generator Screenshot](screenshots/insert_python.png)

### Method 3 — [Mockaroo / CSV Import / Other]

[Description of the third method chosen — screenshots and files to be added]

Files located in: `[DataImportFiles / mockarooFiles / generatedataFiles]/`

![Third Method Screenshot](screenshots/insert_method3.png)

---

## 8. Backup and Restore

### Backup

A full database backup was created using `pg_dump` via the Supabase CLI. The backup file is stored in the repository root as `backup_YYYY-MM-DD.sql`.

Command used:
```
pg_dump -h [host] -U postgres -d postgres -F p -f backup_2026-03-29.sql
```

![Backup Screenshot](screenshots/backup.png)

### Restore

The backup was restored on a separate machine to verify integrity. All tables were recreated successfully with full data.

Command used:
```
psql -h [host] -U postgres -d postgres -f backup_2026-03-29.sql
```

![Restore Screenshot](screenshots/restore.png)

---

## File Structure

```
DBProject/
|-- Stage_1/
|   |-- README.md
|   |-- createTables.sql
|   |-- dropTables.sql
|   |-- insertTables.sql
|   |-- selectAll.sql
|   |-- diagrams/
|   |   |-- ERD.png
|   |   |-- DSD.png
|   |-- screenshots/
|   |   |-- dashboard.png
|   |   |-- mission_planning.png
|   |   |-- maintenance.png
|   |   |-- alerts.png
|   |   |-- insert_manual.png
|   |   |-- insert_python.png
|   |   |-- insert_method3.png
|   |   |-- backup.png
|   |   |-- restore.png
|   |-- Programming/
|   |   |-- generate_data.py
|   |   |-- [output files]
|   |-- [DataImportFiles or mockarooFiles]/
|   |   |-- [import files]
|   |-- backup_2026-03-29.sql
```
