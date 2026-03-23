SELECT producto, precio_unitario FROM ventas_tech;

SELECT * FROM ventas_tech
WHERE producto LIKE "Monitor%";

SELECT * FROM ventas_tech 
WHERE cantidad > 10;

SELECT * FROM ventas_tech 
WHERE precio_unitario > 100000 AND precio_unitario < 1000000;

SELECT * FROM ventas_tech 
ORDER BY precio_unitario DESC;

SELECT * FROM ventas_tech
WHERE id_venta IN (1,2,3,4,5);

SELECT DISTINCT categoria FROM ventas_tech
;