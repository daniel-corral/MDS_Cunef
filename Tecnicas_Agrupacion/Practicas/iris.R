data("iris")
library(ggplot2)
library(tidyverse)
library(corrplot)

summary(iris)

iris <- rename(iris, "longitud_sepalo" = "Sepal.Length", "ancho_sepalo" = "Sepal.Width", "longitud_petalo" = "Petal.Length", "ancho_petalo" = "Petal.Width", "Especies" = "Species")

tapply(iris$longitud_petalo,iris$Especies,summary)#longitud y ancho del petalo menor en setosa y mayor en virginica
tapply(iris$ancho_petalo,iris$Especies,summary) 
tapply(iris$longitud_sepalo,iris$Especies,summary)#longitud sepalo menor en setosa, parecidos en versicolor y virginica pero mayor en virginica
tapply(iris$ancho_sepalo,iris$Especies,summary)#ancho del sepalo menor en la versicolor y mayor en la setosa

#Grafica para pétalo
ggplot(iris, aes(x = longitud_petalo, y = ancho_petalo)) + 
  geom_point(aes(color = Especies), size = 3 ) + 
  labs(title = 'Gráfico 1. Exploración de los pétalos según especies', x = 'Longitud pétalos', y = "Ancho pétalos")

#Grafica para sepalo
ggplot(iris, aes(longitud_sepalo, ancho_sepalo)) + 
  geom_point(aes(color = Especies), size = 3) + 
  labs(title = 'Gráfico 2. Exploración de los sépalos según especies', x = 'Longitud sépalos', y = "Ancho sépalos") 

#rangos
max(iris$longitud_sepalo) - min(iris$longitud_sepalo) # Estas medidas nos dicen que tan distintas o similares tienden a ser las observaciones respecto a un valor particular. Generalmente este valor se refiere a alguna medida de tendencia central.
#3.6
max(iris$ancho_sepalo) - min(iris$ancho_sepalo)
#2.4
max(iris$longitud_petalo) - min(iris$longitud_petalo)
#5.9
max(iris$ancho_petalo) - min(iris$ancho_petalo)
#2.4

cov(iris[,1:4]) #matriz de covarianzas Si dos variables son independientes entre s ́ı, su covarianza es cero.
corr <- cor(iris[,1:4]) #matriz correlacion. La correlacio ́n lineal var ́ıa entre −1 a 1. Un valor cercano a 1 indica que mientras una variable crece la otra tambie ́n lo hace en una proporcio ́n lineal. Un valor cercano a -1 indica una relacio ́n inversa (una crece la otra decrece). Si la correlacio ́n es cercana a cero tenemos independencia lineal. Ojo que eso no implica que no pueda haber una relacio ́n no-lineal entre las variables.

corrplot(corr, method = "number", type = "lower", main = "Gráfico de correlaciones", tl.srt = 45)

hist(iris$longitud_sepalo, main = 'Histograma longitud sépalos', xlab = 'Longitud sépalos', ylab = "Frecuencia" ) #comportamiento normal, entorno a la media la mayor parte de los valores
hist(iris$ancho_sepalo, main = 'Histograma ancho sépalos', xlab = 'Ancho sépalos', ylab = "Frecuencia" ) #comportamiento normal
hist(iris$longitud_petalo, main = 'Histograma longitud pétalos', xlab = 'Longitud pétalos', ylab = "Frecuencia" ) #no normal
hist(iris$ancho_petalo, main = 'Histograma ancho pétalos', xlab = 'Ancho pétalos', ylab = "Frecuencia" ) #no normal

boxplot(x = iris[,1:4],main = "Boxplot Iris")

pairs(iris[,1:4],pch = as.numeric(iris$Especies),col = iris$Especies) #Todos los pares de las 4 variables de irsi usando un color y un cara ́cter distinto para cada especie:
