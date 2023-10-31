from torch_geometric.data import InMemoryDataset, Data
from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
import os

"""
InMemoriDataset should be used if the whole dataset fits into CPU memory.
    - Name        cora()
    - nodes      2.708
    - edges      10.556
    - features   1433
    - classes    7
"""
class CustomCoraDataset(InMemoryDataset):
    def __init__(self, root, transform=None, pre_transform=None):
        super().__init__(root, transform, pre_transform)
        self.data = self.process()  

    @property
    def raw_file_names(self):
        """
        A list of files in the raw_dir which needs to be found in order to skip the download
        """
        print(f"[RAW_FILE_NAMES]")
        return ["link_nodes.xlsx","node_features.xlsx"]

    @property
    def processed_file_names(self):
        """
        A list of files in the processed_dir which needs to be found in order to skip the processing
        """
        print(f"[PROCESSED_FILE_NAMES]")
        return ['custom_cora_data.pt']

    def download(self):
        """
        Downloads raw data into raw_dir
        """
        print(f"[DOWNLOAD]")
        pass

    def process(self):
        """
        Processes raw data and saves it into the processed_dir
        """
        print(f"[PROCESS]")
        
        # Si los datos no están en disco, cargar el dataset "Cora"
        dataset = Planetoid(root="data/", name='Cora', transform=NormalizeFeatures())

        data = dataset[0]  # Obtener el primer grafo en el dataset "Cora"

        # Crear un objeto Data con los atributos de "Cora"
        data = Data(x=data.x, edge_index=data.edge_index, y=data.y)

        return data
    
dataset = CustomCoraDataset("data/")
# print(dataset)
# print(dataset.edge_index)
# data = dataset[0]
# print(type(data))  # <class 'torch_geometric.data.data.Data'>
# print(type(dataset)) 