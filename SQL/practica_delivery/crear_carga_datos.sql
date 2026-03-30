
PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS repartidores;
DROP TABLE IF EXISTS restaurantes;
DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    ciudad TEXT NOT NULL,
    fecha_registro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE restaurantes (
    id_restaurante INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    especialidad TEXT CHECK(especialidad IN ('Pizza', 'Sushi', 'Hamburguesas', 'Ensaladas', 'Mexicana')),
    calificacion_promedio REAL
);

CREATE TABLE repartidores (
    id_repartidor INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    vehiculo TEXT CHECK(vehiculo IN ('Moto', 'Bici', 'Carro')),
    estado_activo INTEGER DEFAULT 1 
);

CREATE TABLE pedidos (
    id_pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    id_usuario INTEGER NOT NULL,
    id_restaurante INTEGER NOT NULL,
    id_repartidor INTEGER,
    monto_total REAL NOT NULL,
    tiempo_entrega_min INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_restaurante) REFERENCES restaurantes(id_restaurante),
    FOREIGN KEY (id_repartidor) REFERENCES repartidores(id_repartidor)
);


INSERT INTO usuarios (nombre, ciudad) VALUES 
('Juan H.', 'Cali'), ('Maria L.', 'Bogotá'), ('Carlos R.', 'Medellín'), ('Ana G.', 'Cali'), ('Luis P.', 'Bogotá'),
('Sofia C.', 'Medellín'), ('Andres F.', 'Cali'), ('Paola J.', 'Barranquilla'), ('Nairo Q.', 'Tunja'), ('Shakira M.', 'Barranquilla');

INSERT INTO restaurantes (nombre, especialidad, calificacion_promedio) VALUES 
('Pizza Nostra', 'Pizza', 4.5), ('Sushi Master', 'Sushi', 4.8), ('Burger King', 'Hamburguesas', 4.2),
('Tacos Wey', 'Mexicana', 4.6), ('Salad Bar', 'Ensaladas', 3.9), ('Pizza Hut', 'Pizza', 4.0);

INSERT INTO repartidores (nombre, vehiculo, estado_activo) VALUES 
('Pedro Perez', 'Moto', 1), ('Luis Diaz', 'Bici', 1), ('James R.', 'Moto', 1), ('Falcao G.', 'Carro', 0);


