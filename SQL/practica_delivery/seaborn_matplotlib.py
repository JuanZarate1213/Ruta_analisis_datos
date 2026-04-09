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

sns.scatterplot(data=df, x='tiempo_entrega_min', y='monto_total',hue='ciudad')

plt.title('Relación entre Gasto y Tiempo de Entrega')
plt.xlabel('Tiempo de Entrega (min)')   
plt.ylabel('Monto Total ($)')
plt.show()



conn.close()