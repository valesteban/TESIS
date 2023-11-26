import os

os.environ["DGLBACKEND"] = "pytorch"
import dgl
import dgl.function as fn
import torch
import torch.nn as nn
import torch.nn.functional as F


"""
    SimpleMessagePassingLayer

    Nueva representación del nodo es son la suma de los stributos de sus nodos vecinos
"""
class SimpleMessagePassingLayer(nn.Module):
  def __init__(self,in_feat, out_feat):
    super(SimpleMessagePassingLayer,self).__init__()
    self.linear = nn.Linear(in_feat, out_feat)

  def forward(self, g, h):
      """Forward computation

      Parameters
      ----------
      g : Graph
          The input graph.
      h : Tensor
          The input node feature.
      """
      with g.local_scope():
        g.ndata["h"] = h
        g.update_all(
            message_func=fn.copy_u('h', 'm'), #copia los features de los nodos (h) para ser enviados (copia en m)
            reduce_func=fn.sum('m', 'h_N'))  #suma todos los "m" en h_n
        h_N = g.ndata['h_N']
        return self.linear(h_N)

class Model(nn.Module):
    def __init__(self, in_feats, out_feats):
        super(Model, self).__init__()
        self.gnn1 = SimpleMessagePassingLayer()

    def forward(self, g, h):
        h = self.gnn(g, h)
        return h
    
"""
    MPUnoLayer

    Va a pasarle la suma 1 por cada vecino
"""
class MPUnoLayer(nn.Module):
 
  def __init__(self ):
    super(MPUnoLayer, self).__init__()
    self.linear = nn.Linear(1, 1)

  def forward(self, g):
    with g.local_scope():
        g.ndata["h"] = torch.ones((g.num_nodes(), 1))  # Usar torch.ones para inicializar los nodos con el valor 1
        g.update_all(
            message_func=fn.copy_u('h', 'm'),  # Copia los features de los nodos (h) para ser enviados (copia en m)
            reduce_func=fn.sum('m', 'h_N'))  # Suma todos los "m" en h_n
        h_N = g.ndata['h_N']
        return  self.linear(h_N)

class ModelUno(nn.Module):
    def __init__(self):
        super(ModelUno, self).__init__()  # Corregir el nombre de la clase
        self.gnn = MPUnoLayer()

    def forward(self, g):
        h = self.gnn(g)
        return h


"""
PENSAMIENTOS
- Podria hacer algo tal q la funcion de activacion sea el step y de ahi va suman , q el mensaje sea 1 o 0 0 algo asi
"""