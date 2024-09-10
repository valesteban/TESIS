import pybgpstream
import networkx as nx
import dgl
from collections import defaultdict
from itertools import groupby
import os
import numpy as np
import pandas as pd

def clean_asn(asn):
    """
    Limpia el ASN para eliminar caracteres no numéricos como llaves.
    """
    # FIXME: Error que no entiendo pro que pasa Arrgelar
    return asn.strip('{}')

def download_graph_from_bgpstream(from_time, until_time, collectors, record_type,name_out_file):

    # Create an instance of a simple undirected graph
    nx_graph = nx.Graph()

    bgp_lens = defaultdict(lambda: defaultdict(lambda: None))

    stream = pybgpstream.BGPStream(
        # Consider this time interval:
        # Sat, 01 Aug 2015 7:50:00 GMT -  08:10:00 GMT
        from_time=from_time, until_time=until_time,
        collectors=collectors,
        record_type=record_type,
    )

    num_rec = 0
    for rec in stream.records():
        if num_rec%50 == 0:
            print("Record %d" % num_rec)
        num_rec += 1
        for elem in rec:
            # Get the peer ASn
            peer = str(elem.peer_asn)
            # Get the array of ASns in the AS path and remove repeatedly prepended ASns
            hops = [k for k, g in groupby(elem.fields['as-path'].split(" "))]
            if len(hops) > 1 and hops[0] == peer:
                # Get the origin ASn
                origin = hops[-1]
                # Add new edges to the NetworkX graph
                for i in range(0,len(hops)-1):
                    nx_graph.add_edge(hops[i],hops[i+1])
                # Update the AS path length between 'peer' and 'origin'
                # bgp_lens[peer][origin] = \
                #     min(list(filter(bool,[bgp_lens[peer][origin],len(hops)])))

    print("Grafo NX No Dirigido", nx_graph)
    dgl_graph = dgl.from_networkx(nx_graph)
    print("Grafo DGL NO Dirigido", dgl_graph)

    dgl.save_graphs(f"datasets/ROUTE_COLLECTORS/{name_out_file}.dgl", dgl_graph)

    dgl_graph_loaded = dgl.load_graphs(f"datasets/ROUTE_COLLECTORS/{name_out_file}.dgl")

    return dgl_graph_loaded[0], nx_graph


def download_graph_create_edges_csv(from_time, until_time, collectors, record_type, name_out_file, directed=False):
    """
    Crear archivo edges_X_.csv con la topologia de la red a partir de recolectores.
    """
    
    # Crea el archivo nodes.csv
    f = open(os.getcwd() + "/datasets/DGL_Graph/RouteCollectorsTest/nodes.csv", "w")

    # Agrega los headers
    headers = "src_id,dst_id,Relationship\n"
    f.write(headers)
    f.close()

    # Creamos una instancia de BGPStream
    stream = pybgpstream.BGPStream(
        from_time=from_time, until_time=until_time,
        collectors=collectors,
        record_type=record_type,
    )

    list_edges = []
    seen_edges = set()  # Conjunto para rastrear bordes únicos
    num_rec = 0
    for rec in stream.records():
        if num_rec % 500 == 0:
            print("Record %d" % num_rec)
        num_rec += 1
        for elem in rec:
            # Get the peer ASn
            peer = clean_asn(str(elem.peer_asn))
            # Get the array of ASns in the AS path and remove repeatedly prepended ASns
            hops = [clean_asn(k) for k, g in groupby(elem.fields['as-path'].split(" "))]
            if len(hops) > 1 and hops[0] == peer:
                # Get the origin ASn
                origin = hops[-1]
                # Add new edges to the list
                for i in range(0, len(hops) - 1):
                    edge1 = (hops[i], hops[i+1])
                    edge2 = (hops[i+1], hops[i])
                    
                    if edge1 not in seen_edges:
                        list_edges.append(edge1)
                        seen_edges.add(edge1)
                    
                    if not directed and edge2 not in seen_edges:
                        list_edges.append(edge2)
                        seen_edges.add(edge2) 

    # Limpieza de los bordes y conversión a DataFrame
    list_edges = [(clean_asn(src), clean_asn(dst)) for src, dst in list_edges]
    df_edges = pd.DataFrame(list_edges, columns=["src_id", "dst_id"]) 
    
    # Guarda el archivo edges.csv
    df_edges.to_csv(os.getcwd() + "/datasets/ROUTE_COLLECTORS/" + f"{name_out_file}-edges.csv", index=False)           

    return df_edges

# Ejecución de la función
df = download_graph_create_edges_csv("2022-06-01 00:00:00", "2022-06-01 00:15:00", ["rrc00"], "ribs", "graph-2022-06-rrc00-ribs", directed=False)
print(df)
# dgl_graph_loaded, nx_graph = download_graph_from_bgpstream("2022-06-01 00:00:00", "2022-06-01 00:15:00", ["rrc00"], "ribs","graph-2022-06-rrc00-ribs")
