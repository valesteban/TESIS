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
    def __init__(self, debug=False):
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

    def load_dataset(self, force_reload=False):
        self.graph = dgl.data.CSVDataset("Metricas/data", force_reload=force_reload)[0]
        if self.debug:
            print('[load_dataset]')
            print('[graph]:',self.graph)

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

        # if self.debug:
        #     print(f"[graph] {self.graph.ndata['label'].shape} - {self.graph.number_of_nodes()} - {self.graph.number_of_edges()}")
        #     print(f"[train graph] {self.train_graph.ndata['label'].shape} - {self.train_graph.number_of_nodes()} - {self.train_graph.number_of_edges()} - {self.train_graph.ndata['label'].shape[0]} ")
        #     print(f"[test graph] {self.test_graph.ndata['label'].shape} - {self.test_graph.number_of_nodes()} - {self.test_graph.number_of_edges()}")
        #     print(f"[val graph] {self.val_graph.ndata['label'].shape} - {self.val_graph.number_of_nodes()} - {self.val_graph.number_of_edges()}")

    def add_degree_label(self):

        degree_train = self.train_graph.in_degrees().float()
        degree_test = self.test_graph.in_degrees().float()
        degree = self.graph.in_degrees().float()

        self.graph.ndata['label'] = degree
        self.train_graph.ndata['label'] = degree_train
        self.test_graph.ndata['label'] = degree_test

        if self.debug:
            print(f"[add_degree_label] {self.graph}")
            print(f"[train] {self.train_graph}")
            print(f"[test] {self.test_graph}")

