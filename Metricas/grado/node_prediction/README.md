# Grado
 La centralidad de grado es una medida en teoría de redes que evalúa la importancia de un nodo en una red según el número de conexiones que tiene. 

```
├── grado
     ├── node_prediction
          ├── gnn.py
          ├── models.py
          ├── predictions.py

```

## model.py
Contiene las clases para los diferentes modelos de GNN que  se usarán

## gnn.py 
Contine la clase que va controlando el flujo 

## predictions.py
Es el archivo principal que corre todo el codigo de entrenamiento y test 




# Cosas 

Loss function
criterion = torch.nn.NLLLoss()  #Negative Log Likelihood
criterion = torch.nn.CrossEntropyLoss()  #Cross Entropy
criterion = torch.nn.HingeEmbeddingLoss()  #Hinge Embedding
criterion = torch.nn.MultiLabelMarginLoss()  #Multi Label Margin
criterion = torch.nn.MarginRankingLoss()  #Margin Ranking
criterion = torch.nn.TripletMarginLoss()  #Triplet Margin
criterion = torch.nn.KLDivLoss()  #Kullback-Leibler Divergence