-- Crear secuencia para los identificadores
CREATE SEQUENCE IF NOT EXISTS users_id_seq START 1;
CREATE SEQUENCE IF NOT EXISTS merchants_id_seq START 1;
CREATE SEQUENCE IF NOT EXISTS establishments_id_seq START 1;

-- Tabla de usuarios
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY DEFAULT nextval('users_id_seq'),
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL CHECK (role IN ('Administrador', 'Auxiliar de Registro')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_email CHECK (email LIKE '%@%.com')
);

-- Tabla de comerciantes
CREATE TABLE IF NOT EXISTS merchants (
    id BIGINT PRIMARY KEY DEFAULT nextval('merchants_id_seq'),
    name VARCHAR(255) NOT NULL,
    municipality VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255),
    registration_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Activo', 'Inactivo')),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by BIGINT NOT NULL, -- Referencia a la tabla de usuarios
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

-- Tabla de establecimientos
CREATE TABLE IF NOT EXISTS establishments (
    id BIGINT PRIMARY KEY DEFAULT nextval('establishments_id_seq'),
    name VARCHAR(255) NOT NULL,
    revenue DECIMAL(10,2) NOT NULL,
    employee_count INT NOT NULL,
    merchant_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_by BIGINT NOT NULL, -- Referencia a la tabla de usuarios
    FOREIGN KEY (merchant_id) REFERENCES merchants(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);
