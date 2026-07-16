-- Staging: Tabla temporal para datos brutos de sensores
CREATE TABLE IF NOT EXISTS staging_sensores (
    id_staging SERIAL PRIMARY KEY,
    id_sensor_bruto VARCHAR(100),
    temp_bruta VARCHAR(50),
    fecha_recibida TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Staging: Tabla temporal para sucursales
CREATE TABLE IF NOT EXISTS staging_locales (
    id_local_bruto VARCHAR(50),
    nombre_bruto VARCHAR(200)
);