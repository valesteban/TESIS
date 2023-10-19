## Standard libraries
import os
import json
import math
import numpy as np
import time
from pytorch_lightning.utilities.types import EVAL_DATALOADERS

import torch
import torch.nn.functional as F
import torchvision.datasets as datasets
import torchvision.transforms as transforms
from torch import nn, optim
from torch.utils.data import DataLoader
from tqdm import tqdm
from torch.utils.data import random_split
import pytorch_lightning as pl
import torchmetrics
from torchmetrics import Metric
import torch_geometric.nn as geom_nn

#importamos las clases que creamos
from model import MyModel

gnn_layer_by_name = {
    "GAT": geom_nn.GATConv,
    "GraphConv": geom_nn.GraphConv
}

#setiamos devuce
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")

model = MyModel(input_size=784, output_size=10, hidden_layers=[512, 256, 128], drop_p=0.5, lr=0.001, gpu=True, batch_size=64, epochs=5, print_every=40)

