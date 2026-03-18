**Objetivo:** Obtener la certificación *Implementing Data Engineering
Solutions Using Microsoft Fabric (DP-700)*. **Perfil de Inicio:** Sin
experiencia previa en Data Engineering, Python básico (funciones),
disponibilidad de 1 hora diaria. **Tiempo Estimado:** 4 meses (16
semanas).

**Antes de Empezar (Semana 0):**

1.  **Crear Cuenta de Microsoft:** Usa un correo personal
    (Outlook/Hotmail).

2.  **Azure Free Account:** Ve
    a [azure.microsoft.com/es-es/free](https://azure.microsoft.com/es-es/free/) y
    crea tu cuenta gratuita. Te pedirá tarjeta de crédito para verificar
    identidad (no cobra si no te pasas, pero ojo).

3.  **Microsoft Fabric Trial:** Una vez tengas Azure, busca \"Microsoft
    Fabric\" y activa la prueba gratuita de 60 días (necesaria para la
    Fase 2).

## Fase 1: Fundamentos de Ingeniería de Datos (Semanas 1-4)

**Meta:** Entender qué es la ingeniería de datos y dominar las
herramientas básicas (SQL y Python aplicado).

### Semana 1: Conceptos Básicos y SQL Inicial

- **Lunes:** ¿Qué es Data Engineering? (ETL vs ELT, Data Lake vs Data
  Warehouse).

- **Martes:** Introducción a Bases de Datos Relacionales. Instalar SQL
  Server Express o usar simuladores online.

- **Miércoles:** SQL Básico: SELECT, FROM, WHERE.

- **Jueves:** SQL Intermedio: JOINs (Inner, Left, Right), GROUP BY.

- **Viernes:** Práctica: Resolver 5 ejercicios de SQL en sitios como
  HackerRank o LeetCode (nivel fácil).

- **Sábado/Domingo:** Repaso opcional o descanso.

### Semana 2: Python para Datos (Pandas básico)

- **Lunes:** Repaso de Python: Listas, Diccionarios y Funciones.

- **Martes:** Introducción a la librería pandas. Crear DataFrames.

- **Miércoles:** Lectura y escritura de archivos (CSV, Excel, JSON) con
  pandas.

- **Jueves:** Limpieza de datos básica con pandas (manejo de nulos,
  duplicados).

- **Viernes:** Transformaciones simples: Filtrar, ordenar y agregar
  datos.

### Semana 3: Conceptos de Nube y Big Data

- **Lunes:** ¿Qué es la nube? (Conceptos de Azure: Storage, Compute).

- **Martes:** Introducción a Apache Spark (teoría: ¿por qué es rápido?
  ¿qué es un cluster?).

- **Miércoles:** Formatos de archivos modernos: Parquet y Delta Lake
  (Crucial para Fabric).

- **Jueves:** Arquitectura Medallion (Bronze, Silver, Gold).

- **Viernes:** Quiz de repaso de conceptos teóricos.

### Semana 4: Introducción a Microsoft Fabric

- **Lunes:** Crear cuenta gratuita de Microsoft Fabric (Trial). Explorar
  la interfaz.

- **Martes:** Conceptos clave de Fabric: OneLake, Capacidades,
  Workspaces.

- **Miércoles:** ¿Qué es un Lakehouse en Fabric? Crear tu primer
  Lakehouse.

- **Jueves:** Cargar un archivo CSV manualmente al Lakehouse y verlo.

- **Viernes:** Hito Mensual: Resumen de lo aprendido.

------------------------------------------------------------------------

## Fase 2: Ingesta y Transformación en Fabric (Semanas 5-10)

**Meta:** Aprender a mover y transformar datos dentro de Fabric
(Dominios 1 y 2 del examen).

### Semana 5-6: Data Factory en Fabric (Pipelines)

- **Enfoque:** Mover datos sin código (Low-code).

- **Tareas Diarias:**

  - Crear un Pipeline de copia de datos.

  - Usar Dataflow Gen2 para limpiar datos (Power Query online).

  - Programar un pipeline para que corra automáticamente.

- **Meta Práctica:** Construir un pipeline que lea un CSV público, lo
  limpie y lo guarde en una tabla del Lakehouse.

