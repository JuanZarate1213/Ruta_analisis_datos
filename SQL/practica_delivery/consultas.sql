SELECT * from pedidos;

SELECT * from repartidores;

SELECT * from restaurantes;

SELECT * from usuarios;


SELECT nombre, vehiculo, ROUND(AVG(p.tiempo_entrega_min), 2) AS promedio_tiempo FROM repartidores AS r
JOIN pedidos AS p ON r.id_repartidor = p.id_repartidor
WHERE r.estado_activo = 1
GROUP BY r.id_repartidor
ORDER BY promedio_tiempo ASC;

SELECT nombre, SUM(p.monto_total) AS total_gastado FROM usuarios AS u
JOIN pedidos AS p ON u.id_usuario = p.id_usuario
GROUP BY u.id_usuario
HAVING total_gastado > 200000
ORDER BY total_gastado DESC;

SELECT 
    especialidad, 
    SUM(p.monto_total) AS total_ventas 
FROM restaurantes AS r
JOIN pedidos AS p ON r.id_restaurante = p.id_restaurante
GROUP BY r.id_restaurante
ORDER BY total_ventas DESC
LIMIT 1;

SELECT 
    u.nombre AS nombre_usuario, 
    rep.nombre AS nombre_repartidor, 
    res.nombre AS nombre_restaurante, 
    p.tiempo_entrega_min 
FROM usuarios AS u
JOIN pedidos AS p ON u.id_usuario = p.id_usuario
JOIN repartidores AS rep ON p.id_repartidor = rep.id_repartidor
JOIN restaurantes AS res ON p.id_restaurante = res.id_restaurante
WHERE p.tiempo_entrega_min > 60
ORDER BY p.tiempo_entrega_min DESC;

SELECT nombre, p.id_pedido FROM usuarios AS u
LEFT JOIN pedidos AS p ON u.id_usuario = p.id_usuario
WHERE p.id_pedido IS NULL;

