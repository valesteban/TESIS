import requests
import os
from bs4 import BeautifulSoup
import bz2
import csv

class CAIDARelationshipsDownload:

    def __init__(self):

        # Infor for Dowloading datasets
        self.path_serial = ["https://publicdata.caida.org/datasets/as-relationships/serial-1/","https://publicdata.caida.org/datasets/as-relationships/serial-2/"]
        self.end_filename_serial = [".as-rel.txt.bz2",".as-rel2.txt.bz2"]
        self.dest_folder = ["Serial_1","Serial_2"]
        self.current_path = os.getcwd()

    def download_file(self, folder_name:str,url):
        """
        Descarga un archivo desde una URL y lo guarda en una carpeta destino. 
        """
        
        current_directory = os.getcwd() + "/datasets/CAIDA_AS_Relationships/"+ folder_name
        print(current_directory)
        # Creamos carpeta si no existe
        if not os.path.exists(current_directory):
            os.makedirs(current_directory)

        # Path donde se guardara archivo
        local_filename = os.path.join(current_directory, url.split('/')[-1])
        print(f"LOCAL DIR: {local_filename}")
        with requests.get(url, stream=True) as r:
            r.raise_for_status()
            with open(local_filename, 'wb') as f:
                for chunk in r.iter_content(chunk_size=8192):
                    f.write(chunk)

        return local_filename
    
    def download_caida_files(self,to_dowload:list):
        """
        Descarga todos los archivos que terminan en .as-rel.txt.bz2 desde la URL base.
        """
        for elem in to_dowload:
            # url where all datsets are
            base_url = self.path_serial[elem]
            file_name = self.dest_folder[elem]

            response = requests.get(base_url)
            response.raise_for_status()
            soup = BeautifulSoup(response.text, 'html.parser')
            links = soup.find_all('a')

            for link in links:
                href = link.get('href')
                end_with = self.end_filename_serial[elem]
                
                if href and href.endswith(end_with):   #as-rel2.txt.bz2
                    file_url = base_url + href
                    print(f'Descargando {file_url}')
                    self.download_file(file_name, file_url)

    def decompress_bz2_files(self,source_folder):
        """
        Descomprime todos los archivos .bz2 en un directorio y los guarda en otro directorio.
        
        :param source_folder: Carpeta que contiene los archivos .bz2.
        :param destination_folder: Carpeta donde se guardarán los archivos descomprimidos.
        """
        current_path = self.current_path
        # Recorrer todos los archivos en la carpeta de origen
        print("SOUCE FOLDER",current_path+ source_folder)
        for filename in os.listdir(current_path+ source_folder):
            if filename.endswith(".bz2"):
                print("[FILENAME]",filename)
                source_file = os.path.join(current_path+source_folder, filename)
                destination_file = os.path.join(current_path+source_folder, filename[:-4])  # Remover la extensión .bz2
                
                # Descomprimir el archivo
                print(current_path+source_file)
                with bz2.BZ2File(current_path+source_file, 'rb') as file:
                    print()
                # bz2.BZ2Decompressor(current_path+source_file) 
                # with bz2.BZ2File(current_path+source_file, 'rb') as file:
                #     content = file.read()
                #     with open(current_path+destination_file, 'wb') as out_file:
                #         out_file.write(content)
                
                # print(f"Archivo descomprimido: {filename} -> {current_path+destination_file}")


    def create_file(self,file_path, name_new_file):

        # Lista para almacenar las filas del CSV
        rows = []
        current_directory = os.getcwd()

        file_path = os.path.join(current_directory,file_path,name_new_file)

        # print(file_path+name_new_file)
        with bz2.open(file_path, "rb") as f:
            data = f.read()
            lines = data.decode().splitlines()
            
        #     for line in lines:

        #         # Ignorar líneas de comentarios
        #         if line.startswith("#"):
        #             continue
                
        #         # Dividir la línea en columnas
        #         columns = line.split("|")

        #         src = int(columns[0])
        #         dst = int(columns[1])
        #         relationship = int(columns[2])

        #         # Agregar una fila a la lista
        #         rows.append({"src_id": src, "dst_id": dst, "Relationship": relationship})
        # csv_file = file_path+"Files_EdgeList/"+name_new_file
        # with open(csv_file, mode='w', newline='') as csv_file:
        #     fieldnames = ["src_id", "dst_id", "Relationship"]
        #     writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
            
        #     # Escribir el encabezado
        #     writer.writeheader()
            
        #     # Escribir las filas
        #     writer.writerows(rows)

        #     print(f"Archivo CSV creado en: {csv_file}")
                
                
    def create_edgelist_from_CAIDA_FILES(self):
        current_directory = os.getcwd()
        
        files_serial_1 = os.listdir(current_directory +"/datasets/CAIDA_AS_Relationships/Serial_1/")
        files_serial_2 = os.listdir(current_directory +"/datasets/CAIDA_AS_Relationships/Serial_2/")

        print(f"[CANTIDAD SERIAL 1] {len(files_serial_1)}")
        print(f"[CANTIDAD SERIAL 2] {len(files_serial_2)}")
        i = 0
        for path1,path2 in zip(files_serial_1,files_serial_2):
            i = i+1
            # print(path1)
            # print(path2)
            parts1 = path1.split('.', 1)
            parts2 = path2.split('.', 1)
        
            graph1 = self.create_file("/datasets/CAIDA_AS_Relationships/Serial_1/", path1)
            graph2 = self.create_file("/datasets/CAIDA_AS_Relationships/Serial_2/", path2)
        
        
    



caidaRelationships = CAIDARelationshipsDownload()
to_download = {
    "serial_1": [0],
    "serial_2":[1],
    "both":[0,1]
}

# Dowload files from CAIDA online Dataset
# caidaRelationships.download_caida_files(to_download["serial_2"])

# Create csv edgelist from datset 
# CAIDARelationshipsDownload.create_edgelist_from_CAIDA_FILES()
caidaRelationships.decompress_bz2_files("/datasets/CAIDA_AS_Relationships/Serial_2/")
