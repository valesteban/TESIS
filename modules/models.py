import torch.nn as nn
import torch.nn.functional as F
from dgl.nn.pytorch import SAGEConv, GraphConv, GATConv, GINConv, GatedGCNConv, GatedGraphConv
import dgl.function as fn
import dgl

class GCN(nn.Module):
    def __init__(self, in_feats, h_feats, num_classes):
        super(GCN, self).__init__()
        self.conv1 = GraphConv(in_feats, h_feats)
        self.conv2 = GraphConv(h_feats, num_classes)

    def forward(self, g, in_feat):

        # Añadir self-loops si no existen
        if not g.has_self_loop(): #FIXME: Investigar esto!!! 
            g = dgl.remove_self_loop(g)
            g = dgl.add_self_loop(g)


        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    

class GraphSAGE(nn.Module):
    def __init__(self, in_feats, h_feats,out_feats):
        super(GraphSAGE, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, 'mean')
        self.conv2 = SAGEConv(h_feats, out_feats, 'mean')

    def forward(self, g, in_feat):
        h = self.conv1(g, in_feat)
        h = F.relu(h)
        h = self.conv2(g, h)
        return h
    

    
class ModelSAGESample(nn.Module):
    def __init__(self, in_feats, h_feats, num_classes):
        super(ModelSAGESample, self).__init__()
        self.conv1 = SAGEConv(in_feats, h_feats, aggregator_type='mean')
        self.conv2 = SAGEConv(h_feats, num_classes, aggregator_type='mean')
        self.h_feats = h_feats

    def forward(self, mfgs, x):

        h_dst = x[:mfgs[0].num_dst_nodes()]  
        h = self.conv1(mfgs[0], (x, h_dst))  
        h = F.relu(h)
        h_dst = h[:mfgs[1].num_dst_nodes()]  
        h = self.conv2(mfgs[1], (h, h_dst))  
        return h