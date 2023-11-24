from gnn import GNN
from models import  GCN, GraphSAGE, Linear
from torch.optim import Adam
import dgl
import torch
import torch.nn as nn

gnn = GNN(debug=False)
gnn.load_dataset(force_reload=False)
gnn.split_dataset(0.1)
gnn.add_degree_label()

in_feat = gnn.graph.ndata['feat'].shape[1]
# print(f"[in_feat] {in_feat}") #72 

model = GCN(in_feat, in_feat*2)
optimizer = Adam(model.parameters(), lr=0.01)

criterion = torch.nn.L1Loss()  #Mean Absolute Error
# criterion = nn.MSELoss()  #Mean Square Error



print("+++++++++++++TRAIN++++++++++++++++++++")
for e in range(150):
    
    model.train()
    optimizer.zero_grad()
    
    # forward
    out = model(gnn.train_graph, gnn.train_graph.ndata['feat']).view(-1).float()
    target = gnn.train_graph.ndata['label'].float() 

    loss = criterion(out, target)
    loss.backward()
    optimizer.step()

    if e % 20 == 0:
        print(f"1=>[pred] {out[0]} [label] {target[0]}")
        print(f"2=>[pred] {out[1]} [label] {target[1]}")
        print(f"3=>[pred] {out[2]} [label] {target[2]}")
        print('In epoch {}, loss: {}'.format(e, loss))


#FALTA LA PARTE DE TEST, pero hasta ahroa estoy fallando amjestuosamente en el train