INSERT INTO pedidos (id_usuario, id_restaurante, id_repartidor, monto_total, tiempo_entrega_min, fecha_pedido) VALUES 
(1, 1, 1, 45000, 35, '2026-03-01'), (2, 2, 2, 85000, 75, '2026-03-01'), (3, 3, 1, 22000, 20, '2026-03-02'),
(4, 4, 3, 12000, 65, '2026-03-02'), (5, 5, 2, 55000, 45, '2026-03-03'), (6, 1, 1, 15000, 90, '2026-03-03'),
(7, 2, 3, 95000, 40, '2026-03-04'), (8, 6, 2, 32000, 55, '2026-03-04'), (9, 3, 1, 60000, 25, '2026-03-05'),
(10, 4, 3, 44000, 80, '2026-03-05'), (1, 2, 1, 110000, 30, '2026-03-06'), (2, 3, 2, 18000, 15, '2026-03-06'),
(1, 1, 1, 35000, 45, '2026-03-07'), (2, 4, 2, 12000, 85, '2026-03-07'), (3, 2, 3, 95000, 30, '2026-03-07'),
(4, 5, 1, 28000, 25, '2026-03-08'), (5, 6, 2, 42000, 50, '2026-03-08'), (6, 3, 3, 65000, 40, '2026-03-08'),
(7, 1, 1, 15000, 15, '2026-03-09'), (8, 4, 2, 22000, 95, '2026-03-09'), (9, 2, 3, 130000, 55, '2026-03-09'),
(10, 5, 1, 18000, 20, '2026-03-10'), (1, 6, 2, 39000, 60, '2026-03-10'), (2, 3, 3, 55000, 35, '2026-03-10'),
(3, 1, 1, 48000, 42, '2026-03-11'), (4, 4, 2, 19000, 80, '2026-03-11'), (5, 2, 3, 115000, 25, '2026-03-11'),
(6, 5, 1, 24000, 30, '2026-03-12'), (7, 6, 2, 36000, 55, '2026-03-12'), (8, 3, 3, 72000, 45, '2026-03-12'),
(9, 1, 1, 21000, 20, '2026-03-13'), (10, 4, 2, 14000, 110, '2026-03-13'), (1, 2, 3, 145000, 50, '2026-03-13'),
(2, 5, 1, 31000, 25, '2026-03-14'), (3, 6, 2, 44000, 65, '2026-03-14'), (4, 3, 3, 58000, 30, '2026-03-14'),
(5, 1, 1, 52000, 40, '2026-03-15'), (6, 4, 2, 23000, 90, '2026-03-15'), (7, 2, 3, 125000, 28, '2026-03-15'),
(8, 5, 1, 19000, 18, '2026-03-16'), (9, 6, 2, 33000, 70, '2026-03-16'), (10, 3, 3, 61000, 35, '2026-03-16'),
(1, 1, 1, 46000, 38, '2026-03-17'), (2, 4, 2, 17000, 100, '2026-03-17'), (3, 2, 3, 98000, 32, '2026-03-17'),
(4, 5, 1, 26000, 22, '2026-03-18'), (5, 6, 2, 41000, 55, '2026-03-18'), (6, 3, 3, 68000, 42, '2026-03-18'),
(7, 1, 1, 16000, 12, '2026-03-19'), (8, 4, 2, 25000, 115, '2026-03-19'), (9, 2, 3, 135000, 60, '2026-03-19'),
(10, 5, 1, 20000, 25, '2026-03-20'), (1, 6, 2, 37000, 65, '2026-03-20'), (2, 3, 3, 59000, 38, '2026-03-20'),
(3, 1, 1, 49000, 45, '2026-03-21'), (4, 4, 2, 20000, 105, '2026-03-21'), (5, 2, 3, 118000, 27, '2026-03-21'),
(6, 5, 1, 25000, 32, '2026-03-22'), (7, 6, 2, 38000, 58, '2026-03-22'), (8, 3, 3, 74000, 48, '2026-03-22'),
(9, 1, 1, 22000, 22, '2026-03-23'), (10, 4, 2, 15000, 120, '2026-03-23'), (1, 2, 3, 148000, 52, '2026-03-23'),
(2, 5, 1, 32000, 28, '2026-03-24'), (3, 6, 2, 45000, 68, '2026-03-24'), (4, 3, 3, 60000, 32, '2026-03-24'),
(5, 1, 1, 54000, 42, '2026-03-25'), (6, 4, 2, 24000, 95, '2026-03-25'), (7, 2, 3, 128000, 30, '2026-03-25'),
(8, 5, 1, 21000, 20, '2026-03-26'), (9, 6, 2, 35000, 75, '2026-03-26'), (10, 3, 3, 63000, 37, '2026-03-26'),
(1, 1, 1, 47000, 40, '2026-03-27'), (2, 4, 2, 18000, 105, '2026-03-27'), (3, 2, 3, 100000, 35, '2026-03-27'),
(4, 5, 1, 27000, 24, '2026-03-28'), (5, 6, 2, 43000, 58, '2026-03-28'), (6, 3, 3, 70000, 44, '2026-03-28'),
(7, 1, 1, 17000, 14, '2026-03-29'), (8, 4, 2, 27000, 118, '2026-03-29'), (9, 2, 3, 140000, 62, '2026-03-29'),
(10, 5, 1, 22000, 27, '2026-03-30'), (1, 6, 2, 40000, 68, '2026-03-30'), (2, 3, 3, 62000, 40, '2026-03-30'),
(3, 1, 1, 51000, 47, '2026-03-31'), (4, 4, 2, 22000, 108, '2026-03-31'), (5, 2, 3, 122000, 29, '2026-03-31'),
(6, 5, 1, 27000, 34, '2026-03-31'), (7, 6, 2, 40000, 60, '2026-03-31'), (8, 3, 3, 76000, 50, '2026-03-31');