DROP TABLE  if EXISTS clientes;
CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50),
    fecha_registro DATE
);

INSERT INTO clientes VALUES
(1, 'Ana Torres', 'Cali', '2023-01-15'),
(2, 'Luis Gómez', 'Bogotá', '2023-03-22'),
(3, 'María Pérez', 'Medellín', '2022-11-08'),
(4, 'Carlos Ríos', 'Cali', '2024-02-01'),
(5, 'Sofía Mora', 'Bogotá', '2023-07-19');


DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT,
    producto VARCHAR(100),
    valor NUMERIC(10,2),
    fecha_pedido DATE
);

INSERT INTO pedidos VALUES
(1, 1, 'Laptop', 2500000, '2023-02-10'),
(2, 1, 'Mouse', 85000, '2023-05-18'),
(3, 2, 'Teclado', 120000, '2023-04-01'),
(4, 3, 'Monitor', 980000, '2023-01-25'),
(5, 5, 'Laptop', 2500000, '2024-01-15'),
(6, 99, 'Audífonos', 200000, '2023-09-10');

