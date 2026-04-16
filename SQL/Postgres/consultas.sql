SELECT 
    c.nombre,
    p.fecha_pedido,
    p.valor,
    LAG(p.valor) OVER (PARTITION BY p.cliente_id ORDER BY p.fecha_pedido) AS pedido_anterior,
    LEAD(p.valor) OVER (PARTITION BY p.cliente_id ORDER BY p.fecha_pedido) AS pedido_siguiente
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id;

SELECT * FROM clientes;
SELECT * FROM pedidos;


SELECT nombre FROM clientes
WHERE fecha_registro = (SELECT MAX(fecha_registro) FROM clientes);

SELECT nombre FROM clientes
WHERE cliente_id IN
    (SELECT cliente_id FROM pedidos
    WHERE valor > (
        SELECT AVG(valor) FROM pedidos
    )
);

WITH promedio AS (SELECT AVG(valor) AS avg_valor FROM pedidos), clientes_sobre_promedio AS (
    (SELECT cliente_id FROM promedio, pedidos
    WHERE valor > avg_valor)
)
SELECT nombre FROM clientes
WHERE cliente_id IN (SELECT cliente_id FROM clientes_sobre_promedio);

WITH suma_clientes AS (
    SELECT cliente_id, SUM(valor) AS suma
    FROM pedidos 
    GROUP BY cliente_id), 
    promedio_cliente AS (
        SELECT AVG(suma) AS avg_s FROM suma_clientes),
    resultado AS (SELECT cliente_id FROM suma_clientes, promedio_cliente
    WHERE suma > avg_s)

SELECT nombre FROM clientes
WHERE cliente_id IN (SELECT cliente_id FROM resultado);


WITH gasto_cliente AS (
    SELECT cliente_id, SUM(valor) AS suma_cliente 
    FROM pedidos
    GROUP BY cliente_id
)
SELECT c.nombre,
    CASE 
        WHEN c.ciudad = 'Cali' THEN 'Local'
        WHEN c.ciudad IN ('Bogotá','Medellín') THEN 'Nacional'
        ELSE 'Otro'
    END AS envío,
    CURRENT_DATE - c.fecha_registro AS dias_registrado,
    COALESCE(gc.suma_cliente,0) AS total_gastado
FROM clientes c
LEFT JOIN gasto_cliente gc ON c.cliente_id = gc.cliente_id
ORDER BY total_gastado DESC;

SELECT 
    UPPER(nombre) AS mayusculas,
    LOWER(nombre) AS minusculas,
    LENGTH(nombre) AS caracteres,
    SUBSTRING(nombre, 1, 3) AS primeras_tres
FROM clientes;

SELECT 
    SUBSTRING(nombre, 1, POSITION(' ' IN nombre)-1) AS primer_nombre,
    SUBSTRING(nombre, POSITION(' ' IN nombre)+1, LENGTH(nombre)) AS apellido
    FROM clientes
;

SELECT 
    NOW(),
    CURRENT_DATE,
    EXTRACT(YEAR FROM fecha_registro),
    EXTRACT(MONTH FROM fecha_registro),
    AGE(CURRENT_DATE, fecha_registro) AS tiempo_registrado
FROM clientes;

SELECT 
    c.nombre,
    c.ciudad,
    p.valor,
    SUM(p.valor) OVER (PARTITION BY c.ciudad) AS total_por_ciudad
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id;

SELECT 
    c.nombre,
    c.ciudad,
    p.valor,
    ROW_NUMBER() OVER (PARTITION BY c.ciudad ORDER BY p.valor DESC) AS ranking
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id;


WITH mas_pedido AS (
    SELECT 
        p.pedido_id,
        p.cliente_id,
        p.valor,
        p.producto,
        c.ciudad,
        ROW_NUMBER() OVER (PARTITION BY c.ciudad ORDER BY p.valor DESC) AS ranking
    FROM pedidos p
    JOIN clientes c ON p.cliente_id = c.cliente_id
)
SELECT ciudad, pedido_id, valor, producto
FROM mas_pedido
WHERE ranking = 1;

SELECT 
    c.nombre,
    p.valor,
    ROW_NUMBER() OVER (ORDER BY p.valor DESC) AS row_number,
    RANK() OVER (ORDER BY p.valor DESC) AS rank
FROM clientes c
JOIN pedidos p ON c.cliente_id = p.cliente_id;