import torch
import torch.nn.functional as F
import torchvision.datasets as datasets
import torchvision.transforms as transforms
from torch import nn, optim
from torch.utils.data import DataLoader
from torch.utils.data import random_split
import pytorch_lightning as pl


class MnistDataModule(pl.LightningDataModule):
    """
    Esta clase implementa un módulo de datos PyTorch Lightning para el conjunto de datos MNIST.
    Proporciona métodos para cargar y preparar los datos de entrenamiento, validación y prueba.
    """
    def __init__(self, data_dir, batch_size, num_workers):
        """
        Inicializa el objeto MnistDataModule.

        Args:
            data_dir (str): Directorio donde se almacenarán o cargarán los datos MNIST.
            batch_size (int): Tamaño del lote utilizado para cargar datos.
            num_workers (int): Número de trabajadores para cargar datos en paralelo.
        """
        super().__init__()
        self.data_dir = data_dir
        self.batch_size = batch_size
        self.num_workers = num_workers

    def prepare_data(self):
        """
        Descarga los datos MNIST si no están disponibles en el directorio especificado.
        Este método se llama solo una vez cuando se inicia el entrenamiento.
        """
        datasets.MNIST(self.data_dir, train=True, download=True)
        datasets.MNIST(self.data_dir, train=False, download=True)

    def setup(self, stage):
        """
        Configura los conjuntos de datos de entrenamiento, validación y prueba.

        Args:
            stage (str): 'fit' para entrenamiento, 'val' para validación, 'test' para prueba.
        """
        entire_dataset = datasets.MNIST(
            root=self.data_dir,
            train=True,
            transform=transforms.ToTensor(),
            download=False,
        )
        self.train_ds, self.val_ds = random_split(entire_dataset, [50000, 10000])
        self.test_ds = datasets.MNIST(
            root=self.data_dir,
            train=False,
            transform=transforms.ToTensor(),
            download=False,
        )

    def train_dataloader(self):
        """
        Devuelve un DataLoader para el conjunto de datos de entrenamiento.

        Returns:
            DataLoader: DataLoader para el conjunto de datos de entrenamiento.
        """
        return DataLoader(
            self.train_ds,
            batch_size=self.batch_size,
            num_workers=self.num_workers,
            shuffle=True,
        )

    def val_dataloader(self):
        """
        Devuelve un DataLoader para el conjunto de datos de validación.

        Returns:
            DataLoader: DataLoader para el conjunto de datos de validación.
        """
        return DataLoader(
            self.val_ds,
            batch_size=self.batch_size,
            num_workers=self.num_workers,
            shuffle=False,
        )

    def test_dataloader(self):
        """
        Devuelve un DataLoader para el conjunto de datos de prueba.

        Returns:
            DataLoader: DataLoader para el conjunto de datos de prueba.
        """
        return DataLoader(
            self.test_ds,
            batch_size=self.batch_size,
            num_workers=self.num_workers,
            shuffle=False,
        )
    

class DataSetSA(pl.LightningDataModule):
    """
    Dataset correspondiente a información de Sistemas Autonomos 
    """
    def __init__(self, data_dir, batch_size, num_workers):
        super().__init__()

    def prepare_data(self):
        return None
        
    def setup(self, stage):
        """
        Descarga dataset, se hace una particion en train, val y test
        """
        return None

    def train_dataloader(self):
        """
        Retorna Dataloader para entrenamiento
        """
        return None

    def val_dataloader(self):
        """
        Retorna Dataloader para validacion
        """
        return None

    def test_dataloader(self):
        """
        Retorna Dataloader para test
        """
        return None