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

"""
###BLOQUE 4###


"""

#print(df_only_p['monto_total'].describe().round(2)) #30

def clasificacion_monto(monto):
    if monto < 22250:
        return 'Bajo'
    elif 22250 <= monto < 62750:
        return 'Medio'
    else:
        return 'Alto'
df_only_p['categoria_monto'] = df_only_p['monto_total'].apply(clasificacion_monto)
print(df_only_p[['monto_total', 'categoria_monto']].head(10))

#print(df_p.head())

conn.close()


"""
###BLOQUE 1###
print(df_p.tail(10)) #2
print(df_p.columns.tolist()) #3
print(df_u[['nombre_u', 'ciudad_u']]) #4
print(df_p[df_p['monto_total'] > 50000]) #5
print(df_p[df_p['ciudad_u'] == 'Cali']) #6
print(df_p['tiempo_entrega_min'].max()) #7
print(len(df_p))
print(df_p['tiempo_entrega_min'].count()) #8
df_p = df_p.rename(columns={'monto_total': 'valor_factura'}) #9
print(df_p.dtypes) #10

###BLOQUE 2###
print(df_p['fecha_pedido'] = pd.to_datetime(df_p['fecha_pedido'], errors='coerce')) #11
print(df_p['monto_con_propina'] = df_p['monto_total'] * 1.10) #12
print(print(df_p.isnull().sum())) #13
print(df_p = df_p.fillna(df_p['tiempo_entrega_min'].mean())) #14
print(df_p['es_rapido'] = df_p['tiempo_entrega_min'] < 30) #15
print(df_p['dia_semana'] = df_p['fecha_pedido'].dt.day_name()) #16
print(df_u.drop(columns=['fecha_registro'], inplace=True)) #17
print(df_p[(df_u['ciudad_u'] == 'Bogotá') & (df_p['monto_total'] > 30000)]) #18
print(df_p['monto_total'].round(0)) #19
print(df_u['nombre_u'].str.upper()) #20

"""

"""
###BLOQUE 3###
df_pedidos_usuarios = pd.merge(df_p, df_u, on='id_usuario')
print(df_pedidos_usuarios.groupby('ciudad_u')['monto_total'].mean().round(2)) #21

df_union = pd.merge(df_p, df_res, on='id_restaurante')
print(top_ventas = df_union.groupby('nombre_r')['monto_total'].sum().sort_values(ascending=False).head(1)) #22

df_pedidos_x_repartidor= pd.merge(df_p, df_rep , on='id_repartidor')
print(df_pedidos_x_repartidor.groupby('nombre_rep').size().sort_values(ascending=False)) #23

df_pedidos_x_repartidor= pd.merge(df_p, df_rep , on='id_repartidor')
print(df_pedidos_x_repartidor.groupby('vehiculo')['tiempo_entrega_min'].mean().round(2).sort_values(ascending=False)) #24

df_monto_x_res= pd.merge(df_p, df_res , on='id_restaurante')
print(df_monto_x_res.groupby('especialidad')['monto_total'].agg(['max','min'])) #25

df_p['fecha_pedido'] = pd.to_datetime(df_p['fecha_pedido'], errors='coerce')
print(df_p.sort_values(by='fecha_pedido', ascending=False).head(10)) #26

df_top_especialidad_ciudad= pd.merge(df_p, df_res , on='id_restaurante')
print(df_top_especialidad_ciudad.groupby(['ciudad_u','especialidad'])['monto_total'].size().sort_values(ascending=False)) #27

df_usuarios_top= pd.merge(df_only_p, df_u, on='id_usuario')
print(df_usuarios_top.groupby(['id_usuario', 'nombre'])['monto_total'].size().sort_values(ascending=False).head(3)) #28 
#siempre se agrupa por id_usuario para evitar confusiones con nombres repetidos, pero se muestra el nombre para mayor claridad.

df_only_p['fecha_pedido'] = pd.to_datetime(df_only_p['fecha_pedido'], errors='coerce')
df_diario = df_only_p.groupby('fecha_pedido')['monto_total'].sum().reset_index()
df_diario['monto_acumulado_diario'] = df_diario['monto_total'].cumsum()

print(df_only_p['tiempo_entrega_min'].describe().round(2)) #30
"""
