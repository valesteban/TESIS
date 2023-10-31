

Clase que hereda de InMemoryDataset, debe llevar los siguientes metodos:

 * def raw_file_names(self): Este método debe devolver una lista de nombres de archivos que se encuentran en el directorio raw_dir (donde se supone que se almacenan los datos brutos) y que son necesarios para evitar que los datos se vuelvan a descargar. 
 * def processed_file_names(self): Similar a raw_file_names, este método debe devolver una lista de nombres de archivos que se encuentran en el directorio processed_dir (donde se almacenan los datos procesados) y que son necesarios para evitar que los datos se vuelvan a procesar. En este caso, el método processed_file_names devuelve una lista que contiene el nombre de archivo 'custom_cora_data.pt'. Esto significa que el conjunto de datos personalizado verificará si este archivo existe en el directorio de datos procesados antes de intentar procesar los datos nuevamente.
 * def download(self): Este método es responsable de descargar los datos brutos (si es necesario) desde una fuente externa y almacenarlos en el directorio raw_dir. 
 * def process(self): e utiliza para procesar los datos brutos 



 Cuando creo una instancia de una clase que hereda de InMemoryDataset

 ```python
from torch_geometric.data import InMemoryDataset, Data
from torch_geometric.datasets import Planetoid
from torch_geometric.transforms import NormalizeFeatures
import os

"""
InMemoriDataset should be used if the whole dataset fits into CPU memory.
    - Name        cora()
    - nodes      2.708
    - edges      10.556
    - features   1433
    - classes    7
"""
class CustomCoraDataset(InMemoryDataset):
    def __init__(self, root, transform=None, pre_transform=None):
        super().__init__(root, transform, pre_transform)
        self.data, self.slices = torch.load(self.processed_paths[0])

    @property
    def raw_file_names(self):
        ...

    @property
    def processed_file_names(self):
        ...

    def download(self):
        ...

    def process(self,root):
        ....
        return torch.save((data, slices), self.processed_paths[0])


dataset = CustomCoraDataset("data/Planetoid")

```


Orden sucesos:
1. super().__init__(root, transform, pre_transform): Guarda los atributos de la clase InMEmory como el root, transform y esas cosas.
2. def raw_files_names(self): Devuelve una lista con los nombres de los archivos que se encuentran en la carpeta raw y los guarda en self.raw_files
3. def download(self): Descarga los archivos [si esq no estan en raw_files]
4. def process_file_names(self): Devuelve una lista con los nombres de los archivos que se encuentran en la carpeta processed y los guarda en self.processed_files
5. def process(self): Procesa los archivos de la lista self.processed_files y los guarda en self.processed_paths con la linea         return torch.save((data, slices), self.processed_paths[0])
5. self. data, self.slices = torch.load(self.processed_paths[0]): Carga los datos procesados desde el archivo procesado y los guarda en los atributos data y slices respectivamente.