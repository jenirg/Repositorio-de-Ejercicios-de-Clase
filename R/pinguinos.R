library(palmerpenguins)
library(tidyverse)
library(caret)
library(neuralnet)

# Cargar datos
datos = na.omit(penguins)  # Remover filas con NA

# Preparar datos
muestra = createDataPartition(datos$species, p=0.8, list=FALSE)
train = datos[muestra,]
test = datos[-muestra,]

# Configurar la red neuronal
red.neuronal = neuralnet(species ~ bill_length_mm + bill_depth_mm + flipper_length_mm + body_mass_g, data = train, hidden = c(2,3))
red.neuronal$act.fct
plot(red.neuronal)

# Aplicar el conjunto de pruebas de la red para predecir
prediccion = predict(red.neuronal, test, type="class")

# Decodificar por la especie
decodificarCol = apply(prediccion, 1, which.max)

# Crear una columna nueva con los valores decodificados
codificado = data_frame(decodificarCol)
codificado = mutate(codificado, especie=recode(
  codificado$decodificarCol, "1"="Adelie", "2"="Chinstrap", "3"="Gentoo"
))

test$Especie.Pred = codificado$especie

