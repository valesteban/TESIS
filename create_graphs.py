import torch
import dgl
import os
from modules.graph import *


# LIST_FEATURES_NO_CATEG = ['ASN', 'AS_rank_numberAsns', 'AS_rank_numberPrefixes', 'AS_rank_numberAddresses', 'AS_rank_total', 'AS_rank_customer',
#                  'AS_rank_peer', 'AS_rank_provider', 'peeringDB_ix_count', 'peeringDB_fac_count', 'AS_hegemony', 'cti_top', 'cti_origin']
# LIST_FEATURES_CATEG = ['AS_rank_continent',
#                         'peeringDB_info_ratio',
#                         'peeringDB_info_scope',
#                         'peeringDB_info_type',
#                         'peeringDB_policy_general'
#                         'ASDB_C1L1']
# # CASO 1 ----------------------------------------------------------------------------------------------------------
# # Path de donde se guardaran archivos
# path_dataset = os.getcwd() + "/datasets/DGL_Graph/MYCODEDiGraph/"
# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label
# type = "DiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.features_nodes(features_filename)

# # 3.- Eliminar nodos de grado 1 hojas

# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)

# # CASO 2 ----------------------------------------------------------------------------------------------------------
# # Path de donde se guardaran archivos
# path_dataset = os.getcwd() +  "/datasets/DGL_Graph/MYCODEMultiDiGraph/"


# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label
# type = "MultiDiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.features_nodes(features_filename)

# # 3.- Eliminar nodos de grado 1 hojas

# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)


# # CASO 3 ----------------------------------------
# """
# node_id,feat
# 1,"10, 7"
# 7843,"33, 54"
# """

# path_dataset = os.getcwd() + "/datasets/DGL_Graph/MYCODEDiGraphDegree/"
# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label
# type = "DiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.only_degree_features_nodes(features_filename)

# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)

# # CASO 4 --------------------------------------
# """
# node_id,feat
# 1,"17, 17"
# 7843,"87, 87"
# 11537,"119, 119"
# """

# path_dataset = os.getcwd() +  "/datasets/DGL_Graph/MYCODEMultiDiGraphDegree/"
# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label
# type = "MultiDiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# # graph.only_degree_features_nodes(features_filename)

# # ---------------------------------------------------------------------------------------------

# # FIXME: No incluir ASN, siempre se va agregar al archivo nodes.csv

# LIST_FEATURES_NO_CATEG = [ 'AS_rank_numberAsns',
#                           'AS_rank_numberPrefixes',
#                           'AS_rank_numberAddresses',
#                           'AS_rank_total',
#                           'AS_rank_customer',
#                           'AS_rank_peer',
#                           'AS_rank_provider',
#                           'peeringDB_ix_count',
#                           'peeringDB_fac_count',
#                           'AS_hegemony',
#                           'cti_top',
#                           'cti_origin']
# LIST_FEATURES_NO_CATEG = ['AS_rank_numberAsns', 'AS_rank_customer', 'peeringDB_fac_count', 'cti_top']

# LIST_FEATURES_CATEG = ['AS_rank_continent',
#                         # 'peeringDB_info_ratio',
#                         # 'peeringDB_info_scope',
#                         # 'peeringDB_info_type',
#                         # 'peeringDB_policy_general'
#                         'ASDB_C1L1'
#                         ]

# # CASO 5 --------------------------------------------------------------------------------------
# """
#     Crear DIGraph con algunos features no todos
# """
# list_feat = LIST_FEATURES_NO_CATEG + LIST_FEATURES_CATEG

# # list_feat = LIST_FEATURES_NO_CATEG + LIST_FEATURES_CATEG
# path_dataset = os.getcwd() +  "/datasets/DGL_Graph/MYCODEDiGraph/"
# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label
# type = "DiGraph"  # o "MultiDiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.features_nodes(features_filename,list_feat)

# # 3.- Eliminar nodos de grado 1 hojas

# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)


# CASO 6 -------------------------------------------------------------------------------------------------------
# Creamos grafo a partir de BGPSTREAM

# Crear Archivos nodes.csv y edges.csv

# Etiquetar edges.csv con CAIDA AS Relationships
file_csv = os.getcwd()+ "/datasets/ROUTE_COLLECTORS/Downloads/graph-2021-06-rrc00-ribs-edges.csv"
filename_caida = os.getcwd()+ "/datasets/CAIDA_AS_Relationships/Serial_2/20210701.as-rel2.txt.bz2"
graph = Graph(os.getcwd()+"/datasets/DGL_Graph/MYCODEGraphRRC02/", debug=True)
graph.label_edgelist(filename_caida,file_csv,type="DiGraph")

# Agregar atributos para cada AS
# 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
graph.features_nodes(features_filename,list_feat="all")

# 3.- Eliminar nodos de grado 1 hojas

graph.remove_nodes_degree(1)
graph.remove_nodes_degree(1)
graph.remove_nodes_degree(1)


# -------------------------------------------------------------------------------------------------------
# FIXME: Para GRaphSAGE los features deben ser de tipo float. ARREGLAR - gnn.dgl_graph.ndata['feat'] = gnn.dgl_graph.ndata['feat'].float()
