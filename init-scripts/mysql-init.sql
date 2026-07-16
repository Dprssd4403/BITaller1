-- MySQL: Tabla de Locales
CREATE TABLE IF NOT EXISTS locales (
    id_local VARCHAR(20) PRIMARY KEY,
    nombre_oficial VARCHAR(50)
);

-- Inventario en Góndola
CREATE TABLE IF NOT EXISTS inventario_gondola (
    id_inventario INT PRIMARY KEY AUTO_INCREMENT,
    id_local VARCHAR(20),
    producto_nombre VARCHAR(100),
    stock_actual INT,
    FOREIGN KEY (id_local) REFERENCES locales(id_local)
);

-- Movimientos Internos
CREATE TABLE IF NOT EXISTS movimientos_internos (
    id_movimiento INT PRIMARY KEY AUTO_INCREMENT,
    id_local_origen VARCHAR(20),
    tipo_traslado VARCHAR(50),
    cantidad INT,
    FOREIGN KEY (id_local_origen) REFERENCES locales(id_local)
);

-- Alertas Técnicas
CREATE TABLE IF NOT EXISTS alertas_tecnicas (
    id_alerta INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor VARCHAR(50),
    descripcion TEXT,
    fecha_alerta DATETIME
);

-- Bitácora de Caducidad
CREATE TABLE IF NOT EXISTS bitacora_caducidad (
    id_caducidad INT PRIMARY KEY AUTO_INCREMENT,
    producto VARCHAR(100),
    fecha_caducidad DATE
);

-- Recepción de Mercancía
CREATE TABLE IF NOT EXISTS recepcion_mercancia (
    id_recepcion INT PRIMARY KEY AUTO_INCREMENT,
    id_local VARCHAR(20),
    fecha_recepcion DATETIME,
    FOREIGN KEY (id_local) REFERENCES locales(id_local)
);

-- Detalle de Recepción
CREATE TABLE IF NOT EXISTS detalle_recepcion (
    id_detalle INT PRIMARY KEY AUTO_INCREMENT,
    id_recepcion INT,
    articulo VARCHAR(100),
    cantidad INT,
    FOREIGN KEY (id_recepcion) REFERENCES recepcion_mercancia(id_recepcion)
);

-- Control de Calidad
CREATE TABLE IF NOT EXISTS control_calidad_logistica (
    id_control INT PRIMARY KEY AUTO_INCREMENT,
    id_local VARCHAR(20),
    temperatura_celsius DECIMAL(5,2),
    fecha_control DATETIME,
    FOREIGN KEY (id_local) REFERENCES locales(id_local)
);