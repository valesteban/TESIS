import os
import dgl
import pandas as pd



directorio_actual = os.getcwd()
# print(f"DIR: {directorio_actual}") #C:\Users\valee\Desktop\Repositorios_Git\TESIS
archivos_en_directorio = os.listdir(directorio_actual+"/Metricas/dataset")  # Lista de archivos en el directorio actual
# print(f"ARCHIVOS: {archivos_en_directorio}")

ruta_node_features = directorio_actual+"/Metricas/dataset"+"/node_features/node_features.csv"
dt = pd.read_csv(ruta_node_features)



print(dt.shape)
print(dt.columns)
#         dataset = dgl.data.CoraGraphDataset()
#         self.graph = dataset[0]
#         self.graph.ndata['label'] = self.graph.in_degrees().float()
#         # if self.debug: