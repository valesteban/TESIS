from torch_geometric.data import InMemoryDataset, Data
from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
from sklearn.model_selection import train_test_split
import os
from torch_geometric.nn import GCNConv
import torch.nn.functional as F

import matplotlib.pyplot as plt
from sklearn.manifold import TSNE
import pandas as pd
import torch
import numpy as np

path_nodes_features ="C:/Users/valee/Desktop/Repositorios_Git/TESIS/src/PytorchGeometric/node_prediction/Example3/node_features.xlsx"
path_link_nodes = "C:/Users/valee/Desktop/Repositorios_Git/TESIS/src/PytorchGeometric/node_prediction/Example3/link_nodes.xlsx"

class MyRandomDataset(InMemoryDataset):
    def __init__(self, root, transform=None, pre_transform=None, pre_filter=None):
        """
        root: Where the dataset should be stored. This folder is split into 
        raw_dir (downloaded dataset) and processed_dir (processed dataset).
        """
        super().__init__(root, transform, pre_transform, pre_filter)
        self.data, self.slices = torch.load(self.processed_paths[0])

    @property
    def raw_file_names(self):
        """
        If this file exist in raw_dir, the download is not triggered.
        (the download funciton is not implemented here)
        A list of files in the raw_dir which needs to be found in order to skip the download
        """
        return []

    @property
    def processed_file_names(self):
        """
        If these files are found un raw_dir, processing is skipped
        A list of files in the processed_dir which needs to be found in order to skip the processing
        """
        return ["data.pt"] 

    def download(self):
        """
        Downloads raw data into raw_dir
        """
        pass

    def process(self):
        """
        Processes raw data and saves it into the processed_dir
        """
        print(f"process... data!!!")
        # Cargar excel con node features
        data = pd.read_excel(path_nodes_features, header=0)  # delimiter=',' indica que el delimitador es la coma y header=0 indica que la primera fila contiene los encabezados

        edge_index = torch.tensor([[0, 1, 0, 4, 1, 2, 1, 4, 2, 4, 2, 6, 2, 7, 3, 5, 3, 4, 4, 7, 5, 6, 6, 7 ],
                                   [1, 0, 4, 0, 2, 1, 4, 1, 4, 2, 6, 2, 7, 2, 5, 3, 4, 3, 7, 4, 6, 5, 7, 6]], dtype=torch.long)
        
        x = torch.tensor([[16,0], [0,1], [25,2], [19,3],[12,4],[22,5],[34,6],[31,7],], dtype=torch.float)
        y = torch.tensor([[2], [3], [4], [2],[5],[2],[3],[3]], dtype=torch.float)
        # Crear un objeto Data de PyTorch Geometric
        data = Data(x=x, y= y, edge_index=edge_index)
        datalist = [data]
        data, slices = self.collate(datalist)
        # torch.save((data, slices), self.processed_paths[0])
        return torch.save((data, slices), self.processed_paths[0])
    

# custom_dataset = MyRandomDataset("data/")
# data = custom_dataset[0]
