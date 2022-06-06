## PARIO data management

### :es: Este repositorio contiene R scripts para importar y analizar los datos del equipo PARIO para análisis de distribución de tamaño de partículas. Work in progress. 

* Los datos usados son un ejemplo, siendo los excel que entrega PARIO sin modificación
* El naming de los archivos es al estilo del Laboratorio de Biofísica de Suelos
* Se reciben comentarios para mejorar su uso a biofisica@ing.puc.cl y seaceved@uc.cl

| Script | Objetivo |
| ------------- | ------------- |
| pario_data_analysis.R  | Lee todos los scripts desde el 00 en orden |
| cute_animation.R  | Just for fun |
| scripts/00_librerias.R  | Cargar las librerias necesarias  |
| scripts/01_importar_excel.R  | Usando readxl se leen las columnas con datos  |
| scripts/02_limpiar_datos.R  | Las curvas PSD (diameter vs cumulative fraction) quedan en formato largo y fracciones (sand, silt and clay) en ancho  |
| scripts/03_analisis_clase_textural.R  | Define la clase textural según USDA  |
| scripts/04_triangulo_textura.R  | Grafica las fracciones (sand, silt and clay) en el triangulo USDA  |
| scripts/05_plot_datos_medidos.R  | Grafica temperatura, presión y ajuste  |
| scripts/06_psd.R  | Grafica las curvas PSD (diameter vs cumulative fraction)  |

### Figures
#### Triángulo - Triangle

![textural_triangle](https://github.com/Saryace/pario_datamanagement/blob/master/figures/textural_triangle.png?raw=true)
#### Mediciones ISP - ISP measurements

![measured_plot](https://github.com/Saryace/pario_datamanagement/blob/master/figures/measured_plot.png?raw=true)
#### Curvas PSD - PSD curves

![psd_plot](https://github.com/Saryace/pario_datamanagement/blob/master/figures/psd_plot.png?raw=true)
#### :heart:Curvas PSD - PSD curves:heart:

[!cute_gif](https://github.com/Saryace/pario_datamanagement/blob/master/figures/cute_psd.gif?raw=true)

### :es: No olvides seguir al Laboratorio Biofisica de Suelos PUC en sus redes, ni leer el paper del PARIO de nuestro grupo de investigación

1. [Testing the integral suspension pressure method for soil particle size analysis across a range of soil organic matter contents](https://doi.org/10.31545/intagr/144387)
2. [Website laboratorio](https://biofisica.ing.puc.cl)
3. [Twitter](https://twitter.com/soilbiophysics1)
4. [Instagram](https://www.instagram.com/soilbiophysicslab)

### :us: This repository contains R scripts to import and analyze PARIO data for particle size distribution analysis. Work in progress.

* Excel files provided by PARIO without modification are used as example
* Naming of files fits with the style of the Soil Biophysics Laboratory.
* Comments and suggestions are welcome at biofisica@ing.puc.cl and seaceved@uc.cl.

| Script | Objetive |
| ------------- | ------------- |
| pario_data_analysis.R  | Read all scripts from 00 onwards in order |
| cute_animation.R  | Just for fun |
| scripts/00_librerias.R  | Load required libraries  |
| scripts/01_importar_excel.R  | Use readxl to read data  |
| scripts/02_limpiar_datos.R  | PSD curves (diameter vs cumulative fraction) are in long and fractions (sand, silt and clay) in wide format  |
| scripts/03_analysis_textural_class.R | Describe the textural class according to USDA |
| scripts/04_triangle_texture.R | Plot fractions (sand, silt and clay) using the USDA triangle |
| scripts/05_plot_measured_data.R | Plot temperature, pressure and fitting |
| scripts/06_psd.R | Plot PSD (diameter vs cumulative fraction) curves |

### :us: Don't forget to follow Laboratorio Biofisica de Suelos in Twitter and Instagram and to read the PARIO paper of our research group

1. [Testing the integral suspension pressure method for soil particle size analysis across a range of soil organic matter contents](https://doi.org/10.31545/intagr/144387)
2. [Website laboratorio](https://biofisica.ing.puc.cl)
3. [Twitter](https://twitter.com/soilbiophysics1)
4. [Instagram](https://www.instagram.com/soilbiophysicslab)

