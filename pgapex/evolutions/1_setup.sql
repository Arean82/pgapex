DROP SCHEMA IF EXISTS pgapex CASCADE;
CREATE SCHEMA pgapex;
CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA pgapex;
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA pgapex;
