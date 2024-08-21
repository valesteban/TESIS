import requests
import os
from bs4 import BeautifulSoup

base_url = "https://archive.routeviews.org/oix-route-views/2022.06/"
download_folder = os.path.join(os.getcwd(), "datasets", "RouteViews", "Download")

# Asegurarse de que la carpeta de destino exista
os.makedirs(download_folder, exist_ok=True)

response = requests.get(base_url)
response.raise_for_status()
soup = BeautifulSoup(response.text, 'html.parser')
links = soup.find_all('a')

for link in links:
    href = link.get('href')
    if href.endswith('.bz2'):  # Filtrar solo los archivos .bz2 si es necesario
        file_url = base_url + href
        print(f'Descargando {file_url}')
        
        # Crear la ruta completa del archivo donde se va a guardar
        dst_file = os.path.join(download_folder, href)
        
        # Descargar y guardar el archivo
        with requests.get(file_url, stream=True) as r:
            r.raise_for_status()
            with open(dst_file, 'wb') as f:
                for chunk in r.iter_content(chunk_size=8192):
                    f.write(chunk)
        print(f'Archivo guardado en {dst_file}')
