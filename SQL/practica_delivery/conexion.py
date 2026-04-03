import sqlite3
import pandas as pd

# Cambia la ruta por el formato correcto de Windows
conn = sqlite3.connect(r'C:\Users\Juan Hincapie\Desktop\Universidad\Estudios_autodidactas\Ruta_analisis_datos\SQL\practica_delivery\delivery.db')
query1 = """SELECT * FROM pedidos AS p
            JOIN usuarios AS u ON p.id_usuario = u.id_usuario;"""
query2 = """SELECT * FROM usuarios;"""
df_pedidos = pd.read_sql_query(query1, conn) #1
df_usuarios = pd.read_sql_query(query2, conn) 

"""

"""


#print(df_pedidos.head())

conn.close()

"""
###BLOQUE 1###
print(df_pedidos.tail(10)) #2
print(df_pedidos.columns.tolist()) #3
print(df_usuarios[['nombre', 'ciudad']]) #4
print(df_pedidos[df_pedidos['monto_total'] > 50000]) #5
print(df_pedidos[df_pedidos['ciudad'] == 'Cali']) #6
print(df_pedidos['tiempo_entrega_min'].max()) #7
print(len(df_pedidos))
print(df_pedidos['tiempo_entrega_min'].count()) #8
df_pedidos = df_pedidos.rename(columns={'monto_total': 'valor_factura'}) #9
print(df_pedidos.dtypes) #10

"""