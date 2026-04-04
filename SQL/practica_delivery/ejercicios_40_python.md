🟢 Bloque 1: Exploración y Selección (Nivel: Aprendiz)
Aquí aplicas la lógica de Diccionarios para llamar columnas y Métodos para ver datos.

1. Carga tu archivo delivery.db en un DataFrame llamado df_pedidos.

2. Muestra las últimas 10 filas del DataFrame (.tail(10)).

3. Imprime solo los nombres de las columnas (.columns).

4. Selecciona las columnas nombre y ciudad de la tabla usuarios.

5. Filtra todos los pedidos que tengan un monto_total mayor a 50,000.

6. Filtra los pedidos realizados únicamente en la ciudad de 'Cali'.

7. Encuentra el pedido con el tiempo_entrega_min más alto (usa .max()).

8. Cuenta cuántos pedidos hay en total en el DataFrame (len() o .count()).

9. Cambia el nombre de la columna monto_total a valor_factura (.rename()).

10. Verifica los tipos de datos: ¿cuáles son números y cuáles son texto? (.dtypes).


🟡 Bloque 2: Limpieza y Transformación (Nivel: Técnico)
Aquí usas Funciones para transformar los datos sucios en información útil.

11. Convierte la columna fecha_pedido al formato datetime de Pandas.

12. Crea una nueva columna llamada monto_con_propina que sea el monto_total + 10%.

13. Detecta si hay valores nulos en el DataFrame (.isnull().sum()).

14. Si el tiempo_entrega_min es nulo, llénalo con el promedio (.fillna()).

15. Crea una columna llamada es_rapido que sea True si el tiempo es < 30 min.

16. Extrae el día de la semana de la fecha del pedido en una nueva columna.

17. Elimina la columna fecha_registro para limpiar el espacio (.drop()).

18. Filtra pedidos que sean de 'Bogotá' Y que el monto sea mayor a 30,000.

19. Redondea todos los valores de monto_total a 0 decimales.

20. Convierte todos los nombres de los clientes a MAYÚSCULAS (.str.upper()).


🟠 Bloque 3: Agregación y Grupos (Nivel: Analista)
Aquí es donde Python hace el trabajo de un GROUP BY de SQL pero más rápido.

21. Calcula el promedio de monto_total por cada ciudad (.groupby()).

22. ¿Cuál es el restaurante que más dinero ha facturado en total?

23. Cuenta cuántos pedidos ha entregado cada repartidor.

24. Calcula el tiempo de entrega promedio por cada tipo de vehiculo.

25. Crea una tabla que muestre el monto máximo y mínimo por especialidad.

26. Ordena el DataFrame por fecha_pedido (de más reciente a antiguo).

27. Agrupa por ciudad y especialidad para ver qué se pide más.

28. Obtén el "Top 3" de clientes que más pedidos han realizado.

29. Calcula la suma acumulada (.cumsum()) de los ingresos por fecha.

30. Usa .describe() pero solo para la columna de tiempo_entrega_min.
	

🔴 Bloque 4: Análisis Avanzado (Nivel: Junior Data Scientist)
El nivel final donde usas lógica de programación pura sobre los datos.

31. Crea una función que clasifique el monto: 'Bajo', 'Medio' o 'Alto'.

32. Aplica esa función al DataFrame usando .apply().

33. Calcula la correlación entre monto y tiempo de entrega (.corr()).

34. Haz un "Resample" por semana para ver el volumen de pedidos.

35. Crea una tabla dinámica (pivot_table) de ciudades vs especialidades.

36. Filtra los pedidos que ocurrieron solo en fines de semana.

37. Encuentra el porcentaje de pedidos que tardaron más de la media general.

38. Genera un nuevo DataFrame con restaurantes de calificación > 4.5.

39. Exporta tu DataFrame final limpio a un archivo llamado reporte_final.csv.

40. Exporta el mismo resultado a un archivo de Excel (.xlsx).
