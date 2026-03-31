import sqlite3
import pandas as pd

# Cambia la ruta por el formato correcto de Windows
conn = sqlite3.connect(r'C:\Users\Juan Hincapie\Desktop\Universidad\Estudios_autodidactas\Ruta_analisis_datos\SQL\practica_delivery\delivery.db')
query = """SELECT 
                nombre, 
                SUM(p.monto_total) AS total_gastado 
            FROM usuarios AS u
            JOIN pedidos AS p ON u.id_usuario = p.id_usuario
            GROUP BY u.id_usuario
            HAVING total_gastado > 200000
            ORDER BY total_gastado DESC;"""

df = pd.read_sql_query(query, conn)

print(df.head())
conn.close()
