import torch
import dgl
import os
from modules.graph import *



# Path de donde se guardaran archivos
path_dataset = "datasets/DGL_Graph/MYCODE"  
path_dataset = os.getcwd()  

graph = Graph(path_dataset)

# ORDEN

# 1.- Creo topologia dataset y label 
directed = True
file_path = "datasets/CAIDA_as_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
graph.read_from_relationship_edgelist(file_path,directed=directed)

# 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.node_features_nodes(features_filename)


# 3.- Eliminar nodos de grado 1 hojas
print(graph.nx_graph)
graph.remove_nodes_degree(1)
graph.remove_nodes_degree(1)
graph.remove_nodes_degree(1)
