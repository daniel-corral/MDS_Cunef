# Individual work with  DATA FRAME

#1. Creating a new data frame 
edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25) #se asignan valores a la variable edad
tiempo <- c(14.21, 10.36, 11.89, 13.81, 12.03, 10.99, 12.48, 13.37, 12.29, 11.92) #se asignan valores a la variable tiempo
sexo <- c("M","H","H","M","M","H","M","M","H","H") #se asignan valores a la variable sexo
misDatos <- data.frame(edad,tiempo,sexo) #se crea una lista bidimensional llamada misDatos con las variabes edad, sexo y tiempo
misDatos #el dataframe se encuentra en Data (no en values)
rm(list=c("edad", "tiempo", "sexo")) #como tenemos todos los datos en misDatos, podemos borrar de esta forma los valores y así ahorrar espacio
str(misDatos)    # Estructura de 'misDatos'
names(misDatos)  # Nombre de las variables contenidas en 'misDatos'
#2. Checking variables and data within the data frame
misDatos[3:6,] #de esta forma podemos ver los datos de los alumnos 3, 4, 5 y 6
misDatos[,1] #muestra la columna 1 que se llama edad
misDatos$edad #de esta forma también se muestra la columna que se llama edad 
misDatos[,"edad"] #y esta es otra forma de que se muestre la columna llamada "edad" y que se corresponde con la columna número 1
#
#3. Some operations (son distintas formas de ejecutar la media de la columna 1 llamada "edad")
mean(misDatos[,1]) 
mean(misDatos$edad)
mean(misDatos[,"edad"])
mean(misDatos[["edad"]])
#4. Functions ATTACH and DETACH
attach(misDatos) #enmascarar, sirve para que al ejecutar las siguientes instrucciones recurra directamente a las variables referentes a misDatos y así evitamos tener que escrubir cada vez misDatos
table(tiempo) #muestra en una tabla las frecencias absolutas de tiempo
table(sexo) #muestra en una tabla las frecencias absolutas de sexo
table(edad) #muestra en una tabla las frecencias absolutas de edad
table(sexo,edad) #muestra en una tabla las freciencias absolutas de edad y sexo 
mean(edad[sexo=="M"]) #la media de la edad de las mujeres
mean(edad[sexo=="H"]) #la media de la edad de los hombres
detach(misDatos) #de esta forma desenmascaramos, a partir de ahora tendremos que especificar a qué datos nos referimos en las instrucciones

#5. New dataframe 'currencies' store some currencies
currencies <- data.frame(amount=c(1,2),currency=c("Dolar", "Euro"), exchange=c(1, 0.9)) #se crea otro dataframe llamado "currencies" con las variables cantidad, moneda y tipo de cambio
currencies
Countries<-data.frame(names=c("UK","Spain","Russia"),currency=c("Pound", "Euro", "Rublo"), exchange=c(1.2, 1, 0.02)) #se crea otro dataframe llamado "countries" con las variables nombres de paises, moneda y tipo de cambio  
attach(currencies) #de esta forma las siguientes instrucciones utilizaran las variables integradas en el dataframe especificado, es decir, del llamado "currencies" 
currency #con el attach, al preguntar por "currency", nos muestra directamente la variable integrada en el dataframe "currencies"        
attach(Countries)  #  'detach' to  'currencies' in common fields, es decir a partir de ahora el dataframe del que se cogeran los datos es el de "countries"
currency          # from Countries y no from currencies 
exchange           
amount   # from currencies ya que esta variable no aparece en el dataframe prioritario "countries" pero sí en el dataframe "currencies" que continua "attach

detach(Countries)  # pero continua attach "currencies". a partir de ahora deberemos especificar cuando nos refiramos a las variables de este dataframe
currency          # from currencies, por eso al preguntar por currency continua refiriendo a los datos de la variable que se encuentra en el dataframe "currencies" que continúa "attach"
detach(currencies) # 
#currency          # error. tras las indicaciones de detach, ya no podemos preguntar por currencies de esta forma mas rapida, a partir de ahora debemos especificar a que variable nos referimos, como por ejemplo "Countries$currency"

#6. In short
longitud<-c(12,10,11,13,14,17) #se asignan valores a la variable longitud
medidas<-data.frame(longitud=c(6,4,7), peso=c(240,326,315), diametro=c(8,9,9)) #se crea un dataframe llamado "medidass" con las variables longitud, peso y diametro
mean(longitud) #cuando no especificamos el dataframe, se utilizan los datos de la variable a la que le hemos dado unos valores y almacenado en "Values"
mean(medidas$longitud) #refiere a la media de la variable longitud situada en el dataframe "medidas"
mean(medidas$peso) #refiere a la media de la variable peso situada en el dataframe "medidas"
mean(medidas$diametro) #refiere a la media de la variable diametro situada en el dataframe "medidas"

