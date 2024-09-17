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
        request = requests.get(self.URL, json={'query': query})
        if request.status_code != 200:
            print ("Query failed to run returned code of %d " % (request.status_code))

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

        request = requests.get(self.URL, json={'query': query})
        if request.status_code != 200:
            print ("Query failed to run returned code of %d " % (request.status_code))

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
            json_resp_info = self.AsnQuery( asn_node,self.date)["data"]["asns"]["edges"][0]["node"]
            asn_rank = json_resp_info["rank"]
            cone_numberAsns = json_resp_info["cone"]["numberAsns"]
            cone_numberPrefixes = json_resp_info["cone"]["numberPrefixes"]
            cone_numberAddresses = json_resp_info["cone"]["numberAddresses"]
            #COUNTRY
            # country_iso = json_resp_info["country"]["iso"]
            as_degree_transit = json_resp_info["asnDegree"]["transit"]
            as_degree_total = json_resp_info["asnDegree"]["total"]

            node_features = [asn_rank,cone_numberAsns,cone_numberPrefixes,cone_numberAddresses,as_degree_transit,as_degree_total]
            node_features = ', '.join([str(feature) for feature in node_features])
            w = f'{str(asn_node)},"{node_features}"\n'
            f.write(w)
        
        f.close()

def label_edgelist(self, edge_list_source_file_csv, type="DiGraph", filename_out="edges.csv"):
        # Leer el archivo CSV
        df_edges = pd.read_csv(edge_list_source_file_csv, sep=',', header=None, names=['src', 'dst'])

        # Agregar una columna para las etiquetas de relación
        df_edges['relationship_label'] = None

        # Iterar sobre las filas del DataFrame
        for row in df_edges.itertuples():
            # Obtener el valor de 'relationship' para cada par de nodos
            response = self.AsnListQuery([row.src, row.dst], self.date)
            relationship = response.get("data", {}).get("asnLink", {}).get("relationship", "")

            # Asignar la etiqueta basada en la relación
            if relationship == "provider":
                df_edges.at[row.Index, 'relationship_label'] = 0
            elif relationship == "peer":
                df_edges.at[row.Index, 'relationship_label'] = 1
            elif relationship == "customer":
                df_edges.at[row.Index, 'relationship_label'] = 2
            else:
                df_edges.at[row.Index, 'relationship_label'] = 3  # Valor por defecto si no coincide con las opciones

        # Crear el grafo usando NetworkX
        if type == "DiGraph":
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.DiGraph())
        elif type == "MultiDiGraph":
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.MultiDiGraph())
        else:
            self.nx_graph = nx.from_pandas_edgelist(df_edges, "src", "dst", edge_attr=["relationship_label"], create_using=nx.Graph())

        # Guardar el DataFrame con la nueva columna en un archivo CSV
        df_edges.to_csv(self.path + filename_out, index=False)

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
        # Evitar división por cero en caso de que min_val == max_val
        if max_val > min_val:
            df[col] = (df[col] - min_val) / (max_val - min_val)
        else:
            df[col] = 0  # Si min_val == max_val, todos los valores en esa columna son iguales

    # Mostrar el DataFrame normalizado
    print(df)

    # Opcionalmente, guardar el DataFrame normalizado en un nuevo archivo CSV
    df.to_csv(self.path + "normalized_nodes.csv", index=False)