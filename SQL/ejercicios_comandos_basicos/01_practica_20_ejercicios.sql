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

SELECT producto, SUM(cantidad) AS total_cantidad FROM ventas_tech
GROUP BY producto  
HAVING total_cantidad > 15
ORDER BY total_cantidad DESC;

SELECT categoria, SUM(precio_unitario*cantidad) AS total_ingresos 
FROM ventas_tech
GROUP BY categoria
HAVING total_ingresos > 5000000
ORDER BY total_ingresos DESC;

SELECT categoria, AVG(precio_unitario) AS precio_promedio 
FROM ventas_tech
GROUP BY categoria
HAVING SUM(cantidad) > 5;

SELECT producto, COUNT(*) AS total_ventas 
FROM ventas_tech
GROUP BY producto
HAVING total_ventas > 3
ORDER BY total_ventas DESC;

SELECT fecha_venta, SUM(precio_unitario*cantidad) AS total_ingresos 
FROM ventas_tech
GROUP BY fecha_venta
ORDER BY fecha_venta DESC;

SELECT producto, SUM(cantidad) AS total_cantidad
FROM ventas_tech
WHERE categoria = 'Periféricos'
HAVING SUM(cantidad*precio_unitario) > 500000
ORDER BY SUM(cantidad*precio_unitario) DESC;

/* La consulta anterior no funciona porque no se puede usar HAVING sin GROUP BY. 
   Para corregirlo, debemos agregar GROUP BY producto antes de HAVING. */

SELECT producto, SUM(cantidad) AS total_cantidad
FROM ventas_tech
WHERE categoria = 'Periféricos'
GROUP BY producto -- ESTA ES LA PIEZA QUE FALTABA
HAVING SUM(cantidad * precio_unitario) > 500000
ORDER BY total_cantidad DESC
LIMIT 1;