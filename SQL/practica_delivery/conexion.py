import sqlite3
import pandas as pd

# Cambia la ruta por el formato correcto de Windows
conn = sqlite3.connect(r'C:\Users\Juan Hincapie\Desktop\Universidad\Estudios_autodidactas\Ruta_analisis_datos\SQL\practica_delivery\delivery.db')
query1 = """SELECT 
                u.ciudad AS ciudad_u,
                u.nombre AS nombre_u,
                *
                  FROM pedidos AS p
            JOIN usuarios AS u ON p.id_usuario = u.id_usuario;"""
df_p = pd.read_sql_query(query1, conn) #1
df_only_p = pd.read_sql_query("""SELECT * FROM pedidos;""", conn)
df_u= pd.read_sql_query("""SELECT * FROM usuarios;""", conn) 
df_res = pd.read_sql_query("""SELECT nombre AS nombre_r,* FROM restaurantes AS r;""", conn)
df_rep= pd.read_sql_query("""SELECT nombre AS nombre_rep,* FROM repartidores AS rep;""", conn)


###BLOQUE 1###
print(df_p.tail(10)) #2. Muestra las últimas 10 filas del DataFrame (.tail(10)).
print(df_p.columns.tolist()) #3. Imprime solo los nombres de las columnas (.columns).
print(df_u[['nombre_u', 'ciudad_u']]) #4. Selecciona las columnas nombre y ciudad de la tabla usuarios.
print(df_p[df_p['monto_total'] > 50000]) #5. Filtra todos los pedidos que tengan un monto_total mayor a 50,000.
print(df_p[df_p['ciudad_u'] == 'Cali']) #6. Filtra los pedidos realizados únicamente en la ciudad de 'Cali'.
print(df_p['tiempo_entrega_min'].max()) #7. Encuentra el pedido con el tiempo_entrega_min más alto (usa .max()).
print(len(df_p))
print(df_p['tiempo_entrega_min'].count()) #8. Cuenta cuántos pedidos hay en total en el DataFrame (len() o .count()).
df_p = df_p.rename(columns={'monto_total': 'valor_factura'}) #9. Cambia el nombre de la columna monto_total a valor_factura (.rename()).
print(df_p.dtypes) #10. Verifica los tipos de datos: ¿cuáles son números y cuáles son texto? (.dtypes).

###BLOQUE 2###
df_p['fecha_pedido'] = pd.to_datetime(df_p['fecha_pedido'], errors='coerce') #11. Convierte la columna fecha_pedido al formato datetime de Pandas.
df_p['monto_con_propina'] = df_p['monto_total'] * 1.10 #12. Crea una nueva columna llamada monto_con_propina que sea el monto_total + 10%.
df_p.isnull().sum() #13. Detecta si hay valores nulos en el DataFrame (.isnull().sum()).
df_p = df_p.fillna(df_p['tiempo_entrega_min'].mean()) #14. Si el tiempo_entrega_min es nulo, llénalo con el promedio (.fillna()).
df_p['es_rapido'] = df_p['tiempo_entrega_min'] < 30 #15. Crea una columna llamada es_rapido que sea True si el tiempo es < 30 min.
df_p['dia_semana'] = df_p['fecha_pedido'].dt.day_name() #16. Extrae el día de la semana de la fecha del pedido en una nueva columna.
df_u.drop(columns=['fecha_registro'], inplace=True) #17. Elimina la columna fecha_registro para limpiar el espacio (.drop()).
df_p[(df_u['ciudad_u'] == 'Bogotá') & (df_p['monto_total'] > 30000)] #18. Filtra pedidos que sean de 'Bogotá' Y que el monto sea mayor a 30,000.
print(df_p['monto_total'].round(0)) #19. Redondea todos los valores de monto_total a 0 decimales.
df_u['nombre_u'].str.upper() #20. Convierte todos los nombres de los clientes a MAYÚSCULAS (.str.upper()).



"""
###BLOQUE 3###
df_pedidos_usuarios = pd.merge(df_p, df_u, on='id_usuario')
print(df_pedidos_usuarios.groupby('ciudad_u')['monto_total'].mean().round(2)) #21. Calcula el promedio de monto_total por cada ciudad (.groupby()).

df_union = pd.merge(df_p, df_res, on='id_restaurante')
print(top_ventas = df_union.groupby('nombre_r')['monto_total'].sum().sort_values(ascending=False).head(1)) #22. ¿Cuál es el restaurante que más dinero ha facturado en total?

df_pedidos_x_repartidor= pd.merge(df_p, df_rep , on='id_repartidor')
print(df_pedidos_x_repartidor.groupby('nombre_rep').size().sort_values(ascending=False)) #23. Cuenta cuántos pedidos ha entregado cada repartidor.

df_pedidos_x_repartidor= pd.merge(df_p, df_rep , on='id_repartidor')
print(df_pedidos_x_repartidor.groupby('vehiculo')['tiempo_entrega_min'].mean().round(2).sort_values(ascending=False)) #24. Calcula el tiempo de entrega promedio por cada tipo de vehiculo.

df_monto_x_res= pd.merge(df_p, df_res , on='id_restaurante')
print(df_monto_x_res.groupby('especialidad')['monto_total'].agg(['max','min'])) #25. Crea una tabla que muestre el monto máximo y mínimo por especialidad.

df_p['fecha_pedido'] = pd.to_datetime(df_p['fecha_pedido'], errors='coerce')
print(df_p.sort_values(by='fecha_pedido', ascending=False).head(10)) #26. Ordena el DataFrame por fecha_pedido (de más reciente a antiguo).

df_top_especialidad_ciudad= pd.merge(df_p, df_res , on='id_restaurante')
print(df_top_especialidad_ciudad.groupby(['ciudad_u','especialidad'])['monto_total'].size().sort_values(ascending=False)) #27. Agrupa por ciudad y especialidad para ver qué se pide más.

df_usuarios_top= pd.merge(df_only_p, df_u, on='id_usuario')
print(df_usuarios_top.groupby(['id_usuario', 'nombre'])['monto_total'].size().sort_values(ascending=False).head(3)) #28. Obtén el "Top 3" de clientes que más pedidos han realizado. 
#siempre se agrupa por id_usuario para evitar confusiones con nombres repetidos, pero se muestra el nombre para mayor claridad.

df_only_p['fecha_pedido'] = pd.to_datetime(df_only_p['fecha_pedido'], errors='coerce')
df_diario = df_only_p.groupby('fecha_pedido')['monto_total'].sum().reset_index()
df_diario['monto_acumulado_diario'] = df_diario['monto_total'].cumsum()

print(df_only_p['tiempo_entrega_min'].describe().round(2)) #30. Usa .describe() pero solo para la columna de tiempo_entrega_min.
"""