### Semana 7-8: Ingeniería con Notebooks (Spark & Python)

- **Enfoque:** Usar tu Python para transformar datos a escala.

- **Tareas Diarias:**

  - Leer datos del Lakehouse usando Spark (spark.read\...).

  - Escribir transformaciones usando PySpark (similar a pandas pero para
    Big Data).

  - Escribir datos en formato Delta (df.write.format(\"delta\")\...).

  - Usar SQL dentro de los Notebooks (%%sql).

- **Meta Práctica:** Convertir la lógica de limpieza de la Semana 5 a un
  Notebook de PySpark.

### Semana 9-10: T-SQL y Data Warehouse

- **Enfoque:** Usar SQL para consultar y transformar.

- **Tareas Diarias:**

  - Diferencia entre SQL Analytics Endpoint y Data Warehouse en Fabric.

  - Escribir Stored Procedures en Fabric.

  - Consultar datos del Lakehouse usando T-SQL.

  - Optimización básica de consultas.

------------------------------------------------------------------------

## Fase 3: Gestión, Monitoreo y Optimización (Semanas 11-14)

**Meta:** Administrar la solución y asegurar que funcione bien (Dominio
3 del examen).

### Semana 11-12: Orquestación y Seguridad

- **Tareas:**

  - Orquestar Notebooks dentro de Pipelines.

  - Configurar seguridad a nivel de filas (RLS) y columnas.

  - Manejo de secretos y credenciales.

  - Control de versiones (Git integration en Fabric).

### Semana 13-14: Monitoreo y Optimización

- **Tareas:**

  - Usar el Monitoring Hub para ver fallos.

  - Configurar alertas.

  - Optimización de tablas Delta (V-Order, Partitioning).

  - Identificar cuellos de botella en el rendimiento.

------------------------------------------------------------------------

## Fase 4: Preparación para el Examen (Semanas 15-16)

**Meta:** Practicar para aprobar el DP-700.

Semana 15: Repaso Intensivo

- **Lunes-Miércoles:** Repasar la documentación oficial de Microsoft
  Learn para DP-700 (Módulos de aprendizaje).

- **Jueves-Viernes:** Realizar laboratorios prácticos de Microsoft Learn
  nuevamente.

### Semana 16: Simulacros

- **Lunes-Jueves:** Realizar exámenes de práctica (Practice Tests
  oficiales si hay disponibles, o cuestionarios de comunidad).

- **Viernes:** Descanso antes del examen.

- **Sábado:** ¡Día del Examen!

## Recursos Recomendados

Canales de YouTube (En Español)

- **SQL:**

  - [Soy Dalto - Curso de
    SQL](https://www.youtube.com/watch?v=DFg1V-rO6Pg): Excelente para
    empezar de cero absoluto.

  - [Hola Mundo - Aprende SQL
    ahora](https://www.youtube.com/watch?v=uOaV3tQn8jU): Muy dinámico y
    claro.

- **Python & Pandas:**

  - [Data Engineering
    Latam](https://www.youtube.com/@DataEngineeringLatam): Charlas
    técnicas y talleres de Pandas.

  - [MoureDev - Curso
    Python](https://www.youtube.com/watch?v=Kp4Mvapo5kc): Para repasar
    bases de Python si te sientes oxidado.

- **Microsoft Fabric:**

  - [Data Wizard Club](https://www.youtube.com/@DataWizardClub):
    Tutoriales paso a paso de Fabric en español.

  - [Excel Free Blog](https://www.youtube.com/@ExcelFreeBlog): Serie
    \"Aprendiendo Microsoft Fabric\".

Documentación y Práctica

1.  **Microsoft Learn:** Ruta oficial para DP-700 (Gratis).

2.  **HackerRank:** Para practicar SQL y Python (Ejercicios cortos).

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

# Notas

## SQL TUTORIAL

#### *SELECT *- extracts data from a database

> SELECT \* FROM Customers; #(\*) todas las columnas
>
> SELECT CustomerName, City FROM Customers;
>
> SELECT *column1*,* column2, \...*\
> FROM *table_name*;

#### SQL Select Distinct

> SELECT DISTINCT Country FROM Customers;
>
> DISTINCT para devolver valores evitando duplicados
>
> SELECT COUNT(DISTINCT Ciudad)
>
> FROM customers;

#### SQL Where: filtro de las columnas

> SELECT \* FROM Customers\
> WHERE Country="Mexico";
>
> Syntaxis:
>
> SELECT *column1*,* column2, \...*\
> FROM *table_name*\
> WHERE *condition*;
>
> **IN**: Sirve para no llenar el condicional de OR a la hora de filtrar

#### SQL Order By: organiza lo que sea que devuelva, en orden ascendente o descendente

> SELECT *column1*,* column2, \...*\
> FROM *table_name*\
> ORDER BY *column1, column2, \... *ASC\|DESC

#### SQL Insert Into

INSERT INTO nombre_tabla (columna1, columna2, columna3, \...)

> VALUES (valor1, valor2, valor3, \...);
>
> EJ
>
> INSERT INTO customers (Nombre, Email, Ciudad)
>
> VALUES (\'Roberto Torres\', \'roberto@ejemplo.com\', \'Sevilla\');
>
> Usualmente usado así:
>
> INSERT INTO customers (Nombre, Ciudad)
>
> VALUES
>
> (\'Elena Ruiz\', \'Málaga\'),
>
> (\'Paco Díaz\', \'Bilbao\'),
>
> (\'Sofía Lara\', \'Zaragoza\');
>
> Copiar datos de una base de datos a otra\
> INSERT INTO tabla_destino (columna1, columna2, \...)
>
> SELECT columnaA, columnaB, \...
>
> FROM tabla_origen
>
> \[WHERE condicion_filtro\];

#### SQL Update

> UPDATE *table_name*\
> SET *column1 *=* value1*,* column2 *=* value2*, \...\
> WHERE *condition*;
>
> *EJ*
>
> UPDATE Customers\
> SET ContactName = \'Alfred Schmidt\', City= \'Frankfurt\'\
> WHERE CustomerID = 1;
>
> IMPORTANTE: Si se omite el Where, se van a actualizar todos los campos
> debido a que no tiene un filtro para saber cuales valores se van a
> reemplazar y cuales no

#### SQL Delete Elimina la fila 

DELETE FROM *table_name *

> WHERE *condition*;
>
> IMPORTANTE: Si se omite el Where, se van a actualizar todos los campos
> debido a que no tiene un filtro para saber cuáles valores se van a
> eliminar y cuales no
>
> Si se deja solo el DELETE FROM table_name, se borra todo dentro de la
> tabla, pero la tabla no
>
> Si se quiere **ELIMINAR TODA LA TABLA** se usa la sentencia **DROP
> TABLE** table_name

#### SQL Select Top

#### SQL Min and Max

> Se usa MIN o Max como de costumbre, pero este devuelve una columna sin
> nombre, para guardarla con un nombre se usa **AS**
>
> SELECT MIN(Column_name) AS SmallestPrice\
> FROM Products;

#### SQL Count

Cuenta todas las filas de la tabla

> SELECT COUNT(\*)\
> FROM Products;
>
> Syntaxis
>
> SELECT COUNT(*column_name*)\
> FROM *table_name*\
> WHERE *condition*;
>
> Example
>
> SELECT COUNT(\*) AS \[Number of records\], CategoryID\
> FROM Products\
> GROUP BY CategoryID;

#### SQL Sum

Se usa para sumar valores de una tabla

#### SQL limit

> \-- Obtiene las 3 primeras filas de la tabla \"users\"
>
> SELECT \* FROM users LIMIT 3;
>
> \-- Obtiene las 2 primeras filas de la tabla \"users\" con email
> distinto a sara@gmail.com o edad igual a 15
>
> SELECT \* FROM users WHERE NOT email = \'sara@gmail.com\' OR age = 15
> LIMIT 2;

#### SQL Avg

Encontrar promedios de un conjunto de datos

#### SQL Like

> \-- Obtiene todos datos de la tabla \"users\" que contienen un email
> con el texto \"gmail.com\" en su parte final
>
> SELECT \* FROM users WHERE email LIKE \'%gmail.com\';
>
> \-- Obtiene todos datos de la tabla \"users\" que contienen un email
> con el texto \"sara\" en su parte inicial
>
> SELECT \* FROM users WHERE email LIKE \'sara%\';
>
> \-- Obtiene todos datos de la tabla \"users\" que contienen un email
> una arroba
>
> SELECT \* FROM users WHERE email LIKE \'%@%\';

#### SQL Wildcards

#### SQL In

#### SQL Between

> \-- Ordena todos los datos de la tabla \"users\" con edad comprendida
> entre 20 y 30
>
> SELECT \* FROM users WHERE age BETWEEN 20 AND 30

#### SQL Alias

> \-- Establece el alias \'Fecha de inicio en programación\' a la
> columna init_date
>
> SELECT name, init_date AS \'Fecha de inicio en programación\' FROM
> users WHERE name = \'Brais\'
>
> \-- Consulta igual que la anterior. Representa la posibilidad de usar
> comillas dobles para cadenas
>
> SELECT name, init_date AS \"Fecha de inicio en programación\" FROM
> users WHERE name = \"Brais\"
>
> \-- Concatena en una sola columa los campos nombre y apellido
>
> SELECT CONCAT(\'Nombre: \', name, \', Apellidos: \', surname) FROM
> users
>
> \-- Concatena en una sola columa los campos nombre y apellido y le
> establece el alias \'Nombre completo\'
>
> SELECT CONCAT(\'Nombre: \', name, \', Apellidos: \', surname) AS
> \'Nombre completo\' FROM users

#### SQL Joins

#### SQL Inner Join

#### SQL Left Join

#### SQL Right Join

#### SQL Full Join

#### SQL Self Join

#### SQL Union

#### SQL Union All

#### SQL Group By

> \-- Agrupa los resultados por edad diferente
>
> SELECT MAX(age) FROM users GROUP BY age
>
> \-- Agrupa los resultados por edad diferente y cuenta cuantos
> registros existen de cada una
>
> SELECT COUNT(age), age FROM users GROUP BY age
>
> \-- Agrupa los resultados por edad diferente, cuenta cuantos registros
> existen de cada una y los ordena
>
> SELECT COUNT(age), age FROM users GROUP BY age ORDER BY age ASC
>
> \-- Agrupa los resultados por edad diferente mayor de 15, cuenta
> cuantos registros existen de cada una y los ordena
>
> SELECT COUNT(age), age FROM users WHERE age \> 15 GROUP BY age ORDER
> BY age ASC

#### SQL Having

#### SQL Exists

#### SQL Any, All

#### SQL Select Into

#### SQL Insert Into Select

#### SQL Case

> \-- Obtiene todos los datos de la tabla \"users\" y establece
> condiciones de visualización de cadenas de texto según el valor de la
> edad
>
> SELECT \*,
>
> CASE
>
> WHEN age \> 18 THEN \'Es mayor de edad\'
>
> WHEN age = 18 THEN \'Acaba de cumplir la mayoría de edad\'
>
> ELSE \'Es menor de edad\'
>
> END AS \'¿Es mayor de edad?\'
>
> FROM users;
>
> \-- Obtiene todos los datos de la tabla \"users\" y establece
> condiciones de visualización de valores booleanos según el valor de la
> edad
>
> SELECT \*,
>
> CASE
>
> WHEN age \> 17 THEN True
>
> ELSE False
>
> END AS \'¿Es mayor de edad?\'
>
> FROM users;

#### SQL Null Functions

#### SQL Stored Procedures

#### SQL Comments

#### SQL Operators

## SQL Database

##### SQL Create DB

##### SQL Drop DB

##### SQL Backup DB

##### SQL Create Table

##### SQL Drop Table

##### SQL Alter Table

##### SQL Constraints

##### SQL Not Null

##### SQL Unique

##### SQL Primary Key

##### SQL Foreign Key

##### SQL Check

##### SQL Default

##### SQL Index

##### SQL Auto Increment

##### SQL Dates

##### SQL Views

##### SQL Injection

##### SQL Hosting

##### SQL Data Types

## SQL References

#### SQL Keywords

#### MySQL Functions

#### SQL Server Functions

#### MS Access Functions

#### SQL Quick Ref

## SQL Examples

#### SQL Examples

#### SQL Editor

#### SQL Quiz

#### SQL Exercises

#### SQL Server

#### SQL Syllabus

#### SQL Study Plan

#### SQL Bootcamp

#### SQL Certificate

#### SQL Training
