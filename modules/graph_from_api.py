import networkx as nx
import pandas as pd
import numpy as  np
from random import sample
import os
import bz2
import re
import argparse
import sys
import json
import requests
from modules.graph import Graph
class Graph_API(Graph):

    def __init__(self, path, date,debug=False):
        # Llamar al constructor de la clase base (Graph)
        super().__init__(path, debug)
        # URL de la API
        self.URL = "https://api.asrank.caida.org/v2/graphql"
        # JSON->Python
        self.date = date

    def AsnListQuery(self,asn_list,date):
        query ="""
                {
                asnLink(asn0: "%s", asn1: "%s", date: "%s") {
                    date
                    asn0 {
                    asn
                    asnName
                    }
                    asn1 {
                    asn
                    asnName
                    }
                    relationship
                }
                }
            """% (asn_list[0],asn_list[1],date)
    
        request = requests.post(self.URL, json={'query': query})
        
        if request.status_code != 200:
            return None

        return request.json()

        
    def AsnQuery(self,asn,date): 
        # 2022-07-01
        query ="""
            {
            asns(asns: ["%s"], dateStart: "%s", dateEnd: "%s") {
                edges {
                node {
                    asn
                    rank
                    date
                    cone {
                    numberAsns
                    numberPrefixes
                    numberAddresses
                    }
                    country {
                    iso
                    name
                    }
                    asnDegree {
                    provider
                    peer
                    customer
                    total
                    transit
                    sibling
                    }
                    
                    
                }
                }
            }
            }"""% (asn,date,date)

        request = requests.post(self.URL, json={'query': query})
    
        if request.status_code != 200:
            return None

        return request.json()
        
    

    def features_nodes(self,filename_out="nodes.csv"):
        """
        Crea archivo nodes.csv con los nodos y sus features.
        Si no se le pasa la lista de features se asumen que se crea con todo
        """
        print("Creating nodes.csv file")
        
        # Crea el archivo nodes.csv
        f = open(self.path + filename_out, "w")
        print("[PATH]",self.path +filename_out)
        
        # Agrega los headers
        headers = "node_id,feat\n"
        f.write(headers)

        # Por cada nodo en la topología, lo agrego en el archivo nodes.csv con sus features
        i = 0
        length_graph = len(self.nx_graph.nodes())
        for asn_node in self.nx_graph.nodes():
            i += 1
            if i % 500 == 0:
                print(f"Node {i} of {length_graph} processed")
            # Filtra las filas correspondientes al nodo y obtiene los features seleccionados
            json_resp_info = self.AsnQuery( asn_node,self.date)["data"]["asns"]["edges"]
    
            if len(json_resp_info) == 0:
                #FIXME: ver si poner etiwqueta por defecto u otro o eliminar?   
                continue

            json_resp_info = json_resp_info[0]["node"]

            asn_rank = json_resp_info["rank"]
            cone_numberAsns = json_resp_info["cone"]["numberAsns"]
            cone_numberPrefixes = json_resp_info["cone"]["numberPrefixes"]
            cone_numberAddresses = json_resp_info["cone"]["numberAddresses"]
            #COUNTRY
            # country_iso = json_resp_info["country"]["iso"] TODO: ver si se agrega
            as_degree_transit = json_resp_info["asnDegree"]["transit"]
            as_degree_total = json_resp_info["asnDegree"]["total"]

            node_features = [asn_rank,cone_numberAsns,cone_numberPrefixes,cone_numberAddresses,as_degree_transit,as_degree_total]
            node_features = ', '.join([str(feature) for feature in node_features])
            w = f'{str(asn_node)},"{node_features}"\n'
            f.write(w)
        
        f.close()
    

    def label_edgelist(self, edge_list_source_file_csv, type="DiGraph", filename_out="edges.csv",binary=True):
        # Leer el archivo CSV
        df_edges = pd.read_csv(edge_list_source_file_csv, sep=',', header=None, names=['src', 'dst'])
        print(f"[NUMERO FILAS] {len(df_edges)}")

        # Agregar una columna para las etiquetas de relación
        df_edges['relationship_label'] = None

        edges_not_found = 0
        indices_to_remove = []

        # Iterar sobre las filas del DataFrame
        for i,row in enumerate(df_edges.itertuples()):
            # Saltamos la primera fila (encabezado)
            if i == 0:
                continue
  
            # Obtener el valor de 'relationship' para cada par de nodos
            response = self.AsnListQuery([row.src, row.dst], self.date)
            if response == None:
                #FIXME: ver si poner etiwqueta por defecto u otro o eliminar?
                print(f"Error: No se pudo obtener la relación entre {row.src} y {row.dst}- {i}")
                indices_to_remove.append(row.Index)
                edges_not_found += 1
                continue

            relationship = response.get("data", {}).get("asnLink", {})
            
            if relationship == None:
                print(f"Error: No se pudo obtener la relación entre {row.src} y {row.dst}- {i}")
                #TODO : eliminar la relacion 
                edges_not_found += 1
                indices_to_remove.append(row.Index)
                continue
            else:
                relationship = relationship.get("relationship", "")

            
            
            # Asignar la etiqueta basada en la relación
            if relationship == "provider" and not binary:
                df_edges.at[row.Index, 'relationship_label'] = 2
            elif relationship == "provider" and binary:
                df_edges.at[row.Index, 'relationship_label'] = 1
            elif relationship == "peer":
                df_edges.at[row.Index, 'relationship_label'] = 0
            elif relationship == "customer":
                df_edges.at[row.Index, 'relationship_label'] = 1

        # Eliminamos filas con índices para eliminar (relación no encontrada)
        df_edges = df_edges.drop(index=indices_to_remove) 

        # Crear el grafo usando NetworkX
        if type == "DiGraph":
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.DiGraph())
        elif type == "MultiDiGraph":
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.MultiDiGraph())
        else:
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.Graph())

        # Guardar el DataFrame con la nueva columna en un archivo CSV
        df_edges.to_csv(self.path + filename_out, index=False)
        print(f"[CSV FILE] {self.path + filename_out}")

