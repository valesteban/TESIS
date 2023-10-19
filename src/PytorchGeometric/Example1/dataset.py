from torch_geometric.data import InMemoryDataset, Data
from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
import os
import pandas as pd
import torch

df_nodes = pd.read_excel("data/node_features.xlsx")
df_link = pd.read_excel("data/link_nodes.xlsx")


class MyOwnDataset(InMemoryDataset):
    def __init__(self, root, transform=None, pre_transform=None, pre_filter=None):
        super().__init__(root, transform, pre_transform, pre_filter)
        self.data, self.slices = torch.load(self.processed_paths[0])

    @property
    def raw_file_names(self):
        """
        A list of files in the raw_dir which needs to be found in order to skip the download
        """
        return []

    @property
    def processed_file_names(self):
        """
        A list of files in the processed_dir which needs to be found in order to skip the processing
        """
        return []

    def download(self):
        """
        Downloads raw data into raw_dir
        """
        pass

    def process(self):
        """
        Processes raw data and saves it into the processed_dir
        """
    data = pd.read_excel("data/node_features.xlsx")  # Cargar datos desde Excel
    x = torch.tensor(data.iloc[:,:-1].values, dtype=torch.float)
    y = torch.tensor(data['y'].values, dtype=torch.long)

# # dataset = CustomDataset("data/Planetoid")
# # print(f"Numero clases {dataset.num_classes}")
# # print(f"Numero features {dataset.num_features}")
# # print(dataset[0])