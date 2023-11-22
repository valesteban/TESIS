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
import os


class GNN:
    def __init__(self, debug=False):
        self.debug = debug
        self.graph = None

        # Grafo DGL que contiene los training edges
        self.train_graph = None

        # Grafo DGL que contiene los test edges
        self.test_graph = None
        
    def load_dataset(self, force_reload=False):
        self.graph = dgl.data.CSVDataset("Metricas/data", force_reload=force_reload)[0]
        if self.debug:
            print('[load_dataset]')
            print('[graph]:',self.graph)
    
    def add_degree_label(self):
        degrees = self.graph.in_degrees()
        self.graph.ndata['label'] = degrees
        degrees_train = self.train_graph.in_degrees()
        degrees_test = self.test_graph.in_degrees()
        self.train_graph.ndata['label'] = degrees_train
        self.test_graph.ndata['label'] = degrees_test
        
        if self.debug:
            print('[add_degree_label]')
            print('[graph]:',self.graph.ndata['label'])
            print('[train_graph]:',self.train_graph.ndata['label'])
            print('[test_graph]:',self.test_graph.ndata['label'])
        
    def split_dataset(self, percentage):
        node_ids = self.graph.nodes().tolist()
        test_size = int(len(node_ids) * percentage)

        self.train_graph = dgl.remove_nodes(self.graph, node_ids[:test_size])
        self.test_graph = dgl.remove_nodes(self.graph, node_ids[test_size:])
        if self.debug:
            print('[split_dataset]')
            print('[train_graph]:',self.train_graph)
            print('[test_graph]:',self.test_graph)



# path = ''
# gnn = GNN(debug=True)
# gnn.load_dataset(force_reload=True)
# gnn.split_dataset(0.1)
# gnn.add_degree_label()


