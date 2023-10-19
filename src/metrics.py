## Standard libraries
import os
import json
import math
from typing import Any, Callable, Sequence
import numpy as np
import time
from pytorch_lightning.utilities.types import EVAL_DATALOADERS

import torch
from torch.nn import Module
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


class MyAcc(Metric):
    def __init__(self, **kwargs: Any) -> None:
        super().__init__(**kwargs)

    def update(self, preds: torch.Tensor, target: torch.Tensor) -> None:
        preds = torch.argmax(preds, dim=1)
        self.correct = torch.sum(preds == target)
        self.total = len(target)

    def compute(self) -> torch.Tensor:
        return self.correct.float() / self.total