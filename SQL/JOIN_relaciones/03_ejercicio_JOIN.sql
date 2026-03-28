SELECT * FROM cursos;

SELECT * FROM estudiantes 
WHERE pais = 'Colombia';

SELECT * FROM cursos 
WHERE categoria = 'Data' AND precio > 100;

SELECT * FROM estudiantes 
WHERE nombre LIKE 'A%';

SELECT nombre_curso, precio AS costo_usd FROM cursos;

SELECT * FROM inscripciones 
WHERE calificacion = 5.0;

SELECT * FROM cursos
WHERE duracion_horas BETWEEN 20 AND 50;

SELECT * FROM estudiantes
WHERE NOT pais IN ('Colombia', 'Mexico');

SELECT * FROM cursos
WHERE nombre_curso LIKE '%Python%';

SELECT * FROM inscripciones
ORDER BY fecha_inscripcion DESC
LIMIT 10;

SELECT DISTINCT nivel_ingles FROM estudiantes
ORDER BY nivel_ingles ASC;

SELECT COUNT(*) AS total_estudiantes FROM estudiantes;

SELECT AVG(precio) AS precio_promedio FROM cursos;

SELECT SUM(precio) AS ingresos_totales FROM cursos
WHERE id_curso IN (SELECT id_curso FROM inscripciones);

SELECT MIN(calificacion) AS calificacion_minima FROM inscripciones;

SELECT pais, COUNT(*) AS total_estudiantes FROM estudiantes
GROUP BY pais;

SELECT categoria, MAX(precio) AS precio_maximo FROM cursos
GROUP BY categoria;

SELECT id_curso, ROUND(AVG(calificacion), 2) AS calificacion_promedio FROM inscripciones
WHERE id_curso = 1;

SELECT COUNT(*) AS total_inscripciones, id_curso FROM inscripciones
GROUP BY id_curso;

SELECT categoria, SUM(duracion_horas) AS horas_totales FROM cursos
WHERE categoria = 'Idiomas'
GROUP BY categoria;

SELECT id_estudiante, ROUND(AVG(calificacion), 2) AS calificacion_promedio FROM inscripciones
GROUP BY id_estudiante;


SELECT pais, COUNT(pais) AS total_paises FROM estudiantes
GROUP BY pais
HAVING COUNT(pais) > 5
ORDER BY total_paises DESC;

SELECT categoria, AVG(precio) AS precio_promedio FROM cursos
GROUP BY categoria
HAVING AVG(precio) > 130
ORDER BY precio_promedio DESC;

SELECT estudiantes, COUNT(inscripciones) AS total_inscripciones FROM estudiantes
GROUP BY estudiantes
HAVING COUNT(inscripciones) > 2
ORDER BY total_inscripciones DESC;