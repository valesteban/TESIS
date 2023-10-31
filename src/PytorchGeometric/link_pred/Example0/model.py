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
from dgl.nn import SAGEConv

from dataset import MyRandomDataset

# ----------- 2. create model -------------- #
# build a two-layer GraphSAGE model
class GraphSAGE(torch.nn.Module):
    def __init__(self, in_feats, h_feats):
        super(GraphSAGE, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, 'mean')
        self.conv2 = SAGEConv(h_feats, h_feats, 'mean')

    def forward(self, g, in_feat):
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    


custom_dataset = MyRandomDataset("data/")
data = custom_dataset[0]



"""
list to do:
---------------------------
* Formulate the problem as a binary classification problem where the edges in 
the graph are treated as positive examples and a number of non-existent edges 
are sampled as negative examples.
* Divide the positive and negative examples into a training set and a test set.
* Build a GNN-based link prediction model that represents the likelihood of connectivity 
between two nodes as a function of their node representation computed from the multi-layer GNN.
* Train and evaluate the model on the training and test sets using a suitable loss function. 
Some of the loss functions that can be used include binary cross-entropy loss, margin loss, mean 
squared error loss, and cross-entropy loss.
* Use the trained model to predict the existence of edges between two arbitrary nodes in the graph.

"""