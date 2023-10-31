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
#correrlo desde 
path_nodes_features ="C:/Users/valee/Desktop/Repositorios_Git/TESIS/src/PytorchGeometric/Example3/node_features.xlsx"
path_link_nodes = "C:/Users/valee/Desktop/Repositorios_Git/TESIS/src/PytorchGeometric/Example3/link_nodes.xlsx"

"""
Nodes: 
Edges:
Node features:
Labels: El numero de conexiones (node-level regresion task)
"""

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

class GCN(torch.nn.Module):
    def __init__(self, out_channels =1):
        super().__init__()
        self.conv1 = GCNConv(in_channels=2, out_channels=2)
        self.conv2 = GCNConv(in_channels=2, out_channels=1)

    def forward(self, x, edge_index):
        x = self.conv1(x, edge_index)
        x = F.relu(x)
        x = self.conv2(x, edge_index)
        return x
    

custom_dataset = MyRandomDataset("data/")
data = custom_dataset[0]


train_nodes, test_nodes = train_test_split(range(data.num_nodes), test_size=0.2, random_state=42)
print(f" Data n° nodes: \n{data.num_nodes}\n")
print(f" Data n° nodes: \n{data}\n")

data.train_nodes = train_nodes
data.test_nodes = test_nodes

print(f" Data Train: \n{data.train_nodes}\n")
print(f" Data Test: \n{data.test_nodes}\n")

model = GCN()
# print(f"Modelo: \n{model}")
# """
# Modelo: Tiene solo una capa
# GCN(
#   (conv1): GCNConv(71, 1)
# )
# """

optimizer = torch.optim.Adam(model.parameters(), lr=0.01, weight_decay=5e-4)
criterion = torch.nn.MSELoss() #FIXME: cambiar funcion loss porque no es lineal 
#TODO: ver como funicona MSE con GCNConv


def accuracy(predictions, labels, threshold=0.5):
    # Aplicar umbral a las predicciones
    predicted_classes = (predictions >= threshold).float()
    
    # Calcular la precisión
    correct = (predicted_classes == labels).sum().item()
    total = labels.size(0)
    accuracy = correct / total
    return accuracy


def train(model, data, optimizer, criterion, num_epochs):
    model.train()
    for epoch in range(num_epochs):
        optimizer.zero_grad()
        output = model(data.x, data.edge_index)
        loss = criterion(output[data.train_nodes], data.y[data.train_nodes])
        loss.backward()
        optimizer.step()
        
        # Calcular predicciones y valores reales en cada época
        train_predictions = output[data.train_nodes]
        train_labels = data.y[data.train_nodes]
        
        print(f'Epoch [{epoch + 1}/{num_epochs}], Loss: {loss.item()}')
        print(f'Training Predictions: {train_predictions}')
        print(f'Training Labels: {train_labels}')

def test(model, data):
    model.eval()
    output = model(data.x, data.edge_index)
    test_loss = criterion(output[data.test_nodes], data.y[data.test_nodes])
    
    # Calcular predicciones y valores reales en la fase de prueba
    test_predictions = output[data.test_nodes]
    test_labels = data.y[data.test_nodes]
    
    accuracy_value = accuracy(output[data.test_nodes], data.y[data.test_nodes])
    
    print(f'Test Loss: {test_loss.item()}')
    print(f'Accuracy: {accuracy_value * 100:.2f}%')
    print(f'Test Predictions: {test_predictions}')
    print(f'Test Labels: {test_labels}')

# Hiperparámetros
num_epochs = 100

# Entrenamiento
train(model, data, optimizer, criterion, num_epochs)

# Prueba
test(model, data)


"""
TODO: No entinedo porque esta tan mal si tmb deberia tomar encuenta la info de sus coneciones, su estructura

"""