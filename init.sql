-- Crear la base de datos si no existe
-- (Esta línea se ejecuta automáticamente por las variables de entorno de Docker)

-- Conectar a la base de datos
\c mydatabase;

-- Crear tabla empleados si no existe
CREATE TABLE IF NOT EXISTS empleados (
    id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono VARCHAR(20),
    cargo VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Insertar datos de ejemplo
INSERT INTO empleados (nombre, apellido, email, telefono, cargo, salario) VALUES
('Juan', 'Pérez', 'juan.perez@ejemplo.com', '987654321', 'Desarrollador Senior', 5500.00),
('María', 'González', 'maria.gonzalez@ejemplo.com', '987654322', 'Analista de Datos', 4500.00),
('Carlos', 'Rodríguez', 'carlos.rodriguez@ejemplo.com', '987654323', 'Gerente de Proyectos', 6500.00),
('Ana', 'Martínez', 'ana.martinez@ejemplo.com', '987654324', 'Diseñadora UX/UI', 4000.00),
('Luis', 'Sánchez', 'luis.sanchez@ejemplo.com', '987654325', 'Desarrollador Full Stack', 5000.00)
ON CONFLICT (email) DO NOTHING;

-- Crear índices para mejorar el rendimiento
CREATE INDEX IF NOT EXISTS idx_empleados_nombre ON empleados(nombre);
CREATE INDEX IF NOT EXISTS idx_empleados_apellido ON empleados(apellido);
CREATE INDEX IF NOT EXISTS idx_empleados_email ON empleados(email);

-- Mensaje de confirmación
SELECT 'Base de datos inicializada correctamente' AS mensaje;
SELECT COUNT(*) AS total_empleados FROM empleados;

