from gnn import GNN
from models import  GCN, GraphSAGE, Linear
from torch.optim import Adam
import dgl
import torch
import torch.nn as nn
import torch.nn.functional as F  # Necesario para usar la función mse_loss
import matplotlib.pyplot as plt


gnn = GNN(debug=False)
gnn.load_dataset(force_reload=False)
gnn.split_dataset(0.1)
gnn.add_degree_label()

list_malos= []
for i in range(gnn.train_graph.number_of_nodes()):
    print(f"[train_graph] {gnn.train_graph.nodes()}") # 2708
    print(f"[train_graph] {gnn.train_graph.ndata['feat'][i]}") # 10556
    print(f"[train_graph] {gnn.train_graph.ndata['label'][i]}") # 10556
    print(f"[train_graph] {gnn.train_graph.in_degrees(i)}") # 10556
    if gnn.train_graph.ndata['label'][i] != gnn.train_graph.in_degrees(i):
        list_malos.append(i)
        print(f"[train_graph] {gnn.train_graph.in_degrees(i)}")

print(f"[list_malos] {list_malos}")