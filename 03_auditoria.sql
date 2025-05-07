-- Insertar usuarios
INSERT INTO users (name, email, password, role, created_at, updated_at)
VALUES
    ('Administrador', 'admin@comercio.com', 'password123', 'Administrador', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Auxiliar de Registro', 'auxiliar@comercio.com', 'password456', 'Auxiliar de Registro', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insertar comerciantes
INSERT INTO merchants (name, municipality, phone, email, registration_date, status, created_at, updated_at, updated_by)
VALUES
    ('Comercio S.A.', 'Bogotá', '3001234567', 'comercio1@comercio.com', CURRENT_TIMESTAMP, 'Activo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Mercado del Norte', 'Medellín', '3012345678', 'mercado1@comercio.com', CURRENT_TIMESTAMP, 'Activo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Distribuciones Sur', 'Cali', '3023456789', 'distribuciones@sur.com', CURRENT_TIMESTAMP, 'Activo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Alimentos del Valle', 'Barranquilla', '3034567890', 'alimentosvalle@comercio.com', CURRENT_TIMESTAMP, 'Activo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Ropa y Moda', 'Cartagena', NULL, 'ropaymoda@comercio.com', CURRENT_TIMESTAMP, 'Inactivo', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);

-- Insertar establecimientos
INSERT INTO establishments (name, revenue, employee_count, merchant_id, created_at, updated_at, updated_by)
VALUES
    ('Tienda de Ropa', 15000.75, 5, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Supermercado Norte', 25000.50, 10, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Distribución de Tecnología', 35000.00, 15, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Restaurante del Valle', 12000.25, 7, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Bazar La Palma', 8000.00, 3, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Café del Centro', 22000.00, 8, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Juguetería Sur', 18000.90, 6, 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Almacén El Buen Comer', 27000.30, 12, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 2),
    ('Zapatería del Norte', 13000.60, 5, 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1),
    ('Hotel Los Andes', 55000.00, 25, 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1);
