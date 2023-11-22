# TESIS

```bash
Metricas/
├── config.py
├── data
     ├─ nodes.csv
     ├─ edges.csv
     ├─ meta.yaml
     ├── AD_dataset
          ├── AS_dataset.bin
├── grado
     ├── node_prediction
          ├── gnn.py
          ├── models.py
          ├── predictions.py

├── closeness
     ├── ...
```

Archibos

## data
Contiene los archivos para cerar un grafo con la libreria DGL. Este incluye nodes.csv que son los nodos id con sus atributos y edge.cvs correspondiente a las aristas dentro del grafo

## model.py
Contiene las clases para los diferentes modelos de GNN que  se usarán

## gnn.py 
Contine la clase que va controlando el flujo 

## predictions.py
Es el archivo principal que corre todo el codigo de entrenamiento y test 