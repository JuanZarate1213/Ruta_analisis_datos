-- Crear una tabla temporal de ventas
CREATE TABLE ventas_tecnologia (
    id INTEGER PRIMARY KEY,
    producto TEXT,
    precio REAL,
    cantidad INTEGER
);

-- Insertar datos de prueba
INSERT INTO ventas_tecnologia (producto, precio, cantidad) VALUES 
('Laptop Dell', 2500000, 2),
('Monitor 24"', 600000, 5),
('Teclado Mecánico', 150000, 10),
('Mouse Inalámbrico', 80000, 15);

-- RETO: ¿Cómo calcularías el total vendido por cada producto?
-- Escribe abajo la consulta (Query) para obtener el 'Subtotal' 
SELECT producto, precio, cantidad, (precio * cantidad) AS Subtotal
FROM ventas_tecnologia;