"""


###BLOQUE 4###

################## EJERCICIO 31-32 ##################

    #Esta función devuelve el resumen estadístico para encontrar las etiquetas de categorías
    print(df_only_p['monto_total'].describe().round(2)) 

    ###Primero se pone el ejrcicio específico pedido por la IA para la práctica.
        -31. Crea una función que clasifique el monto: 'Bajo', 'Medio' o 'Alto'.
        -32. Aplica esa función al DataFrame usando .apply().

    def clasificacion_monto(monto): #31. Crea una función que clasifique el monto: 'Bajo', 'Medio' o 'Alto'.
        if monto < 22250:
            return 'Bajo'
        elif 22250 <= monto < 62750:        #Se definen los rangos de las categorías con base en el resumen estadístico
            return 'Medio'
        else:
            return 'Alto'

    #se aplica la función al DataFrame usando .apply() para crear una nueva columna 'categoria_monto'
    df_only_p['categoria_monto'] = df_only_p['monto_total'].apply(clasificacion_monto) #32. Aplica esa función al DataFrame usando .apply().
    print(df_only_p[['monto_total', 'categoria_monto']].head(10))

    ###Alternativamente, se puede usar pd.cut() para clasificar el monto en categorías de manera más eficiente sin necesidad de definir una función personalizada:

    #  Se definen los rangos (bins) y los nombres (labels)
    # 0 a 22250 = Bajo, 22250 a 40500 = Medio, 40500 a infinito = Alto
    bins = [0, 22250, 40500, float('inf')]
    labels = ['Bajo', 'Medio', 'Alto']

    # 2. Se crea la columna. Pandas la detecta como 'category' de inmediato
    df_only_p['clasificacion_monto'] = pd.cut(df_only_p['monto_total'], bins=bins, labels=labels)
################## FINALIZA EL EJERCICIO ##################

# Solo columnas numéricas para evitar errores de tipo de dato
correlaciones = df_only_p.corr(method='spearman', numeric_only=True) #33. Calcula la correlación entre monto y tiempo de entrega (.corr()).

print(correlaciones[['monto_total', 'tiempo_entrega_min']])

df_only_p['fecha_pedido'] = pd.to_datetime(df_only_p['fecha_pedido'], errors='coerce') #34. Haz un "Resample" por semana para ver el volumen de pedidos.
print(df_only_p.resample('W', on='fecha_pedido')['monto_total'].size())

df_p_u = pd.merge(df_only_p, df_u, on='id_usuario')
df_maestro= pd.merge(df_p_u, df_res , on='id_restaurante')
# 35. Tabla dinámica de Ciudades vs Especialidades
pivot_pedidos = pd.pivot_table(df_maestro, 
                               values='id_pedido',          #35. Crea una tabla dinámica (pivot_table) de ciudades vs especialidades.
                               index='ciudad',     
                               columns='especialidad', 
                               aggfunc='count',    
                               fill_value=0)       

print(pivot_pedidos)

# 1. Asegurar que sea datetime
df_only_p['fecha_pedido'] = pd.to_datetime(df_only_p['fecha_pedido'])

# 2. Filtrar: .dt.weekday extrae el número del día
df_finde = df_only_p[df_only_p['fecha_pedido'].dt.weekday >= 5] #36. Filtra los pedidos que ocurrieron solo en fines de semana.

media_general = df_only_p['tiempo_entrega_min'].mean()
pedidos_lentos = df_only_p[df_only_p['tiempo_entrega_min'] > media_general]
calculo_porcentaje = (len(pedidos_lentos) / len(df_only_p)) * 100    #37. Encuentra el porcentaje de pedidos que tardaron más de la media general.

restaurantes_destacados = df_res[df_res['calificacion_promedio'] > 4.5] #38. Genera un nuevo DataFrame con restaurantes de calificación > 4.5.


"""


df_p_u = pd.merge(df_only_p, df_u, on='id_usuario')
df_maestro= pd.merge(df_p_u, df_res , on='id_restaurante')

# 39. Exportación a CSV (El estándar para intercambio de datos)
df_maestro.to_csv('reporte_final.csv', index=False, encoding='utf-8') #39. Exporta tu DataFrame final limpio a un archivo llamado reporte_final.csv.

# 40. Exportación a Excel (El estándar para usuarios finales/jefes)
# Nota: Requiere la librería 'openpyxl' instalada
df_maestro.to_excel('reporte_final.xlsx', index=False, sheet_name='Pedidos_2026') #40. Exporta el mismo resultado a un archivo de Excel (.xlsx).

import os
print(f"Tus archivos están aquí: {os.getcwd()}")



conn.close()

import os
print(f"Tus archivos están aquí: {os.getcwd()}")