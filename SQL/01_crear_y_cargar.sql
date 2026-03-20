
DROP TABLE IF EXISTS ventas;

CREATE TABLE ventas (
    id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    producto TEXT,
    categoria TEXT,
    precio_unitario REAL,
    cantidad INTEGER,
    fecha_venta DATE
);

INSERT INTO ventas (producto, categoria, precio_unitario, cantidad, fecha_venta) VALUES 
('Laptop Pro', 'Hardware', 4500000, 2, '2026-03-15'),
('Mouse Inalámbrico', 'Accesorios', 120000, 10, '2026-03-16'),
('Monitor 4K', 'Hardware', 1800000, 4, '2026-03-17'),
('Teclado Mecánico', 'Accesorios', 350000, 5, '2026-03-18'),
('Soporte Laptop', 'Accesorios', 85000, 15, '2026-03-19'),
('Laptop Pro', 'Hardware', 4500000, 1, '2026-03-20');

SELECT 
    categoria, 
    SUM(precio_unitario * cantidad) AS total_ventas,
    COUNT(id_venta) AS numero_operaciones
FROM ventas
GROUP BY categoria
ORDER BY total_ventas DESC;