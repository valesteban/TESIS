import dgl
import pandas as pd
import numpy as np
import scipy.sparse as sp
import torch
import dgl.data
import dgl
import networkx as nx
import torch
import torch.nn.functional as F

"""
Clase que ordena todos los pasos para la ejecución de un GNN
task = 'link_prediction' | 'node_classification' 
metric = 'AC'
"""

class GNN:
    def __init__(self, task, metric, debug=False):
        self.task = task
        self.metric = metric
        self.debug = debug

        self.graph = None

        # Grafo DGL que contiene los training edges
        self.train_graph = None
        # Grafo DGL que contien los trining edges positivos
        self.train_pos_graph = None
        # Grafo DGL que contien los trining edges negativos
        self.train_neg_graph = None

        # Grafo DGL que contiene los test edges
        self.test_graph = None
        # Grafo DGL que contien los test edges positivos
        self.test_pos_graph = None   
        # Grafo DGL que contien los test edges negativos
        self.test_neg_graph = None

    def load_dataset_cora(self):
        dataset = dgl.data.CoraGraphDataset()
        self.graph = dataset[0]
        self.graph.ndata['label'] = self.graph.in_degrees().float()
        # if self.debug:
            # print('[load_dataset]', self.graph)
        # self.graph = dgl.data.CSVDataset(data_path, force_reload=force_reload)[0]

    def split_dataset(self):

        n_nodes = self.graph.number_of_nodes()
        print(f"[num nodes] {n_nodes}")

        n_train = int(n_nodes * 0.6)
        n_val = int(n_nodes * 0.2)
        train_mask = torch.zeros(n_nodes, dtype=torch.bool)
        val_mask = torch.zeros(n_nodes, dtype=torch.bool)
        test_mask = torch.zeros(n_nodes, dtype=torch.bool)

        train_mask[:n_train] = True
        val_mask[n_train : n_train + n_val] = True
        test_mask[n_train + n_val :] = True

        self.train_graph = self.graph.subgraph(train_mask.nonzero(as_tuple=False).squeeze())
        self.test_graph = self.graph.subgraph(test_mask.nonzero(as_tuple=False).squeeze())
        self.val_graph = self.graph.subgraph(val_mask.nonzero(as_tuple=False).squeeze())

        if self.debug:
            print(f"[graph] {self.graph.ndata['label'].shape} - {self.graph.number_of_nodes()} - {self.graph.number_of_edges()}")
            print(f"[train graph] {self.train_graph.ndata['label'].shape} - {self.train_graph.number_of_nodes()} - {self.train_graph.number_of_edges()} - {self.train_graph.ndata['label'].shape[0]} ")
            print(f"[test graph] {self.test_graph.ndata['label'].shape} - {self.test_graph.number_of_nodes()} - {self.test_graph.number_of_edges()}")
            print(f"[val graph] {self.val_graph.ndata['label'].shape} - {self.val_graph.number_of_nodes()} - {self.val_graph.number_of_edges()}")
    
    def add_centrality_label(self):

        # Convertir el grafo DGL a un objeto NetworkX
        nx_graph = self.graph.to_networkx()

        # Calcular el grado de cada nodo
        degree = nx_graph.degree()
        # Convertir los grados a un tensor de PyTorch
        degree_values = torch.tensor(list(degree)).float()
        # Agregar el grado como atributo de nodo en el grafo
        nx_graph.add_node_attribute('weight', degree_values)

        # Calcular la centralidad de vector propio utilizando NetworkX
        eigenvector_centrality = nx.eigenvector_centrality_numpy(nx_graph, weight='weight')
    

        # Convertir los resultados a un tensor de PyTorch
        centrality_values = torch.tensor(list(eigenvector_centrality.values())).float()

        # Agregar la centralidad como atributo de nodo en el grafo DGL
        self.graph.ndata['label'] = centrality_values

        print(self.graph.ndata['label'])
        print(self.graph.ndata['label'].shape)



# path = ''
# gnn = GNN('node-prediction', 'AC')
# gnn.load_dataset_cora()
# gnn.add_centrality_label()
# gnn.split_dataset()
# print(gnn.graph.ndata['feat'])





"""
Nodos:
nodo 0: [1, 2, 3]
nodo 1: [4, 5, 6]
nodo 2: [7, 8, 9]
nodo 3: [10, 11, 12]

edges:
(0, 1)
(1, 2)
(2, 3)

self.train_grapg =  graph(V=4, E=3)
                    edge_list([(0, 1), (1, 2), (2, 3)])

self.train_pos_graph =  graph(V=4, E=2)
                        edge_list([(0, 1), (1, 2)])
"""