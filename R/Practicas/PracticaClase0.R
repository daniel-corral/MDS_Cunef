# EJERCICIO  1
#1. INTRODUCIR DATOS Y CREAR OBJETOS CON METADATOS
edad<-c(18,19,NA,18,24,17,22,15,22,25,NA,16,23,16)
sexo<-c(0,1,0,0,1,0,0,1,1,0,0,1,0,1)
estudios<-c(1,2,0,1,3,2,3,1,2,3,1,2,3,0)
sexo<-factor(sexo, levels=c(0,1),
            labels=c("Hombre","Mujer"))
estudios<-factor(estudios, levels=c(0,1,2,3),
                labels=c("Ninguno","Primarios",
                         "Secundarios","Superiores"))
#2. ESTUDIAR LOS DATOS: TABLA DE FRECUENCIAS UNIDIMENSIONALES
table(edad)
prop.table(table(edad))
table(edad,useNA="ifany")

#3.ESTUDIAR LOS DATOS:  TABLA DE REFERENCIAS CRUZADAS
table(estudios,sexo)
prop.table(table(estudios,sexo))
prop.table(table(estudios,sexo),1)
prop.table(table(estudios,sexo),2)

#4. ESTUDIAR LOS DATOS: SIMPLIFICACAR USANDO OBJETOS DE ALMACENAMIENTO (este apartado hace lo mismo que el 3 pero tarda 3 veces más en ejecutarse)
t<-table(estudios,sexo)
prop.table(t)
prop.table(t,1)
prop.table(t,2)

#5. AGRUPAR DATOS PARA VARIABLES CONTINUAS
range(edad,na.rm=TRUE) #na.rm=TRUE sirve para quitarlos porque sino no podemos calcular el rango, significa removiendo los NA y hay que hacerlo siempre que queremos hacer cálculos. si no lo hicieramos al calcular el rango, nos saldria rango desde NA a NA
nc<-nclass.Sturges(edad)  # N. de intervalos+1 (limites)
nc
lc<-seq(15,25,length=nclass.Sturges(edad))  # Limites de los intervalos-clases, podemos hacer de length=nclass.Sturges(edad), más fácil length=nc
lc


#6. CONSTRUIR INTERVALOS CON cut():

?cut

intervalosEdad<-cut(edad,breaks=seq(15,25,length=nc),include.lowest=TRUE) #porque sino el 15 quedaría fuera (los intervalos son así]
intervalosEdad # Se muestran los intervalos de edad, uno correspondiente a cada edad observada
#hemos conseguido que las eades se clasifiquen por rango
table(intervalosEdad)
tintervalos<-table(intervalosEdad)

#7. ESTADISTICOS DESCRIPTIVOS
mean(edad, na.rm=TRUE)
sd(edad, na.rm=TRUE)
summary(edad) #diferencia entre edad (no categórica) y estudios y sexo (categoricas). dependiendo de las circunstancias el summary es distinto
summary(estudios)
summary(sexo)
misDatos<-data.frame(edad,estudios,sexo) #no aparece en values, aparece como data
summary(misDatos)

#8. DATOS AGREGADOS POR GRUPOS (trnsformar conjunto de valores o datos en un solo dato) (como resumir) f(x1,x2,x3)=y
aggregate(edad,by=list(sexo),mean) #los vamos a agregar por sexo (by=list(sexo))

aggregate(edad,by=list(sexo),mean,na.rm=TRUE) #como hay NA en hombres, el resultado no es del todo fiable



#9. REPRESENTACIONES GRAFICAS
#help(pie) (help no funciona sin internet y te da una info más a fondo y ? sí funciona sin internet)
pie(table(estudios))
#help(barplot)
barplot(table(sexo))
#help(hist) histograma lo mas interesante sobre todo para la distribucion de los datos. si son datos no categoricos mejor
hist(edad)
#help(boxplot)enfrentar 2 variables en este caso. bis duce cini se distribuyen los datos en este caso la edad y nos dice que la mediana de la edad de los hombres son 20 años y los datos se dispersan más hacia arriba que hacua abajo. 
boxplot(edad~sexo)

