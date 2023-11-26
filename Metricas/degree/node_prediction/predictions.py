from gnn import GNN
from models import  GCN, GraphSAGE, Linear
from my_models import Model, ModelUno
from torch.optim import Adam
import dgl
import torch
import torch.nn as nn
import torch.nn.functional as F  # Necesario para usar la función mse_loss
import matplotlib.pyplot as plt

path_data_featuresless =  "Metricas/data_featuresless"
path_data_with_features = "Metricas/data"

gnn = GNN(debug=False)
gnn.load_dataset(path_data= path_data_featuresless,force_reload=False)
gnn.split_dataset(0.1)
gnn.add_degree_label()

in_feat = gnn.graph.ndata['feat'].shape[1]
print(f"[in_feat] {in_feat}") #72 

model = GCN(in_feat, in_feat*2)
model = ModelUno()
print(model)
optimizer = Adam(model.parameters(), lr=0.05)

# # criterion = torch.nn.L1Loss()  #Mean Absolute Error
criterion = nn.MSELoss()  #Mean Square Error



# # print("+++++++++++++TRAIN++++++++++++++++++++")
for e in range(101):
    
    model.train()
    optimizer.zero_grad()
    
    # forward
    # out = model(gnn.train_graph, gnn.train_graph.ndata['feat']).view(-1).float()
    out = model(gnn.train_graph).view(-1).float()
    target = gnn.train_graph.ndata['label'].float() 

    loss = criterion(out, target)
    loss.backward()
    optimizer.step()

    if e % 20 == 0:
        print(f"1=>[pred] {out[0]} [label] {target[0]}")
        print(f"2=>[pred] {out[1]} [label] {target[1]}")
        print(f"3=>[pred] {out[2]} [label] {target[2]}")
        print('In epoch {}, loss: {}'.format(e, loss))
        # Mostrar actualizaciones de los parámetros
        for name, param in model.named_parameters():
            if param.requires_grad:
                print(f'Parameter {name}: {param.data}')


# Después de entrenar, graficar los resultados
model.eval()  # Cambiar a modo de evaluación

with torch.no_grad():
    test_out = model(gnn.test_graph).view(-1).float()
    test_target = gnn.test_graph.ndata['label'].float()
    # Calcular Mean Squared Error (MSE) en el conjunto de prueba
    mse = F.mse_loss(test_out, test_target)


    # También puedes imprimir o mostrar el valor de MSE
    print('MSE en conjunto de prueba:', mse)
    print('MSE: {}'.format( loss))

    print(f"1=>[pred] {test_out[0]} [label] {test_target[0]}")
    print(f"2=>[pred] {test_out[1]} [label] {test_target[1]}")
    print(f"3=>[pred] {test_out[2]} [label] {test_target[2]}")
    