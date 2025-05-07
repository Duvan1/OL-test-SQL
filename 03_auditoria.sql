-- ==========================
-- FUNCIONES DE AUDITORÍA
-- ==========================
CREATE OR REPLACE FUNCTION update_merchant_audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    -- Se espera que updated_by sea seteado manualmente desde la aplicación
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_establishment_audit()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- ==========================
-- TRIGGERS DE AUDITORÍA
-- ==========================
CREATE TRIGGER trg_update_merchant_audit
BEFORE UPDATE ON merchants
FOR EACH ROW
EXECUTE FUNCTION update_merchant_audit();

CREATE TRIGGER trg_update_establishment_audit
BEFORE UPDATE ON establishments
FOR EACH ROW
EXECUTE FUNCTION update_establishment_audit();

-- ==========================
-- ÍNDICES SUGERIDOS
-- ==========================
CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);

CREATE INDEX IF NOT EXISTS idx_merchants_status ON merchants(status);
CREATE INDEX IF NOT EXISTS idx_merchants_email ON merchants(email);
CREATE INDEX IF NOT EXISTS idx_merchants_municipality_id ON merchants(municipality_id);

CREATE INDEX IF NOT EXISTS idx_establishments_merchant_id ON establishments(merchant_id);
CREATE INDEX IF NOT EXISTS idx_establishments_municipality_id ON establishments(municipality_id);
CREATE INDEX IF NOT EXISTS idx_establishments_revenue ON establishments(revenue);
