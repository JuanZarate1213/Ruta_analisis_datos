SELECT * FROM ventas_tech;

SELECT producto, precio_unitario FROM ventas_tech;

SELECT * FROM ventas_tech
WHERE producto LIKE "Monitor%";

SELECT * FROM ventas_tech 
WHERE cantidad > 10;

SELECT * FROM ventas_tech 
WHERE precio_unitario BETWEEN 100000 AND 1000000;

SELECT * FROM ventas_tech 
ORDER BY precio_unitario DESC;

SELECT * FROM ventas_tech
LIMIT 5;

SELECT DISTINCT categoria FROM ventas_tech
;

SELECT COUNT(*) AS total_ventas FROM ventas_tech;

SELECT SUM(cantidad) AS total_unidades_vendidas FROM ventas_tech;

SELECT AVG(precio_unitario) AS precio_promedio FROM ventas_tech;

SELECT MIN(precio_unitario) AS precio_minimo FROM ventas_tech;

SELECT MAX(precio_unitario) AS precio_maximo FROM ventas_tech;

SELECT producto, (cantidad * precio_unitario) AS total_venta 
FROM ventas_tech
WHERE id_venta = 15;

SELECT categoria, SUM(precio_unitario*cantidad) AS total_ingresos 
FROM ventas_tech
GROUP BY categoria
ORDER BY total_ingresos DESC;

SELECT producto, SUM(cantidad) AS total_cantidad FROM ventas_tech
GROUP BY producto
ORDER BY total_cantidad DESC;