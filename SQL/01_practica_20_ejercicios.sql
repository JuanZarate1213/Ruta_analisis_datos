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