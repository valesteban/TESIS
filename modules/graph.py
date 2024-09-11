import networkx as nx
import pandas as pd
import numpy as  np
from random import sample
import os
import bz2

class Graph:
    def __init__(self,path, debug = False):
        """
        Constructor de la clase Graph.
        Inicializa la variable self.graph a None, que más tarde se utilizará para almacenar el grafo.
        """

        self.debug = debug
        self.nx_graph = None
        
        self.dataset_dic = None

        self.path = path

    def read_from_relationship_edgelist(self, filename:str,type:str):
        """
        Crea archivo edges.csv apartir de dataset CAIDA AS Relationships.
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
                tor_dataset.append(np.asarray(line[:2]))      #seleccionamos los dos primeros elementos de la lista          

                if label == -1: #P2C 
                    # Cambiamos valor label a 1
                    labels.append(1)

                    if type == "MultiDiGraph":
                        # Agregamos relacion C2P 
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(2)
                
                else: # P2P
                    labels.append(label)

                    if type == "MultiDiGraph":
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(label)
        
        # Creamos DataFrame
        df_edges = pd.DataFrame(tor_dataset, columns=["src_id", "dst_id"])
        df_edges['Relationship'] = labels

        # Creamoss archivo edges.csv
        df_edges.to_csv(self.path+"edges.csv", index=False)
        self.nx_graph = nx.from_pandas_edgelist(df_edges, "src_id", "dst_id", edge_attr=["Relationship"], create_using=nx.Graph())

    def label_edgelist(self,filename_caida:str,file_csv:str,type:str):
        """
        Crea archivo edges.csv 
        Etiqueta file_csv con los el file de filename_caida de CAISA AS Relationship.
        """
        df_edges_labeless = pd.read_csv(file_csv)


        with bz2.open(filename_caida, "rb") as f:
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
                tor_dataset.append(np.asarray(line[:2]))      #seleccionamos los dos primeros elementos de la lista          

                if label == -1: #P2C 
                    # Cambiamos valor label a 1
                    labels.append(1)

                    if type == "MultiDiGraph":
                        # Agregamos relacion C2P 
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(2)
                
                else: # P2P
                    labels.append(label)

                    if type == "MultiDiGraph":
                        tor_dataset.append(np.asarray(line[1::-1])) 
                        labels.append(label)
        
        # Creamos DataFrame
        df_edges = pd.DataFrame(tor_dataset, columns=["src_id", "dst_id"])
        df_edges['Relationship'] = labels

        # Convierte columnas a int64 para asegurar que el merge funcione correctamente
        df_edges_labeless[['src_id', 'dst_id']] = df_edges_labeless[['src_id', 'dst_id']].astype(int)
        df_edges[['src_id', 'dst_id']] = df_edges[['src_id', 'dst_id']].astype(int)

        # Agrego columna "Relationship" a df_edges_labeless (merge con df_edges)
        df_edges_labeless = pd.merge(df_edges_labeless, df_edges, on=["src_id", "dst_id"], how="left")
        print(f"[Tamaño df_edges_labeless: {df_edges_labeless.shape}]")

        # Guardamos archivo edges.csv
        df_edges_labeless.to_csv(self.path+"edges.csv", index=False)

        print("Creando archivo edges.csv")
      
        # Creamos Nx Grafo
        if type == "DiGraph":
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src_id", "dst_id", edge_attr=["Relationship"], create_using=nx.DiGraph())
        else: 
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src_id", "dst_id", edge_attr=["Relationship"], create_using=nx.MultiDiGraph())


        # Creamoss archivo edges.csv
        df_edges.to_csv(self.path+"edges.csv", index=False)


        if self.debug == True:
            print(f"[SAVE : {self.path+'edges.csv'}]")
            print(self.nx_graph)

        

    def features_nodes(self,features_filename, list_feat = "all", normalize = False):
        """
        Crea archivo nodes.csv con los nodos y sus features.
        Si no se le pasa la lista de features se asumen que se crea con todo
        """
        
        # TODO: hacer que se pueda ir variando los features de nodos GRP SEARCH
        # FIXME: tengo que agregar la creacion de nx_graph al final de la funcion read_from_relationship_edgelist(...)
        
        # Lee el archivo de características
        features = pd.read_csv(features_filename)
        no_cat_attr = []

        # Si se especifica una lista de features, selecciona solo esas columnas
        if list_feat != "all":

            # Crear una lista para guardar las columnas seleccionadas
            selected_columns = ['ASN']
            
            # Iterar sobre cada prefijo en list_feat (para representacion de hot hot de feat categoricos)
            for prefix in list_feat:
                # Filtrar columnas que empiezan con el prefijo
                matched_columns = [col for col in features.columns if col.startswith(prefix)]
                selected_columns.extend(matched_columns)

                # Agregamos valor no categorico (luego nomrlaizar)
                if prefix in features.columns:
                    no_cat_attr.append(prefix)
                
            # Filtrar el DataFrame para obtener solo columnas seleccionadas
            features = features[selected_columns]

        # Normalizar valores no categoricos
        if normalize:
            self.normalize(features,no_cat_attr)

        # Crea el archivo nodes.csv
        f = open(self.path + "nodes.csv", "w")
        
        # Agrega los headers
        headers = "node_id,feat\n"
        f.write(headers)

        # Por cada nodo en la topología, lo agrego en el archivo nodes.csv con sus features
        for node in self.nx_graph.nodes():
            # Filtra las filas correspondientes al nodo y obtiene los features seleccionados
            node_features = features.loc[features['ASN'] == int(node)].fillna(0).to_numpy()[0].tolist()[1:]
            node_features = ', '.join([str(feature) for feature in node_features])
            w = f'{str(node)},"{node_features}"\n'
            f.write(w)
        
        f.close()

    def only_degree_features_nodes(self, features_filename):
        """
        Crea archivo nodes.csv el cual consiste en node_id y feats lo que consiste en degree_node_in y degree_node_out
        """
        # Leo features de nodos
        features = pd.read_csv(features_filename)

        # Creo archivo
        f = open(self.path + "nodes.csv","w")
        
        # Agregamos headers
        headers = "node_id,feat\n"
        f.write(headers)

        # Crear una lista para almacenar los datos
        data = []

        for node in self.nx_graph.nodes(): #FIXME: ocupar la funcion normalizar
            in_degree = self.nx_graph.in_degree(node)
            out_degree = self.nx_graph.out_degree(node)

            # Transformación logarítmica 𝑥 → log(𝑥 + 1).
            in_degree_log = np.log(in_degree + 1)
            out_degree_log = np.log(out_degree + 1)

            data.append([node, in_degree_log, out_degree_log])

        # Convertimos la lista en un DataFrame para facilitar la normalización
        df = pd.DataFrame(data, columns=['node_id', 'in_degree', 'out_degree'])
        
        # Normalización Max Abs Scaling
        max_abs_value = df[['in_degree', 'out_degree']].abs().max().max()
        df['in_degree'] = df['in_degree'] / max_abs_value
        df['out_degree'] = df['out_degree'] / max_abs_value

        # Guardar datos normalizados en nodes.csv
        with open(self.path + "nodes.csv", "w") as f:
            # Agregamos headers
            headers = "node_id,feat\n"
            f.write(headers)

            # Iteramos sobre el DataFrame para escribir los datos
            for _, row in df.iterrows():
                node_features = f"{row['in_degree']}, {row['out_degree']}"
                f.write(f'{row["node_id"]},"{node_features}"\n')
        if self.debug:
            print(f"[SAVE IN: {self.path+'nodes.csv'}]")

    def remove_nodes_degree(self, degree):
        """
        Elimina nodos de grado menor o igual a 'degree' del grafo.
        """
        list_nodes_remove = []
        for node,deg in dict(self.nx_graph.degree()).items():
            if deg <= degree:
                list_nodes_remove.append(node)
        
        self.nx_graph.remove_nodes_from(list_nodes_remove)

        # Creamos el nuevo edges.csv
        edge_list =  self.nx_graph.edges.data()
        df_edges = pd.DataFrame(
            [(u, v, data['Relationship']) for u, v, data in edge_list],
            columns=['src_id', 'dst_id', 'Relationship']
        )
        df_edges.to_csv(self.path + "edges.csv", index=False)

        if self.debug:
            print(self.nx_graph)

    def normalize(df,no_cat_attr):
        """
        Funcion que se le pasa un DataFrame y normaliza los valores de las columnas que no son categoricas
        """
        # Transformación logarítmica 𝑥 → log(𝑥 + 1).
        df[no_cat_attr] = np.log(df[no_cat_attr] + 1)

        # Normalización Max Abs Scaling
        for col in no_cat_attr:
            # Encontramos min y max
            min_val = df[col].min()
            max_val = df[col].max()
            # Evitar división por cero en caso de que min_val == max_val
            if max_val > min_val:
                df[col] = (df[col] - min_val) / (max_val - min_val)
            else:
                df[col] = 0 # FIXME: Revisar eset caso

TOR_LABELS_DICT = {'P2P':0, 'C2P': 1,'P2C': 2}
class_names = ['P2P', 'C2P', 'P2C']
num_classes = len(class_names)


# file_csv = os.getcwd()+ "/datasets/ROUTE_COLLECTORS/Downloads/graph-2022-06-rrc00-ribs-edges.csv"
# filename_caida = os.getcwd()+ "/datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"
# graph = Graph(os.getcwd()+"/datasets/DGL_Graph/MYCODEGraphRRC00/", debug=True)
# graph.label_edgelist(filename_caida,file_csv,type="DiGraph")
# graphs, _ = dgl.load_graphs(path)
# print(graphs)

# # list_feat = LIST_FEATURES_NO_CATEG + LIST_FEATURES_CATEG
# path_dataset = os.getcwd() +  "/datasets/DGL_Graph/MYCODEGraphRRC00/"  
# graph = Graph(path_dataset, debug=True)

# # 1.- Creo topologia dataset y label 
# type = "DiGraph"  # o "MultiDiGraph"
# file_path = "datasets/CAIDA_AS_Relationships/Serial_2/20220701.as-rel2.txt.bz2"  # Path archivos Relationships para creacion de topologia y etiquetado
# graph.read_from_relationship_edgelist(file_path,type)

# # # 2.- Creo archivo nodes.csv con las features de los nodos que se van a aocupar y lo agrego a  dataset_dic de la clase
# features_filename = "datasets/GNN_INTERNET_DATA/node_features.csv"
# graph.features_nodes(features_filename,list_feat)

# # 3.- Eliminar nodos de grado 1 hojas

# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)
# graph.remove_nodes_degree(1)