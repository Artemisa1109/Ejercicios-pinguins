# EJERCICIO 4

# 1.- Instala el paquete "palmerpenguins"
install.packages("palmerpenguins")

# 2.- Carga el paquete palmerpenguins

library(palmerpenguins)

# 3.- Carga el dataset penguins


data("penguins") 

# 4.- Explora los datos con las funciones str() y summary()

str(penguins)
summary(penguins)

# 5.- Verifica si hay valores na

any(is.na(penguins))

# 6.- Explora los valores nulos
colSums(is.na(penguins)) 

# 7.- Filtra los valores nulos
penguins_limpio <- na.omit(penguins)


# 8. Selecciona las columnas: `species`, `island`, `bill_length_mm`, `bill_depth_mm`, y `flipper_length_mm`.
library(dplyr)

penguins_seleccion <- penguins_limpio %>%
  select(species, island, bill_length_mm, bill_depth_mm, flipper_length_mm)

#Visualización

ggplot(penguins_seleccion, aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  labs(
    title = "Relación entre largo y profundidad del pico",
    x = "Largo del pico (mm)",
    y = "Profundidad del pico (mm)"
  ) +
  theme_minimal()

# 9. Filtra las filas donde la especie sea "Adelie"  y la longitud de la aleta (`flipper_length_mm`) sea mayor a 190 mm.
adelie_altos <- penguins_seleccion %>%
  filter(species == "Adelie", flipper_length_mm > 190)
#Visualización 
ggplot(adelie_altos, aes(x = flipper_length_mm, fill = island)) +
  geom_histogram(binwidth = 2, color = "black") +
  labs(
    title = "Pingüinos Adelie con aletas > 190mm",
    x = "Largo de aleta (mm)",
    y = "Frecuencia"
  ) +
  theme_minimal()


# 10. Ordena el resultado orden ascendente según la longitud del pico (`bill_length_mm`).
adelie_ordenado <- penguins_limpio %>%
  filter(species == "Adelie", flipper_length_mm > 190) %>%
  arrange(bill_length_mm)
adelie_ordenado <- adelie_ordenado %>%
  mutate(pinguino_id = row_number())
#Visualizacion
ggplot(adelie_ordenado, aes(x = factor(pinguino_id), y = bill_length_mm)) +
  geom_col(fill = "skyblue", color = "black") +
  labs(
    title = "Pingüinos Adelie con aletas > 190 mm",
    subtitle = "Ordenados en forma ascendente por longitud del pico",
    x = "Pingüino (ID)",
    y = "Longitud del pico (mm)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_blank(),  # Oculta etiquetas para limpieza visual
        axis.ticks.x = element_blank())


# 11. Calcula el promedio de la longitud del pico (`bill_length_mm`) para los pingüinos "Adelie" de la isla "Dream".

promedio_bill <- penguins_limpio %>%
  filter(species == "Adelie", island == "Dream") %>%
  summarise(promedio_pico = mean(bill_length_mm, na.rm = TRUE))

print(promedio_bill)

#Visualizacion 
ggplot(
  penguins_limpio %>%
    filter(species == "Adelie", island == "Dream"),
  aes(x = bill_length_mm)
) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  geom_vline(aes(xintercept = promedio_bill$promedio_pico), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = "Distribución del largo de pico (Adelie en isla Dream)",
    x = "Largo del pico (mm)",
    y = "Frecuencia"
  ) +
  theme_minimal()
