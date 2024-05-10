#Se requiere la instalación de los siguientes paquetes
#install.packages(c("tidyverse","caret","neuralnet"))
#Carga de paquetes
library(tidyverse)
library(caret)
library(neuralnet)
datos =  iris

#Sseparacion en grupo de entrenamiento y pruebas
muestra = createDataPartition(datos$Species, p=0.8, list = F)
train = datos[muestra,]
test = datos[-muestra,]

#Entranamiento de la red neuronal
red.neuronal= neuralnet(Species ~ Sepal.Length+ Sepal.Width+ Petal.Width, data = train, hidden = c(2,3))
red.neuronal$act.fct
#Graficación de la red neuronal
plot(red.neuronal)
#Aplicar el conjunto de pruebas a la red para predecir la especie
prediccion = predict(red.neuronal, test, type="class")
#Decodificar la columna que contiene el valor maximo
#y por ende la especie de la que se trata
decodificarCol= apply(prediccion,1, which.max)
#Crear una columna nueva con los valores decodificados
codificado = data.frame(decodificarCol)
codificado = mutate(codificado, especie= recode(
  codificado$decodificarCol,"1"="Setosa",
  "2"="Versicolor", "3"="Virginica"
))
test$Especie.Pred = codificado$especie



