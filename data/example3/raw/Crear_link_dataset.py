import pandas as pd
import random

# Número total de filas
n_filas = 30000

# Crear una lista con las filas del DataFrame
filas = []

# Generar los valores de las columnas "node_in" y "node_out" alternando entre "x y" y "y x"
for i in range(n_filas):
    # print(f"[ITERAION]{i}\n")
    if i % 2 == 0:
        # print("a")
        node_in = random.randint(0, 300)
        node_out = random.randint(0, 300)
        fila = [node_in, node_out]
        if fila not in filas:
            filas.append(fila)
    else:
        fila = [node_out,node_in]
        if fila not in filas:
            filas.append(fila)
    # print(f"[FILAs] {filas}\n ----------")

# Crear el DataFrame
df_links = pd.DataFrame(filas, columns=['node_in', 'node_out'])

# Mostrar las primeras 10 filas del DataFrame
# print(df_links.head(100))

df_links.to_excel("data/example4/raw/link_nodes.xlsx")  # El argumento index=False evita que se incluyan los índices en el archivo

