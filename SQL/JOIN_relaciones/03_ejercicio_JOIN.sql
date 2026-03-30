
SELECT * FROM estudiantes;

SELECT * FROM inscripciones
ORDER BY fecha_inscripcion ASC;

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

SELECT id_estudiante, COUNT(*) AS total_inscripciones FROM inscripciones
GROUP BY id_estudiante
HAVING COUNT(*) > 2
ORDER BY total_inscripciones DESC;

SELECT id_curso, ROUND(AVG(calificacion), 2) AS calificacion_promedio FROM inscripciones
GROUP BY id_curso
HAVING ROUND(AVG(calificacion), 2) < 3
ORDER BY calificacion_promedio DESC;

SELECT categoria, MIN(precio) AS precio_minimo FROM cursos
GROUP BY categoria
HAVING MIN(precio) > 40
ORDER BY precio_minimo ASC;

SELECT nombre, AVG((SELECT calificacion FROM inscripciones WHERE id_estudiante = estudiantes.id_estudiante)) AS calificacion FROM estudiantes
WHERE nivel_ingles = 'B2'
GROUP BY nombre
HAVING AVG((SELECT calificacion FROM inscripciones WHERE id_estudiante = estudiantes.id_estudiante)) > 4
ORDER BY calificacion DESC;

SELECT id_curso, COUNT(*) AS total_inscripciones FROM inscripciones
WHERE id_curso IN (1,3,6)
GROUP BY id_curso
HAVING COUNT(*) > 10
ORDER BY total_inscripciones DESC;



SELECT estudiantes.nombre, cursos.nombre_curso
FROM inscripciones
JOIN estudiantes ON inscripciones.id_estudiante = estudiantes.id_estudiante
JOIN cursos ON inscripciones.id_curso = cursos.id_curso
ORDER BY estudiantes.nombre ASC;

SELECT *, cursos.nombre_curso, cursos.categoria
FROM inscripciones
JOIN cursos ON inscripciones.id_curso = cursos.id_curso;

SELECT nombre, cursos.nombre_curso FROM estudiantes
LEFT JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiante
LEFT JOIN cursos ON inscripciones.id_curso = cursos.id_curso;

SELECT nombre, cursos.nombre_curso FROM estudiantes
LEFT JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiante
LEFT JOIN cursos ON inscripciones.id_curso = cursos.id_curso
WHERE nombre_curso IS NULL;

SELECT nombre_curso, precio*COUNT(inscripciones.id_curso) AS total_inscripciones FROM cursos
JOIN inscripciones ON cursos.id_curso = inscripciones.id_curso
GROUP BY cursos.id_curso
ORDER BY total_inscripciones DESC;

SELECT nombre_curso,ROUND(AVG(inscripciones.calificacion), 2) AS calificacion_promedio  FROM cursos
JOIN inscripciones ON cursos.id_curso = inscripciones.id_curso
GROUP BY cursos.id_curso
ORDER BY calificacion_promedio DESC;

SELECT nombre, cursos.nombre_curso FROM estudiantes
JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiante
JOIN cursos ON inscripciones.id_curso = cursos.id_curso
WHERE pais = 'Colombia';

SELECT nombre, cursos.nombre_curso, inscripciones.calificacion FROM estudiantes
JOIN inscripciones ON estudiantes.id_estudiante = inscripciones.id_estudiante
JOIN cursos ON inscripciones.id_curso = cursos.id_curso;

SELECT categoria, COUNT(inscripciones.id_curso) AS maxima_inscripciones FROM cursos
JOIN inscripciones ON cursos.id_curso = inscripciones.id_curso
GROUP BY categoria
ORDER BY maxima_inscripciones DESC
LIMIT 1;

SELECT estudiantes.id_estudiante, estudiantes.nombre, SUM(cursos.precio) AS total_ingresos 
FROM inscripciones
JOIN estudiantes ON inscripciones.id_estudiante = estudiantes.id_estudiante
JOIN cursos ON inscripciones.id_curso = cursos.id_curso
GROUP BY estudiantes.id_estudiante
ORDER BY total_ingresos DESC
LIMIT 1;