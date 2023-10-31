from torch_geometric.transforms import NormalizeFeatures
import torch_geometric.nn as geom_nn
# from torch_geometric.nn import GCNConv
import torch
import torch.nn.functional as F
from sklearn.model_selection import train_test_split

import matplotlib.pyplot as plt
from sklearn.manifold import TSNE
from dataset import MyDataset

from dataset import MyDataset
from torch_geometric.nn import MessagePassing
from torch_geometric.utils import add_self_loops, degree

"""
Modulo MessagePassing es una clase base en PyTorch Geometric que te permite implementar 
capas de redes neuronales basadas en el mensaje de manera más personalizada y flexible. 
Puedes usar MessagePassing para definir tus propias operaciones de propagación de mensajes 
en grafos y construir capas de redes neuronales basadas en grafos personalizadas.

Para utilizar MessagePassing, necesitas subclasificarla y definir dos métodos clave: message y update. 
Estos métodos se utilizan para calcular los mensajes entre nodos y actualizar las representaciones de 
los nodos, respectivamente.
"""
class GNN(torch.nn.Module):
    def __init__(self, num_features,hidden_channels= 1):
        super().__init__()
        torch.manual_seed(1234567)
        # Capa de Message passing
        self.conv1 = geom_nn.GCNConv(num_features, hidden_channels)

    def forward(self, x, edge_index):
        print(f"[FORWARD]")
        x = self.conv1(x, edge_index)
        x = x.relu()
        return x
    

dataset = MyDataset("data/example3")
data = dataset[0]
model = GNN(data.num_features)
# print(f"Modelo: \n{model}")
# Train the model.
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
loss_fn = torch.nn.MSELoss()


for epoch in range(2):
    model.train()
    optimizer.zero_grad()
    output = model(dataset.x, dataset.edge_index)
    print(f"Output: \n{output}\n")
    print(f"Output len: \n{len(output)}\n")

    loss = loss_fn(output, dataset.y)
    loss.backward()
    optimizer.step()
    print(f"[PARAM]\n {model.parameters()}")
    for name, param in model.named_parameters():
        if param.requires_grad:
            print(f"Parámetro: {name}:")
            print(param.data)
