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