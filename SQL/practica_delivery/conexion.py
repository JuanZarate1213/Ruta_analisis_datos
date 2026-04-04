import sqlite3
import pandas as pd

# Cambia la ruta por el formato correcto de Windows
conn = sqlite3.connect(r'C:\Users\Juan Hincapie\Desktop\Universidad\Estudios_autodidactas\Ruta_analisis_datos\SQL\practica_delivery\delivery.db')
query1 = """SELECT * FROM pedidos AS p
            JOIN usuarios AS u ON p.id_usuario = u.id_usuario
            JOIN restaurantes AS r ON p.id_restaurante = r.id_restaurante;"""
query2 = """SELECT * FROM usuarios;"""
query3 = """SELECT * FROM restaurantes AS r;"""
df_pedidos = pd.read_sql_query(query1, conn) #1
df_usuarios = pd.read_sql_query(query2, conn) 
df_restaurantes = pd.read_sql_query(query3, conn)

"""
###BLOQUE 3###
print(df_pedidos['monto_total'].groupby(df_usuarios['ciudad']).mean().round(2)) #21


"""
# 1. Une las tablas (Equivalente al JOIN de tu SQL)
df_union = pd.merge(df_pedidos, df_restaurantes, on='id_restaurante')

# 2. Agrupa sobre la tabla unida
top_ventas = df_union.groupby('nombre')['monto_total'].sum().sort_values(ascending=False)

print(top_ventas)

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

###BLOQUE 2###
print(df_pedidos['fecha_pedido'] = pd.to_datetime(df_pedidos['fecha_pedido'], errors='coerce')) #11
print(df_pedidos['monto_con_propina'] = df_pedidos['monto_total'] * 1.10) #12
print(print(df_pedidos.isnull().sum())) #13
print(df_pedidos = df_pedidos.fillna(df_pedidos['tiempo_entrega_min'].mean())) #14
print(df_pedidos['es_rapido'] = df_pedidos['tiempo_entrega_min'] < 30) #15
print(df_pedidos['dia_semana'] = df_pedidos['fecha_pedido'].dt.day_name()) #16
print(df_usuarios.drop(columns=['fecha_registro'], inplace=True)) #17
print(df_pedidos[(df_usuarios['ciudad'] == 'Bogotá') & (df_pedidos['monto_total'] > 30000)]) #18
print(df_pedidos['monto_total'].round(0)) #19
print(df_usuarios['nombre'].str.upper()) #20

"""

