from typing import Any
import torch
import torch.nn as nn
import torch.nn.functional as F
import torchvision.ops as ops
from dgl.nn.pytorch import SAGEConv, GraphConv, GATConv, GINConv
import dgl.function as fn
import dgl
import itertools
import numpy as np
import scipy.sparse as sp

class GCN(nn.Module):
    def __init__(self, in_feats, h_feats):
        super(GCN, self).__init__()
        self.conv1 = GraphConv(in_feats, h_feats)
        self.conv2 = GraphConv(h_feats, 1)

    def forward(self, g, in_feat):
        g = dgl.add_self_loop(g)
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    
class Linear(nn.Module):
    def __init__(self, in_feats, h_feats):
        super(Linear, self).__init__()
        self.c1 = nn.Linear(in_feats, 1)

    def forward(self, g, in_feat):
        h = self.c1(g, in_feat)
        h = F.relu(h)
        return h



class GraphSAGE(nn.Module):
    def __init__(self, in_feats, h_feats):
        super(GraphSAGE, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, 'mean')
        self.conv2 = SAGEConv(h_feats, h_feats, 'mean')

    def forward(self, g, in_feat):
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    
