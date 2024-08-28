import dgl
import torch

class GNN:
    def __init__(self, debug=False):
        self.debug = debug
        self.graph = None

        # Grafo DGL que contiene los training edges
        self.train_graph = None

        # Grafo DGL que contiene los test edges
        self.test_graph = None

        self.nx_graph = None
        self.dgl_graph = None
        
    def load_dataset(self, data_path, force_reload=False):
    
        self.dgl_graph = dgl.data.CSVDataset(data_path, force_reload=force_reload)[0]
        if self.debug:
            print(self.graph)
        
        

      # self.dgl_graph = dgl.data.CSVDataset("drive/MyDrive/TESIS/Datasets/gnn-internet-data/My_data_no_eliminate", force_reload=force_reload)[0]  # TODO: ver/internat hacer esto pero sin elimminar los nodos que no tienen casi degreee


    def split_dataset(self):
      """
      Seleccionamos solo algunoso edges que se tomaran en cuenta y en base a unicamente esos se volver a calcu
      """
      # synthetic train-validation-test splits
      number_of_edges = self.dgl_graph.num_edges()

      self.train_mask = torch.zeros(number_of_edges, dtype=torch.bool).bernoulli(0.6)
      self.test_mask = ~self.train_mask

      #TODO: investigar usar from sklearn.model_selection import train_test_split  

    def remove_ndata(self):
      self.ndata = self.dgl_graph.ndata.pop('feat')


# import os


# gnn = GNN(debug=True)

# path_dataset = os.getcwd() + "/datasets/GNN_INTERNET_DATA/DGL_GRAPH/"
# path_dataset = os.getcwd() + "/datasets/DGL_Graph/CAIDA_Relationship-Serial-2-2022-07-Directed-Removed-Nodes/"


# gnn.load_dataset(path_dataset,force_reload= True)

# graph_dgl = dgl.data.CSVDataset(os.getcwd()+"/datasets/DGL_Graph/MYCODE/", force_reload=True)[0]
# print(graph_dgl)

# gnn = GNN(debug=True)

# path_dataset = os.getcwd() + "/datasets/DGL_Graph/MYCODE/"

# # path_dataset = os.getcwd() + "/datasets/DGL_Graph/CAIDA_Relationship-Serial-2-2022-07-Directed-Removed-Nodes/"

# gnn.load_dataset(path_dataset,force_reload= True)

# # gnn.split_dataset()