-- ==========================
-- Insertar municipios
-- ==========================
INSERT INTO municipalities (name)
VALUES 
    ('Bogotá'),
    ('Medellín'),
    ('Cali'),
    ('Barranquilla'),
    ('Cartagena')
ON CONFLICT (name) DO NOTHING;

-- ==========================
-- Insertar usuarios
-- ==========================
INSERT INTO users (name, email, password, role)
VALUES
    ('Administrador', 'admin@comercio.com', 'password123', 'Administrador'),
    ('Auxiliar de Registro', 'auxiliar@comercio.com', 'password456', 'Auxiliar de Registro')
ON CONFLICT (email) DO NOTHING;

-- ==========================
-- Insertar comerciantes
-- ==========================
INSERT INTO merchants (name, municipality_id, phone, email, registered_at, status, updated_by)
VALUES
    ('Comercio S.A.', (SELECT id FROM municipalities WHERE name = 'Bogotá'), '3001234567', 'comercio1@comercio.com', CURRENT_TIMESTAMP, 'Activo', 1),
    ('Mercado del Norte', (SELECT id FROM municipalities WHERE name = 'Medellín'), '3012345678', 'mercado1@comercio.com', CURRENT_TIMESTAMP, 'Activo', 1),
    ('Distribuciones Sur', (SELECT id FROM municipalities WHERE name = 'Cali'), '3023456789', 'distribuciones@sur.com', CURRENT_TIMESTAMP, 'Activo', 2),
    ('Alimentos del Valle', (SELECT id FROM municipalities WHERE name = 'Barranquilla'), '3034567890', 'alimentosvalle@comercio.com', CURRENT_TIMESTAMP, 'Activo', 2),
    ('Ropa y Moda', (SELECT id FROM municipalities WHERE name = 'Cartagena'), NULL, 'ropaymoda@comercio.com', CURRENT_TIMESTAMP, 'Inactivo', 1)
ON CONFLICT (email) DO NOTHING;

-- ==========================
-- Insertar establecimientos
-- ==========================
INSERT INTO establishments (name, revenue, employees_count, merchant_id, municipality_id, updated_by)
VALUES
    ('Tienda de Ropa', 15000.75, 5, 1, (SELECT id FROM municipalities WHERE name = 'Bogotá'), 1),
    ('Supermercado Norte', 25000.50, 10, 2, (SELECT id FROM municipalities WHERE name = 'Medellín'), 1),
    ('Distribución de Tecnología', 35000.00, 15, 3, (SELECT id FROM municipalities WHERE name = 'Cali'), 2),
    ('Restaurante del Valle', 12000.25, 7, 4, (SELECT id FROM municipalities WHERE name = 'Barranquilla'), 2),
    ('Bazar La Palma', 8000.00, 3, 5, (SELECT id FROM municipalities WHERE name = 'Cartagena'), 1),
    ('Café del Centro', 22000.00, 8, 1, (SELECT id FROM municipalities WHERE name = 'Bogotá'), 1),
    ('Juguetería Sur', 18000.90, 6, 2, (SELECT id FROM municipalities WHERE name = 'Medellín'), 2),
    ('Almacén El Buen Comer', 27000.30, 12, 3, (SELECT id FROM municipalities WHERE name = 'Cali'), 2),
    ('Zapatería del Norte', 13000.60, 5, 4, (SELECT id FROM municipalities WHERE name = 'Barranquilla'), 1),
    ('Hotel Los Andes', 55000.00, 25, 1, (SELECT id FROM municipalities WHERE name = 'Bogotá'), 1)
ON CONFLICT (name, merchant_id) DO NOTHING;
