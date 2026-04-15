
SELECT * FROM clientes;
SELECT * FROM pedidos;

SELECT * FROM clientes
WHERE ciudad = 'Cali'
ORDER BY fecha_registro DESC;

SELECT nombre, fecha_registro FROM clientes
WHERE EXTRACT(YEAR FROM fecha_registro) = 2023;

SELECT ciudad,COUNT(*) AS Nro_clientes FROM clientes
GROUP BY ciudad;

SELECT ciudad, COUNT(*) AS nro_clientes FROM clientes
GROUP BY ciudad
HAVING COUNT(*) > 1;

SELECT nombre FROM clientes
WHERE fecha_registro = (SELECT MAX(fecha_registro) FROM clientes);

SELECT * FROM clientes
INNER JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

SELECT nombre, producto FROM clientes
LEFT JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

SELECT * FROM clientes
FULL JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;

SELECT 
    c.nombre, 
    SUM(p.valor) AS total_gastado 
FROM clientes AS c
INNER JOIN pedidos AS p ON c.cliente_id = p.cliente_id
GROUP BY nombre
ORDER BY total_gastado DESC;

SELECT 
    c.nombre, 
    SUM(p.valor) AS total_gastado 
FROM clientes AS c
INNER JOIN pedidos AS p ON c.cliente_id = p.cliente_id
GROUP BY nombre
ORDER BY total_gastado DESC;

SELECT 
    c.nombre, 
    COALESCE(SUM(p.valor),0) AS total_gastado 
FROM clientes AS c
LEFT JOIN pedidos AS p ON c.cliente_id = p.cliente_id
GROUP BY nombre
ORDER BY total_gastado DESC;  

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

SELECT nombre,
    CASE 
        WHEN ciudad = 'Cali' THEN 'Local'
        WHEN ciudad = 'Bogotá' OR ciudad = 'Medellín' THEN 'Nacional'
        ELSE 'Otro'
    END AS envío
FROM clientes;



WITH gasto_cliente AS (
    SELECT cliente_id, SUM(valor) AS suma_cliente FROM pedidos
    GROUP BY cliente_id)

SELECT suma_cliente, nombre,
    CASE 
        WHEN ciudad = 'Cali' THEN 'Local'
        WHEN ciudad = 'Bogotá' OR ciudad = 'Medellín' THEN 'Nacional'
        ELSE 'Otro'
    END AS envío
FROM clientes
JOIN 
ORDER BY suma_cliente;