attach(medidas) #mediante esta instruccion, obtendremos los mismos resultados que anteriormente pero sin necesidad de especificar al dataframe que pertenecen las variables. y asi lo comprobamos a continuacion
mean(peso) 
mean(diametro)
mean(longitud) #excepto en este caso que, como tenemos unos datos asignados a una variable llamada longitud, se toman los datos de esa misma variable y no de la que pertenece al dataframe "attached"
detach(medidas) #a partir de ahora deberemos especificar a que variable nos referimos
# 7. Function WITH (crear nuevas variables a partir de otras pero sin conservarlas)
with(medidas,{
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               # density
  dens       # local variable                     # 
})

medidas #comprobamos que al preguntar por medidas, no ha conservado ninguna de esas variables 
medidas$dens<-with(medidas,{ #con esta instruccion introducimos la variable dens al dataframe "medidas"
  vol=longitud*pi*(diametro/2)^2  # volume
  dens=peso/vol               #  density
  dens                          # 
})
medidas #al preguntar por el dataframe medidas comprobamos que se ha introducido la variable "dens" en dicho dataframe 

#8. SUBSET
hombres<-subset(misDatos,sexo=="H") #hemos creado el dataframe "hombres" que incluye a las personas del dataframe "misDatos" cuyo sexo es "Hombre"
hombres
mujeres<-subset(misDatos,sexo=="M") #hemos creado el dataframe "mujeres" que incluye el conjunto de datos de las personas del dataframe "misDatos" cuyo sexo es "Mujer"
mujeres

mayores<-subset(misDatos,sexo=="H" & edad>30) #hemos creado el dataframe "mayores" que incluye a las personas del dataframe "misDatos" cuyo sexo es "Hombre" y cuya edad sea superior a 30 años
mayores 

jov_habladores<-subset(misDatos,sexo=="H" & edad<30 & tiempo>12) #hemos creado el dataframe "jov_habladores" que incluye a las personas del dataframe "misDatos" cuyo sexo es "Hombre", con edad inferior a 30 años y que tardan más de 12 minutos en realizar el examen
jov_habladores

extremos<-subset(misDatos,edad<25|edad>30) #hemos creado el dataframe "extremos" que incluye a las personas del dataframe "misDatos" cuya edad es inferior a 25 años o bien es superior a 30 años
extremos

hombres<-subset(misDatos,sexo=="H", select=c(edad, tiempo)) #hemos creado el dataframe "hombres" que incluye a las personas del dataframe "misDatos" cuyo sexo es "hombre" pero solo mostrando las variables edad y tiempo
hombres


# 9. MERGE - RBIND

animales1 <- data.frame(animal=c("vaca","perro","rana","lagarto","mosca","jilguero"), 
                       clase=c("mamífero","mamífero","anfibio","reptil","insecto","ave")) #hemos creado el dataframe "animales 1" cuyas variables son animal y clase
animales1
animales2 <- data.frame(animal=c("atún", "cocodrilo", "gato","rana"), clase=c("pez", "reptil", "mamífero","anfibio")) #hemos creado el dataframe "animales 2" cuyas variables son animal y clase
animales2
animales3 <-rbind(animales1,animales2)#hemos creado el dataframe "animales 3" cuyas variables y valores son los de los dataframes animales 1 y animales 2 conjuntamente
animales3
animales4 <- merge(animales1,animales2)#muestra los datos repetidos tantas veces como aparezca
animales4
animales5 <-merge(animales1,animales2,all=TRUE) #muestra todos los datos de ambos dataframes excepto los repetidos
animales5 
superficieAnimales<-data.frame(animal=c("perro","tortuga","jilguero", 
                                       "cocodrilo","vaca","lagarto","sardina"),
                              superficie=c("pelo","placas óseas","plumas",
                                           "escamas","pelo","escamas","escamas")) #creamosun dataframe con las variables animal y superficie
superficieAnimales
merge(animales3,superficieAnimales) # Muestra sólo los animales comunes a ambos dataframes
merge(animales3,superficieAnimales, all.x=TRUE) # Muestra todos los animales del primer dataframe.
merge(animales3,superficieAnimales, all.y=TRUE) # Muestra todos los animales del segundo dataframe.
merge(animales3,superficieAnimales, all=TRUE) # Muestra todos los animales de ambos dataframes.

# 10. sorting DATAFRAMES
ordenacion<-order(animales1$animal) #con esta instruccion te dice la posicion de cada variable, no las ordena
ordenacion  # Posiciones dentro del dataframe 'animales1' de los animales ordenados alfabéticamente
animales1<-animales1[ordenacion,]  # Se reordenan las filas del dataframe animales1
animales1 
animales1<-animales1[order(animales1$animal),]  #se cambia la ordenacion del objeto animales 1
misDatos<-misDatos[order(misDatos$edad,misDatos$tiempo),] #se cambia la ordenacion del objeto misDatos
misDatos #aparecen los daros ordenados
