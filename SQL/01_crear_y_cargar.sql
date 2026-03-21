


SELECT * FROM ventas;

SELECT 
    producto, 
    SUM(cantidad) AS total_unidades,
    SUM(cantidad * precio_unitario) AS ingresos_totales
FROM ventas
WHERE precio_unitario > 100000  -- Paso 1: Filtra productos caros
GROUP BY producto               -- Paso 2: Agrupa por nombre
HAVING total_unidades > 3       -- Paso 3: Filtra los grupos que vendieron poco
ORDER BY ingresos_totales DESC; -- Paso 4: Ordena por plata

SELECT 
    producto,
    SUM(cantidad) AS unidades_vendidas,
    ROUND(AVG(precio_unitario), 2) AS precio_promedio,
    SUM(precio_unitario * cantidad) AS ingresos_totales
FROM ventas
GROUP BY producto
ORDER BY ingresos_totales DESC;

