# EJERCICIO 5
library(palmerpenguins)
library(tidyverse)
library(dplyr)
library(palmerpenguins)
library(tidyverse)
library(knitr) 
library(kableExtra)

data(penguins)

# Recuerda que es tu decisión si quieres remover los nulos del data frame
# penguins <- drop_na(penguins)
penguins <- drop_na(penguins)

# 1. Selecciona las columnas species, island, y flipper_length_mm.
# 2. Filtra los pingüinos de la isla "Biscoe".
# 3. Filtra para obtener solo aquellos con un largo de aleta mayor a 200 mm.
# 4. Muestra los primeros 10 resultados.

penguins %>%
  select(species, island, flipper_length_mm) %>%
  filter(island == "Biscoe", flipper_length_mm > 200) %>%
  head(10)




# 1. Crea una nueva columna llamada "mass_category" que clasifique a los pingüinos
#    como "small" si pesan menos de 3000 gramos, y "large" si pesan 3000 gramos o más.
# 2. Filtra para incluir solo aquellos pingüinos que son de la especie "Gentoo".
# 3. Selecciona las columnas species, body_mass_g, y mass_category.
# 4. Ordena los resultados por peso corporal en orden ascendente.

gentoo_mass <- penguins %>%
  mutate(mass_category = if_else(body_mass_g < 3000, "small", "large")) %>%
  filter(species == "Gentoo") %>%
  select(species, body_mass_g, mass_category) %>%
  arrange(body_mass_g)

kable(
  gentoo_mass,
  caption = "Pingüinos Gentoo clasificados por categoría de masa (ordenados por peso)",
  digits = 0
)


# 1. Filtra los datos para obtener solo los pingüinos de la especie "Adelie".
# 2. Dentro de los pingüinos "Adelie", filtra aquellos que pesan más de 3500 gramos.
# 3. Selecciona las columnas species, island, body_mass_g y sex.
# 4. Obtén el promedio del peso corporal por isla y sexo.
# 5. Ordena el resultado por el peso promedio en orden descendente.

# Filtrado, agrupamiento y ordenamiento
adelie_pesados <- penguins %>%
  filter(species == "Adelie", body_mass_g > 3500) %>%
  select(species, island, body_mass_g, sex) %>%
  group_by(island, sex) %>%
  summarise(promedio_peso = mean(body_mass_g, na.rm = TRUE), .groups = "drop") %>%
  arrange(desc(promedio_peso))

# Mostrar tabla bonita en consola
kable(adelie_pesados, caption = "Promedio de peso corporal (>3500g) en pingüinos Adelie por isla y sexo") 


# 1. Crea una nueva variable "bill_ratio" que sea la divsión entre la longitud del pico (bill_length_mm)
#    y la profundidad del pico (bill_depth_mm).
# 2. Filtra los datos para incluir solo los pingüinos con una "bill_ratio" mayor a 2.
# 3. Agrupa los datos por species y sex.
# 4. Calcula la mediana de "bill_ratio" y el número de muestras para cada grupo.
# 5. Muestra solo las especies y sexos con al menos 10 observaciones en el grupo

penguins_ratio <- penguins %>%
  mutate(bill_ratio = bill_length_mm / bill_depth_mm)

penguins_filtrados <- penguins_ratio %>%
  filter(bill_ratio > 2)

resumen_ratio <- penguins_filtrados %>%
  group_by(species, sex) %>%
  summarise(
    mediana_ratio = median(bill_ratio, na.rm = TRUE),
    conteo = n(),
    .groups = "drop"
  )
resumen_filtrado <- resumen_ratio %>%
  filter(conteo >= 10)

kable(
  resumen_filtrado,
  caption = "Mediana de 'bill_ratio' (>2) por especie y sexo (mín. 10 observaciones)",
  digits = 2
)
