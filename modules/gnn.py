import dgl
import torch

class GNN:
    def __init__(self, debug=False):
        self.debug = debug
        self.graph = None

        # Grafo DGL que contiene los training edges
        self.train_graph = None

        # Grafo DGL que contiene los test edges
        self.test_graph = None

        self.nx_graph = None
        self.dgl_graph = None
        
    def load_dataset(self, data_path, force_reload=False):
    
        self.dgl_graph = dgl.data.CSVDataset(data_path, force_reload=force_reload)[0]
        if self.debug:
            print(self.graph)
        
        

      # self.dgl_graph = dgl.data.CSVDataset("drive/MyDrive/TESIS/Datasets/gnn-internet-data/My_data_no_eliminate", force_reload=force_reload)[0]  # TODO: ver/internat hacer esto pero sin elimminar los nodos que no tienen casi degreee

    def split_dtaset_v2(self):
      """
      Divide los edges en tres conjuntos: training, validación y test.
      #FIXME: el edge (1,2) es equivalente a (2,1)), es importante asegurarse de que ambos casos se asignen al mismo conjunto (entrenamiento, validación o prueba). La implementación actual, sin embargo, no garantiza esto.
      """
      number_of_edges = self.dgl_graph.num_edges()
      u, v = self.dgl_graph.edges()

      # Ordenar los nodos en cada edge
      edges = torch.stack([torch.min(u, v), torch.max(u, v)], dim=1)
      
      # Crear un diccionario para almacenar las asignaciones de los edges
      edge_dict = {}
      
      # Generar las máscaras
      train_mask = torch.zeros(number_of_edges, dtype=torch.bool)
      val_mask = torch.zeros(number_of_edges, dtype=torch.bool)
      test_mask = torch.zeros(number_of_edges, dtype=torch.bool)
      
      for i in range(number_of_edges):
          edge = tuple(edges[i].tolist())
          if edge not in edge_dict:
              # Asignar el edge a un conjunto basado en una muestra aleatoria
              rand_value = torch.rand(1).item()
              if rand_value < 0.6:
                  edge_dict[edge] = 'train'
                  train_mask[i] = True
              elif rand_value < 0.8:
                  edge_dict[edge] = 'val'
                  val_mask[i] = True
              else:
                  edge_dict[edge] = 'test'
                  test_mask[i] = True
          else:
              # Asignar el edge al mismo conjunto que su par
              if edge_dict[edge] == 'train':
                  train_mask[i] = True
              elif edge_dict[edge] == 'val':
                  val_mask[i] = True
              else:
                  test_mask[i] = True

      self.train_mask = train_mask
      self.val_mask = val_mask
      self.test_mask = test_mask

      if self.debug:
          print(f"Training edges: {self.train_mask.sum().item()}")
          print(f"Validation edges: {self.val_mask.sum().item()}")
          print(f"Test edges: {self.test_mask.sum().item()}")

    def split_dataset(self):
      """
        Divide los edges en tres conjuntos: training, validación y test.
      """
      
      number_of_edges = self.dgl_graph.num_edges()

      # Crear una máscara para entrenamiento con un 60% de los edges
      self.train_mask = torch.zeros(number_of_edges, dtype=torch.bool).bernoulli(0.6)

      # De los edges restantes, crear una máscara para validación con un 50% de los edges restantes
      remaining_edges = ~self.train_mask
      self.val_mask = torch.zeros(number_of_edges, dtype=torch.bool).bernoulli(0.5) & remaining_edges

      # El resto de los edges serán para prueba
      self.test_mask = ~(self.train_mask | self.val_mask)

      if self.debug:
          print(f"Training edges: {self.train_mask.sum().item()}")
          print(f"Validation edges: {self.val_mask.sum().item()}")
          print(f"Test edges: {self.test_mask.sum().item()}")

      #TODO: investigar usar from sklearn.model_selection import train_test_split  

    def remove_ndata(self):
      self.ndata = self.dgl_graph.ndata.pop('feat')


