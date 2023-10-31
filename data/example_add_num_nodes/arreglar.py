import pandas as pd
import numpy as np
import os

directorio_actual = os.getcwd()
print(f"DIR: {directorio_actual}")

archivos_en_directorio = os.listdir(directorio_actual)  # Lista de archivos en el directorio actual
print(f"ARCHIVOS: {archivos_en_directorio}")

# --------------------------------------------------------------------------------------------
# Contaremos los links por nodos y crearemos un datframe con estos ordenados por nodo
df_links = pd.read_excel("data/example_add_num_nodes/link_nodes.xlsx")
# print(len(df_links))

# Cuento por nodos [se mantiene los index]
serie_count = df_links['node_in'].value_counts() #Series de pandas

# Creo nuevo DF con los indices anteriores
df_count_link = pd.DataFrame(serie_count)

# Ordeno df por index
df_count_link = df_count_link.sort_index()

# --------------------------------------------------------------------------------------------
# Comenzamos la parte de agregar esta columna al dataframe final de features
df_features = pd.read_excel("data/example_add_num_nodes/node_features.xlsx")
df_features["y"] = df_count_link. iloc[:,0]
print(f"FATAFREMAE FEATURES: \n{df_features}")


# --------------------------------------------------------------------------------------------
# Guardamos el dataframe en un archivo excel
df_features.to_excel("data/example_add_num_nodes/node_features1.xlsx")  # El argumento index=False evita que se incluyan los índices en el archivo



