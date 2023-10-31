from torch_geometric.data import InMemoryDataset, Data
from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
import torch
import pandas as pd
import os
import numpy as np


class MyDataset(InMemoryDataset):
    def __init__(self, root, transform=None, pre_transform=None):
        super(MyDataset, self).__init__(root, transform, pre_transform)
        self.data, self.slices = torch.load(self.processed_paths[0])

    @property
    def raw_file_names(self):
        print("raw_file_names")
        return ['link_nodes.xlsx', 'node_features_count.xlsx']
    
    @property
    def processed_file_names(self):
        """
        lista con la data ya procesada luegod e metodo process.
        Una vez corrida el metodo process se guarda la data en el archivo que aui indico
        """
        return ['example4_data.pt']
    

    def download(self):
        """
        Ya tenemos los datos en disco, no es necesario descargarlos
        """
        

    def process(self):
        print("process")
        # Preprocess the dataset
        df = pd.read_excel(os.path.join(self.raw_dir, '../../../data/example4/raw/node_features_count.xlsx'))
        X =  torch.tensor( df.iloc[:, :-1].values ,dtype=torch.float) #FIXME: ponerle .values
        Y =  torch.tensor( df.iloc[:, -1] ,dtype=torch.float) #FIXME: ponerle .values

        # Cuidado con el index de los nodos, no es el mismo que el de los features
        links = df = pd.read_excel(os.path.join(self.raw_dir, '../../../data/example4/raw/link_nodes.xlsx'))
        source_nodes = df.iloc[:, 1]
        target_nodes = df.iloc[:, 2]
        edge_index = torch.tensor(np.array([source_nodes, target_nodes]), dtype=torch.long)

        data_struct = Data(x=X, y= Y, edge_index=edge_index)
        datalist = [data_struct]
        data, slices = self.collate(datalist)
        
        return torch.save((data, slices), self.processed_paths[0])

    
# dataset = MyDataset("data/example4")
# print(dataset[0])
# print(dataset[0].x)
# print(len(dataset[0].y))
# print(dataset[0].y[0])
# print(dataset[0].edge_index)

"""
Orden sucesos:
1. super().__init__(root, transform, pre_transform): Guarda los atributos de la clase InMEmory como el root, transform y esas cosas.
2. def raw_files_names(self): Devuelve una lista con los nombres de los archivos que se encuentran en la carpeta raw y los guarda en self.raw_files
3. def download(self): Descarga los archivos [si esq no estan en raw_files]
4. def process_file_names(self): Devuelve una lista con los nombres de los archivos que se encuentran en la carpeta processed y los guarda en self.processed_files
5. def process(self): Procesa los archivos de la lista self.processed_files y los guarda en self.processed_paths con la linea         return torch.save((data, slices), self.processed_paths[0])
5. self. data, self.slices = torch.load(self.processed_paths[0]): Carga los datos procesados desde el archivo procesado y los guarda en los atributos data y slices respectivamente.
"""