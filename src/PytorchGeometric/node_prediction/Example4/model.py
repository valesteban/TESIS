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
class MyGraphLayer(MessagePassing):
    def __init__(self):
        super(MyGraphLayer, self).__init__()

    def forward(self, x, edge_index):
        # Agrega bucles de identidad a edge_index para considerar los nodos de autoloop
        edge_index, _ = add_self_loops(edge_index, num_nodes=x.size(0))

        # Calcula los grados de los nodos
        deg = degree(edge_index, x.size(0), dtype=x.dtype)

        # Calcula los mensajes enviados desde cada vecino
        messages = self.propagate(edge_index, x=x, deg=deg)

        return messages

    def message(self, x_j, edge_index, deg):
        # Esta función se llama para calcular el mensaje enviado desde un nodo vecino a un nodo de destino.
        # x_j: Atributos de los nodos vecinos
        # edge_index: Índices de los bordes
        # deg: Grados de los nodos
        return x_j / deg.view(-1, 1)

    def update(self, aggr_out):
        # Esta función se llama para actualizar la representación de cada nodo después de recibir y agregar mensajes.
        return aggr_out


class GNN(torch.nn.Module):
    def __init__(self, num_features,hidden_channels):
        super().__init__()
        torch.manual_seed(1234567)
        # Capa de Message passing
        self.conv1 = geom_nn.GCNConv(num_features, hidden_channels)
        # Capa de para rretornar un valor unico
        self.fc = torch.nn.Linear(hidden_channels, 1)

    def forward(self, x, edge_index):
        print(f"[FORWARD]")
        x = self.conv1(x, edge_index)
        x = x.relu()
        x = self.fc(x)
        return x
    



dataset = MyDataset("data/example4")
data = dataset[0]
# print(f"Numero features nodo: \n{data.num_features}\n")
model = GNN(data.num_features, data.num_features)
# print(f"Modelo: \n{model}")
# Train the model.
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
loss_fn = torch.nn.CrossEntropyLoss()

for epoch in range(1):
    model.train()
    optimizer.zero_grad()
    output = model(dataset.x, dataset.edge_index)
    print(f"Output: \n{output}\n")
    print(f"Output len: \n{len(output)}\n")

    loss = loss_fn(output, dataset.y)
    loss.backward()
    optimizer.step()

gnn_layer = {
    "layer_1": geom_nn.GCNConv(),
    "layer_2": geom_nn.MessagePassing
}


"""
* GCN": geom_nn.GCNConv

* GAT": geom_nn.GATConv

* GraphConv": geom_nn.GraphConv



"""