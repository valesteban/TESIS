import torch.nn as nn
import torch.nn.functional as F
from dgl.nn import SAGEConv, GraphConv, GATConv, GINConv, GatedGCNConv, GatedGraphConv
import dgl.function as fn
import dgl
import torch

class ModelGCN(nn.Module):
    def __init__(self, in_feats, h_feats, num_classes):
        super(ModelGCN, self).__init__()
        self.conv1 = GraphConv(in_feats, h_feats, allow_zero_in_degree=True)
        self.conv2 = GraphConv(h_feats, num_classes,allow_zero_in_degree=True)

    def forward(self, g, in_feat):
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h


class GCN(nn.Module):
    def __init__(self, in_size, hid_size, out_size):
        super().__init__()
        self.layers = nn.ModuleList()
        # two-layer GCN
        self.layers.append(
            GraphConv(in_size, hid_size, activation=F.relu, allow_zero_in_degree=True)
        )
        self.layers.append(GraphConv(hid_size, out_size,allow_zero_in_degree=True))
        self.dropout = nn.Dropout(0.5)

    def forward(self, g, features):
        h = features
        for i, layer in enumerate(self.layers):
            if i != 0:
                h = self.dropout(h)
            h = layer(g, h)
        return h

class ModelGraphSAGE(nn.Module):
    def __init__(self, in_feats, h_feats,out_feats):
        super(ModelGraphSAGE, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, 'mean')
        self.conv2 = SAGEConv(h_feats, out_feats, 'mean')

    def forward(self, g, in_feat):
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    
    
class GraphSAGE(nn.Module):
    """
    Con droput
    """
    def __init__(self, in_feats, n_hidden, n_classes):
        super().__init__()
        self.layers = nn.ModuleList()
        self.layers.append(SAGEConv(in_feats, n_hidden, "mean"))
        self.layers.append(SAGEConv(n_hidden, n_classes, "mean"))
        self.dropout = nn.Dropout(0.5)

    def forward(self, sg, x):
        h = x
        for l, layer in enumerate(self.layers):
            h = layer(sg, h)
            if l != len(self.layers) - 1:
                h = F.relu(h)
                h = self.dropout(h)
        return h

    
class ModelSAGESample(nn.Module):
    def __init__(self, in_feats, h_feats, num_classes):
        super(ModelSAGESample, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, aggregator_type='mean')
        self.conv2 = SAGEConv(h_feats, num_classes, aggregator_type='mean')
        self.dropout = nn.Dropout(0.5)
        self.h_feats = h_feats

    def forward(self, mfgs, x):

        h_dst = x[:mfgs[0].num_dst_nodes()]  
        h = self.conv1(mfgs[0], (x, h_dst))  
        h = self.dropout(F.relu(h))
        h_dst = h[:mfgs[1].num_dst_nodes()]  
        h = self.conv2(mfgs[1], (h, h_dst))  
        return h

import torch
import torch.nn as nn
import torch.nn.functional as F
