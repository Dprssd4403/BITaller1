-- PostgreSQL: Zonas Geográficas
CREATE TABLE IF NOT EXISTS zonas_geograficas (
    id_zona SERIAL PRIMARY KEY,
    nombre_zona VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

-- Categorías de Frescura
CREATE TABLE IF NOT EXISTS categorias_frescura (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    rango_dias_vida_util INT
);

-- Proveedores Maestros
CREATE TABLE IF NOT EXISTS proveedores_maestros (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_proveedor VARCHAR(150) NOT NULL,
    email_contacto VARCHAR(100),
    id_zona INT REFERENCES zonas_geograficas(id_zona)
);

-- Locales Físicos Maestros
CREATE TABLE IF NOT EXISTS locales_fisicos_maestros (
    id_local_maestro SERIAL PRIMARY KEY,
    codigo_sucursal VARCHAR(20) UNIQUE NOT NULL,
    nombre_sucursal VARCHAR(100),
    id_zona INT REFERENCES zonas_geograficas(id_zona)
);

-- Metas de Reducción de Merma
CREATE TABLE IF NOT EXISTS metas_reduccion_merma (
    id_meta SERIAL PRIMARY KEY,
    id_local_maestro INT REFERENCES locales_fisicos_maestros(id_local_maestro),
    mes_año DATE,
    meta_porcentaje DECIMAL(5,2)
);

-- Evaluaciones de Proveedores
CREATE TABLE IF NOT EXISTS evaluaciones_proveedores (
    id_evaluacion SERIAL PRIMARY KEY,
    id_proveedor INT REFERENCES proveedores_maestros(id_proveedor),
    puntaje INT,
    fecha_evaluacion DATE DEFAULT CURRENT_DATE
);