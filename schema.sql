-- CSC584 Individual Assignment — Kuala Selangor Tourism
-- Run this script once to set up the database:
--   psql -U raefdd -c "CREATE DATABASE csc584_tourism;"
--   psql -U raefdd -d csc584_tourism -f schema.sql

CREATE TABLE IF NOT EXISTS inquiries (
    id              SERIAL PRIMARY KEY,
    name            VARCHAR(255)    NOT NULL,
    contact_number  VARCHAR(50)     NOT NULL,
    gender          VARCHAR(10)     NOT NULL,
    email           VARCHAR(255)    NOT NULL,
    how_heard       VARCHAR(100)    NOT NULL,
    message         TEXT            NOT NULL,
    submitted_at    TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS admin_users (
    id          SERIAL PRIMARY KEY,
    username    VARCHAR(100) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL
);

INSERT INTO admin_users (username, password)
VALUES ('admin', 'admin123')
ON CONFLICT (username) DO NOTHING;
