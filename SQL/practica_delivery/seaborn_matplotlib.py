import sqlite3
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
conn = sqlite3.connect(r'C:\Users\Juan Hincapie\Desktop\Universidad\Estudios_autodidactas\Ruta_analisis_datos\SQL\practica_delivery\delivery.db')

# Creamos el DataFrame Maestro (la unión de todo)
query = """
SELECT p.*,rep.*,  u.ciudad, res.nombre as restaurante, res.especialidad 
FROM pedidos p
JOIN usuarios u ON p.id_usuario = u.id_usuario
JOIN restaurantes res ON p.id_restaurante = res.id_restaurante
JOIN repartidores rep ON p.id_repartidor = rep.id_repartidor
"""
df = pd.read_sql_query(query, conn)

"""
#Ejercicio 51: El Gráfico de Violín (Violin Plot)
#Misión: Analizar la distribución del monto_total según el vehiculo. Queremos saber si un tipo de vehículo suele transportar pedidos más caros que otros.
sns.violinplot(data=df, x='vehiculo', y='monto_total')
plt.title('Distribución del Monto Total por Tipo de Vehículo')
plt.xlabel('Tipo de Vehículo')  
plt.ylabel('Monto Total ($)')
plt.xticks(rotation=45)
plt.show()

#Ejercicio 52: La Línea del Tiempo (Time Series)
#Misión: Graficar la evolución de los ingresos diarios.
df['fecha_pedido'] = pd.to_datetime(df['fecha_pedido'])
sns.lineplot(data=df, x='fecha_pedido', y='monto_total')
plt.title('Monto Total de Pedidos a lo Largo del Tiempo')
plt.xlabel('Fecha del Pedido')
plt.ylabel('Monto Total ($)')
plt.xticks(rotation=45)
plt.show()

#Ejercicio 53: Participación Acumulada (Stacked Bar)
#Misión: Ver cuántos pedidos hay por ciudad, pero "apilando" (coloreando) por la especialidad del restaurante.
sns.histplot(data=df, x='ciudad', bins=5, kde=True, hue='especialidad', multiple='stack')
plt.title('Pedidos por ciudad')
plt.xlabel('Ciudad')
plt.show()
"""

corr_s = df.corr(method='spearman', numeric_only=True)


conn.close()







"""
#Ejercicio 41: Frecuencia de Vehículos
#Misión: Queremos saber qué tipo de vehículo es más común entre los repartidores (Moto, Bici, Carro).
#Ejercicio 43: Personalización de Ejes
#Misión: Toma el código del Ejercicio 41 (vehículos) y haz que se vea profesional: añade un título "Repartidores por Tipo de Vehículo" y cambia el nombre del eje Y a "Total de Personas"
sns.countplot(data=df, x='vehiculo')
plt.title('Repartidores por Tipo de Vehículo')
plt.xlabel('Cantidad de vehiculos')
plt.ylabel('Total de Personas')
plt.xticks(rotation=45)
plt.show()

#Ejercicio 42: La "Caja" del Tiempo (Boxplot)
#Misión: Crea un gráfico que muestre la distribución de los tiempos de entrega. Queremos ver visualmente el mínimo, el máximo y la mediana.
sns.boxplot(data=df, y='tiempo_entrega_min')
plt.show()

#Ejercicio 44: Relación entre Gasto y Tiempo
#Misión: ¿Será que los pedidos más caros tardan más tiempo en entregarse? Crea un gráfico de puntos (dispersión).
sns.scatterplot(data=df, x='tiempo_entrega_min', y='monto_total')
plt.title('Relación entre Gasto y Tiempo de Entrega')
plt.xlabel('Tiempo de Entrega (min)')   
plt.ylabel('Monto Total ($)')
plt.show()

##Ejercicio 45: El Color como Categoría (Hue)
##Misión: Repite el ejercicio anterior (el de puntos), pero ahora haz que los puntos cambien de color según la ciudad del usuario.
sns.scatterplot(data=df, x='tiempo_entrega_min', y='monto_total',hue='ciudad')
plt.title('Relación entre Gasto y Tiempo de Entrega')
plt.xlabel('Tiempo de Entrega (min)')   
plt.ylabel('Monto Total ($)')
plt.show()

##Ejercicio 46: Histograma con "Bins" específicos
##Misión: Queremos ver la distribución del monto_total, pero agrupando los datos en solo 5 barras grandes para ver rangos generales de precios.
sns.histplot(data=df, x='monto_total', bins=5, kde=True)
plt.title('Distribución del Monto Total de los Pedidos')
plt.xlabel('Monto Total ($)')
plt.ylabel('Frecuencia')
plt.show()

##Ejercicio 47: Gráfico de Barras de "Ingresos por Ciudad"
##Misión: Queremos saber cuánto dinero (suma) ha generado cada ciudad.
sns.barplot(data=df, x='especialidad', y='monto_total', estimator='sum')
plt.title('Monto Total Promedio por Especialidad del Restaurante')
plt.xlabel('Especialidad del Restaurante')  
plt.ylabel('Monto Total por especialidad ($)')
plt.show()

##Ejercicio 48: FacetGrid (Comparación Lado a Lado)
##Misión: Queremos ver el gráfico de puntos (monto vs tiempo) pero separado en dos cuadros: uno para cada Género o en este caso, por Especialidad.
sns.set_theme(style='darkgrid') #Ejercicio 50: Cambiando el Estilo Visual (Set Theme)
sns.relplot(data=df, x='tiempo_entrega_min', y='monto_total', hue='ciudad', col='especialidad')
plt.suptitle('Relación entre Gasto y Tiempo de Entrega por Ciudad y Especialidad', y=1.02)
plt.xlabel('Tiempo de Entrega (min)')
plt.ylabel('Monto Total ($)')  
plt.show()

##Ejercicio 49: El Mapa de Calor (Heatmap) Simple
##Misión: Ver la correlación entre las variables numéricas de tu tabla.
correlacion = df.corr(numeric_only=True)
sns.heatmap(correlacion, annot=True, cmap='coolwarm')
plt.title('Mapa de Calor de Correlaciones')
sns.set_theme(style='darkgrid')
plt.show()"""
