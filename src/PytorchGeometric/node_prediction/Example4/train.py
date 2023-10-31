from dataset import MyDataset
from model import GCN
import torch
from sklearn.model_selection import train_test_split


dataset = MyDataset("data/example4")
data = dataset[0]
print(f"Numero features nodo: \n{data.num_features}\n")
model = GCN(data.num_features)
print(f"Modelo: \n{model}")




optimizer = torch.optim.Adam(model.parameters(), lr=0.01, weight_decay=5e-4)
criterion = torch.nn.MSELoss()




def train(train_nodes):
        model.train()

        optimizer.zero_grad()
        out = model(data.x, data.edge_index)
        target = data.y[train_nodes]  # Ajustar la forma de target a un vector unidimensional
        loss = criterion(out[train_nodes], target)
        loss.backward()
        optimizer.step()


        
        return loss


# def test(test_nodes):
#     model.eval()
#     out = model(data.x, data.edge_index)
#     pred = out.argmax(dim=1)
#     test_correct = pred[test_nodes] == data.y[test_nodes]
#     test_acc = int(test_correct.sum()) / len(test_nodes)
#     return test_acc

# print(f" Data: \n{data}\n")
# print(f" Data x : \n {data.x}\n")
# print(f" Data y : \n {data.y}\n")
# print(f" Data edge_index : \n {data.edge_index}\n")

# loss = train(train_nodes)
# for epoch in range(1, 101):
#     loss = train(train_nodes)
#     test_acc = test(test_nodes)
#     print(f'Epoch: {epoch:03d}, Loss: {loss:.4f}, Test Accuracy: {test_acc:.4f}')

#---------------------------------------------------------------------------------------------
# Partimos dataset para nodos de test y nodos de train 
# print(f"Numero nodos: \n{data.num_nodes}\n") #301
train_nodes, test_nodes = train_test_split(range(data.num_nodes), test_size=0.2, random_state=42)

# print(f"Numero train_nodes: \n{len(train_nodes)}\n") #240
# print(f"Numero test_nodes: \n{len(test_nodes)}\n") #61

# ------------------------------------------------------------------------------------------------
# Corremos el entrenamiento
num_epochs = 10
for epoch in range(num_epochs):
    loss = train(train_nodes)
    print(f"Época {epoch + 1}/{num_epochs}, Loss: {loss:.4f}")
    
    # Imprime o registra los valores de los parámetros en cada época
    for name, param in model.named_parameters():
        if param.requires_grad:
            print(f"Parámetro {name}:")
            print(param.data)







