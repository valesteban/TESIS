# dataset.py 
Classe que hereda de InMemoriDataset donde se descarga dataset Cora().
- Name : cora()
- edges : 10.556
- features : 1433
- classes : 7

Se hace un aparticion de los datos en train y test:

```python
train_nodes, test_nodes = train_test_split(range(data.num_nodes), test_size=0.2, random_state=42)
```

Creamos instancia del dataset

```python
custom_dataset = CustomCoraDataset(root='data/CustomCora')
```

Obtener el primer grafo
```python
data = custom_dataset[0]
```
