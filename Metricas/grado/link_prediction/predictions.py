from gnn import GNN
from models import  GCN, GraphSAGE
from torch.optim import Adam
import dgl
import torch
import torch.nn as nn



gnn = GNN(debug=True)
gnn.load_dataset(force_reload=True)
gnn.split_dataset()
gnn.add_degree_label()

in_feat = gnn.graph.ndata['feat'].shape[1]

# print(f"[in_feat] {in_feat}") #1433

model = GCN(in_feat, 32)

optimizer = Adam(model.parameters(), lr=0.01)
criterion = nn.MSELoss()

print("+++++++++++++TRAIN++++++++++++++++++++")
for e in range(200):
    
    model.train()
    optimizer.zero_grad()
    
    # forward
    out = model(gnn.train_graph, gnn.train_graph.ndata['feat']).view(-1)
    # print(f"[pred] {out.shape}") #torch.Size([1624])
    # print(f"[target] {gnn.train_graph.ndata['label'].shape}") #torch.Size([1624])
    target = gnn.train_graph.ndata['label'] 

    loss = criterion(out, target)
    loss.backward()
    optimizer.step()

    if e % 10 == 0:
        print(f"1=>[pred] {out[0]} [label] {target[0]}")
        print(f"2=>[pred] {out[1]} [label] {target[1]}")
        print(f"3=>[pred] {out[2]} [label] {target[2]}")
        print('In epoch {}, loss: {}'.format(e, loss))
