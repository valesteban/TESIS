import networkx as nx
import pandas as pd
import numpy as  np
from random import sample
import os
import bz2

class Graph:
    def __init__(self,path):
        """
        Constructor de la clase Graph.
        Inicializa la variable self.graph a None, que más tarde se utilizará para almacenar el grafo.
        """
        self.nx_graph = None
        
        self.dataset_dic = None

        self.path = path

    def read_from_relationship_edgelist(self, filename:str,directed:bool):
        """
        Crea archivo edges.csv   apartir de dataset CAIDA AS Relationships.
        Lee un grafo desde un archivo de lista de aristas (edgelist) y lo almacena en self.graph.
        
        Parameters:
            filename (str): Ruta al archivo que contiene la lista de aristas.
            directed (bool): 
            number_relationships (int): Cantidad de relaciones que tendremos, de ser 2 se considera como una sola la de p2c y c2p

        Returns:
            None
        """
        # FIXME: Comparar el nuemroo de nodos y edges , que se construya bien

        nx_graph = nx.Graph()

        with bz2.open(filename, "rb") as f:
            data = f.read()
            lines = data.decode().splitlines()

            tor_dataset = []
            labels = []
            
            for line in lines:

                first_char = line[0]

                if first_char == "#":
                    continue
            
                line = line.split("|")

                # for nx
                src = int(line[0])
                dst = int(line[1])
                label = int(line[2])

                # Add Edge
                tor_dataset.append(np.asarray(line[:2]))                

                if label == -1: #P2C 
                    # Cambiamos valor label a 1
                    labels.append(1)

                    if not directed:
                        # Agregamos relacion C2P 
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(2)
                
                else: # P2P
                    labels.append(label)

                    if not directed:
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(label)
        
        # Creamos DataFrame
        df_edges = pd.DataFrame(tor_dataset, columns=["src_id", "dst_id"])
        df_edges['Relationship'] = labels

        # Creamoss archivo edges.csv
        df_edges.to_csv(self.path + "/datasets/DGL_Graph/MYCODE/edges.csv", index=False)
      
        # Creamos Nx Grafo
        if directed:
            self.nx_graph = nx.from_pandas_edgelist(df_edges,"src_id","dst_id",edge_attr=["Relationship"],create_using=nx.DiGraph())
        else: 
            self.nx_graph = nx.from_pandas_edgelist(df_edges,"src_id","dst_id",edge_attr=["Relationship"],create_using=nx.Graph())
           
        print(self.nx_graph)

        

    def node_features_nodes(self,features_filename):
        """
        Crea archivo nodes.csv con los nodos y sus features
        """
        
        # TODO: hacer lago para que se pueda ir variando los features de nodos GRP SEARCH
        # FIXME: tengo que agregar la creacion de nx_graph al final de la funcion read_from_relationship_edgelist(...)
        features = pd.read_csv(features_filename)
        
        # Creo archivo
        f = open(self.path + "/datasets/DGL_Graph/MYCODE/nodes.csv","w")
        headers = "node_id,feat"
        f.write(headers)

        for node in self.nx_graph.nodes():
            node_features = features.loc[features['ASN'] == int(node)].fillna(0).to_numpy()[0].tolist()[1:]
            node_features = ', '.join([str(feature) for feature in node_features])
            w = f'{str(node)},"{node_features}"\n'
            f.write(w)


    def remove_nodes_degree(self, degree):
        list_nodes_remove = []
        for node,deg in dict(self.nx_graph.degree()).items():
            if deg <= degree:
                list_nodes_remove.append(node)
        
        self.nx_graph.remove_nodes_from(list_nodes_remove)

        # Creamos el nuevo edges.csv
        edge_list =  self.nx_graph.edges.data()
        df_edges = pd.DataFrame(
            [(u, v, data['Relationship']) for u, v, data in edge_list],
            columns=['source', 'target', 'Relationship']
        )
        df_edges.to_csv(self.path + "/datasets/DGL_Graph/MYCODE/edges.csv", index=False)

        print(self.nx_graph)

TOR_LABELS_DICT = {'P2P':0, 'C2P': 1,'P2C': 2}
class_names = ['P2P', 'C2P', 'P2C']
num_classes = len(class_names)


