CREATE OR REPLACE FUNCTION update_merchant_audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;  -- Actualiza la fecha de última actualización
    NEW.updated_by = CURRENT_USER;  -- Asigna el usuario que realiza la actualización
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_merchant_audit
BEFORE UPDATE ON merchants
FOR EACH ROW
EXECUTE FUNCTION update_merchant_audit();

CREATE OR REPLACE FUNCTION update_establishment_audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;  -- Actualiza la fecha de última actualización
    NEW.updated_by = CURRENT_USER;  -- Asigna el usuario que realiza la actualización
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_establishment_audit
BEFORE UPDATE ON establishments
FOR EACH ROW
EXECUTE FUNCTION update_establishment_audit();

-- Índices para la tabla de Usuarios
CREATE INDEX idx_users_email ON users(email);

-- Índices para la tabla de Comerciantes
CREATE INDEX idx_merchants_status ON merchants(status);
CREATE INDEX idx_merchants_email ON merchants(email);

-- Índices para la tabla de Establecimientos
CREATE INDEX idx_establishments_merchant_id ON establishments(merchant_id);
CREATE INDEX idx_establishments_revenue ON establishments(revenue);
