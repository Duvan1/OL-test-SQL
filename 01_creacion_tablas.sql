-- ====================================
-- DROP tables if they exist (for re-runs)
-- ====================================
DROP TABLE IF EXISTS establishments;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS municipalities;

-- ====================================
-- MUNICIPALITIES
-- ====================================
CREATE TABLE municipalities (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- ====================================
-- USERS
-- ====================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL CHECK (role IN ('ADMIN', 'AUXILIAR')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================
-- MERCHANTS
-- ====================================
CREATE TABLE merchants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    municipality_id INT NOT NULL REFERENCES municipalities(id),
    phone VARCHAR(20),
    email VARCHAR(150),
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE')),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT REFERENCES users(id)
);

-- ====================================
-- ESTABLISHMENTS
-- ====================================
CREATE TABLE establishments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    revenue NUMERIC(12,2) NOT NULL CHECK (revenue >= 0),
    employees INT NOT NULL CHECK (employees >= 0),
    merchant_id INT NOT NULL REFERENCES merchants(id),
    municipality_id INT NOT NULL REFERENCES municipalities(id),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT REFERENCES users(id)
);
