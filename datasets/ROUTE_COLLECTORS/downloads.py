import pybgpstream
import networkx as nx
import dgl
from collections import defaultdict
from itertools import groupby
import os
import numpy as np
import pandas as pd

    
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
    

    #FIXME: Asegurarse que e sta bien cosntruido , hay un error igual
    # Define the path for the CSV files
    base_path = os.getcwd() + "/datasets/ROUTE_COLLECTORS/Downloads/"
    edges_path = os.path.join(base_path, f"{name_out_file}-edges.csv")

    # Creamos una instancia de BGPStream
    stream = pybgpstream.BGPStream(
        from_time=from_time, until_time=until_time,
        collectors=collectors,
        record_type=record_type,
    )


    as_topology = set()
    rib_entries = 0

    # Process data
    for elem in stream:
        rib_entries += 1
        if rib_entries % 5000 == 0:
            print("Rib entries processed:", rib_entries)
        # get the AS path
        path = elem.fields['as-path']
        # get the list of ASes in the path
        ases = path.split(" ")
        for i in range(0, len(ases)-1):
            # avoid multiple prepended ASes
            as_1 = ases[i]

            if "{" in ases[i+1]:
                as_2 = ases[i+1].strip('{}')
                as_2 = as_2.split(',')
                for asn in as_2:
                    if as_1 != asn:
                        as_topology.add(tuple(sorted([as_1,asn])))
            else:
                as_2 =  ases[i+1] 
            
                if ases[i] != ases[i+1]:
                    as_topology.add(tuple(sorted([as_1,as_2])))

    # Output results
    print("Processed", rib_entries, "rib entries")
    print("Found", len(as_topology), "AS adjacencies")

    # Convert the set of AS adjacencies to a DataFrame
    df_edges = pd.DataFrame(list(as_topology), columns=["src_id", "dst_id"])

    # Save the edges DataFrame to a CSV file
    df_edges.to_csv(edges_path, index=False)
    print(f"Edges saved to {edges_path}")

    return df_edges


# Ejecución de la función
df = download_graph_create_edges_csv("2022-06-01 00:00:00", "2022-06-01 00:15:00", ["rrc00"], "ribs", "graph-2022-06-rrc00-ribs", directed=False)
print(df)
# dgl_graph_loaded, nx_graph = download_graph_from_bgpstream("2022-06-01 00:00:00", "2022-06-01 00:15:00", ["rrc00"], "ribs","graph-2022-06-rrc00-ribs")


#TODO: HAcer que se fuardde el grado de transito de cada ASA en un archivo CSV