def normalize_features(self,input_file="nodes.csv",output_file="nodes.csv"):
    # Leer el archivo CSV
    df_nodes = pd.read_csv(self.path + "nodes.csv", sep=',', header=None, names=['node_id', 'feat'])
    
    # Dividir la columna 'feat' en varias columnas
    feat_columns = df_nodes['feat'].str.split(',', expand=True)

    # Renombrar las nuevas columnas
    feat_columns.columns = [f'feat_{i+1}' for i in range(feat_columns.shape[1])]
    
    # Concatenar el DataFrame original con las nuevas columnas
    df = pd.concat([df_nodes.drop(columns='feat'), feat_columns], axis=1)
    
    # Aplicar log-transform a los valores (añadir 1 para evitar log(0))
    df.iloc[:, 1:] = np.log(df.iloc[:, 1:] + 1)
    
    # Normalización Max Abs Scaling
    for col in feat_columns.columns:
        min_val = df[col].min()
        max_val = df[col].max()
        # Evitar división por cero 
        if max_val > min_val:
            df[col] = (df[col] - min_val) / (max_val - min_val)
        else:
            df[col] = 0  # FIXME: ver correcto control

    print(df)

    df.to_csv(self.path + "nodes.csv", index=False)

    def filter_edges_with_attributes(self,nodes_file="nodes.csv", edges_file="edges.csv", output_file="edges.csv"):
        # Cargar el archivo de nodos con atributos
        nodes_df = pd.read_csv(self.path +nodes_file)
        
        # Extraer los node_id con atributos
        nodes_with_attributes = set(nodes_df["node_id"].astype(str))
        
        # Cargar el archivo de aristas (edges)
        edges_df = pd.read_csv(self.path +edges_file)
        
        # Filtrar las aristas cuyos nodos fuente y destino están en nodes_with_attributes
        filtered_edges_df = edges_df[
            edges_df["src_id"].astype(str).isin(nodes_with_attributes) &
            edges_df["dst_id"].astype(str).isin(nodes_with_attributes)
        ]
        
        # Guardar las aristas filtradas en un nuevo archivo CSV
        filtered_edges_df.to_csv(self.path +output_file, index=False)
        print(f"Archivo de aristas filtrado guardado en: {output_file}")
