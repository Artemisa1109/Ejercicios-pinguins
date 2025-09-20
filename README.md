# 🐧 Ejercicios con el dataset `palmerpenguins` en R

Este repositorio contiene los ejercicios resueltos (Ejercicio 4 y Ejercicio 5) utilizando el dataset `palmerpenguins`, como parte del **Diplomado en Análisis y Visualización de Datos (2025)**.

---

## 📦 Paquetes utilizados

- `tidyverse`: para manipulación de datos (`dplyr`, `ggplot2`, etc.)
- `palmerpenguins`: dataset principal
- `knitr`: para mostrar tablas con `kable()`
- `kableExtra`: (opcional, para HTML o RMarkdown con tablas más estilizadas)

---

## 📁 Archivos incluidos

| Archivo                    | Descripción                                      |
|---------------------------|--------------------------------------------------|
| `EJERCICIO4 resuelto.R`   | Selección de columnas, limpieza y visualización |
| `EJERCICIO5 resuelto.R`   | Filtrados, clasificaciones y análisis por grupo |

---

## 📊 Contenido del análisis

- Limpieza de datos con `drop_na()`
- Creación de nuevas columnas (`mass_category`, `bill_ratio`)
- Agrupaciones por `species`, `sex`, `island`
- Cálculo de estadísticas: media, mediana, conteos
- Visualizaciones: scatterplots, boxplots, histogramas
- Tablas bonitas con `knitr::kable()`

---
## 📸 Visualización en RStudio

Aquí se muestra el entorno de trabajo en RStudio con el gráfico de distribución del largo de pico para pingüinos Adelie en la isla Dream.
<img width="1917" height="959" alt="image" src="https://github.com/user-attachments/assets/c68aaa8e-afb7-493b-a6af-612d42f66f28" />

--

## 🚀 Cómo correr este proyecto

1. Clona este repositorio o descarga los archivos `.R`
2. Abre los scripts en RStudio
3. Asegúrate de tener los paquetes instalados:

```r
install.packages(c("tidyverse", "palmerpenguins", "knitr"))




