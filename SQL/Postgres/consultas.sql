SELECT * FROM clientes;

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
    SUM(p.valor) AS total_gastado 
FROM clientes AS c
INNER JOIN pedidos AS p ON c.cliente_id = p.cliente_id
GROUP BY nombre
ORDER BY total_gastado DESC;    

