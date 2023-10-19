from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
from torch_geometric.nn import GCNConv
import torch
import torch.nn.functional as F

dataset = Planetoid(root='data/Planetoid', name='Cora', transform=NormalizeFeatures())

# print(f'Dataset: {dataset}:')                         cora()
# print('======================')                       
# print(f'Number of graphs: {len(dataset)}')                1
# print(f'Number of features: {dataset.num_features}')      1433
# print(f'Number of classes: {dataset.num_classes}')        7
# - Name        cora()
# - nodes      2.708
# - edges      10.556
# - features   1433
# - classes    7

# print(type(dataset)) # <class 'torch_geometric.datasets.planetoid.Planetoid'>
data = dataset[0]  # Get the first graph object.
#print(type(data)) #<class 'torch_geometric.data.data.Data'>
# print(data)



class GCN(torch.nn.Module):
    def __init__(self, hidden_channels):
        super().__init__()
        torch.manual_seed(1234567)
        self.conv1 = GCNConv(dataset.num_features, hidden_channels)
        self.conv2 = GCNConv(hidden_channels, dataset.num_classes)

    def forward(self, x, edge_index):
        x = self.conv1(x, edge_index)
        x = x.relu()
        x = F.dropout(x, p=0.5, training=self.training)
        x = self.conv2(x, edge_index)
        return x
    

model = GCN(hidden_channels=16)
# print(model)
# GCN(
#   (conv1): GCNConv(1433, 16)
#   (conv2): GCNConv(16, 7)
# )


import matplotlib.pyplot as plt
from sklearn.manifold import TSNE

def visualize(h, color):
    z = TSNE(n_components=2).fit_transform(h.detach().cpu().numpy())

    plt.figure(figsize=(10,10))
    plt.xticks([])
    plt.yticks([])

    plt.scatter(z[:, 0], z[:, 1], s=70, c=color, cmap="Set2")
    plt.show()

# model.eval()

# out = model(data.x, data.edge_index)
# visualize(out, color=data.y)

model = GCN(hidden_channels=16)
optimizer = torch.optim.Adam(model.parameters(), lr=0.01, weight_decay=5e-4)
criterion = torch.nn.CrossEntropyLoss()

def train():
      model.train()
      optimizer.zero_grad()
      out = model(data.x, data.edge_index)
      loss = criterion(out[data.train_mask], data.y[data.train_mask])
      loss.backward()
      optimizer.step()
      return loss

def test():
      model.eval()
      out = model(data.x, data.edge_index)
      pred = out.argmax(dim=1)
      test_correct = pred[data.test_mask] == data.y[data.test_mask]
      test_acc = int(test_correct.sum()) / int(data.test_mask.sum())
      return test_acc


for epoch in range(1, 101):
    loss = train()
    # print(f'Epoch: {epoch:03d}, Loss: {loss:.4f}')
# GAT(
#   (conv1): GATConv(1433, 8, heads=8)
#   (conv2): GATConv(64, 7, heads=8)
# )

test_acc = test()
print(f'Test Accuracy: {test_acc:.4f}')
model.eval()
out = model(data.x, data.edge_index)
visualize(out, color=data.y)


 