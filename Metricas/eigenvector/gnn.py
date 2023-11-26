import dgl
import torch
import dgl.data
import dgl
import networkx as nx
import torch


class GNN:
    def __init__(self, debug=False):
        self.debug = debug
        self.graph = None

        # Grafo DGL que contiene los training edges
        self.train_graph = None

        # Grafo DGL que contiene los test edges
        self.test_graph = None

    def load_dataset(self, path_data,force_reload=False):
        self.graph = dgl.data.CSVDataset(path_data, force_reload=force_reload)[0]
        if self.debug:
            print('[load_dataset]')
            print('[graph]:',self.graph)

    def add_centrality_label(self):

        # Convertir el grafo DGL a un objeto NetworkX
        nx_graph = nx.Graph(self.graph.to_networkx())
        nx_graph_train = nx.Graph(self.train_graph.to_networkx())
        nx_graph_test = nx.Graph(self.test_graph.to_networkx())

        # Calcular la centralidad de vector propio utilizando NetworkX
        eigenvector_centrality = nx.eigenvector_centrality(nx_graph)
        eigenvector_centrality_train = nx.eigenvector_centrality(nx_graph_train)
        eigenvector_centrality_test = nx.eigenvector_centrality(nx_graph_test)
        # print(eigenvector_centrality)

        # Convertir los resultados a un tensor de PyTorch
        centrality_values = torch.tensor(list(eigenvector_centrality.values())).float()
        centrality_values_train = torch.tensor(list(eigenvector_centrality_train.values())).float()
        centrality_values_test = torch.tensor(list(eigenvector_centrality_test.values())).float()

        # Agregar la centralidad como atributo de nodo en el grafo DGL
        self.graph.ndata['label'] = centrality_values
        self.train_graph.ndata['label'] = centrality_values_train
        self.test_graph.ndata['label'] = centrality_values_test

        if self.debug:
            print('[add_centrality_label]')
            # print('[graph]:',self.graph.ndata['label'])
            print('[graph]:',self.graph.ndata['label'].shape)
       
    
    def split_dataset(self, percentage):
        node_ids = self.graph.nodes().tolist()
        test_size = int(len(node_ids) * percentage)

        self.train_graph = dgl.remove_nodes(self.graph, node_ids[:test_size])
        self.test_graph = dgl.remove_nodes(self.graph, node_ids[test_size:])
        if self.debug:
            print('[split_dataset]')
            print('[train_graph]:',self.train_graph)
            print('[test_graph]:',self.test_graph)




# gnn = GNN(debug=True)

# gnn.load_dataset(force_reload=False)
# gnn.split_dataset(0.1)
# gnn.add_centrality_label()

