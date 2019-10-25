babymales<-read.csv("~/Desktop/ontario_top_baby_names_male_1917-2016_english.csv", skip=1) #para cambiar el nombre
#rm(list="ontario_top_baby_names_male_1917-2016_english") #para eliminar
head(babymales) #los 6 primeros para que yo me haga una idea, con tail los 6 ultimos
tail(babymales) #podemos aumentar el tamaño de la tabla para que nos puestre por ejemplo los 20 primeros/ultimos registros de esta forma-> head(babymales,20) 
str(babymales)
max(babymales$Year) #como es numerico puedo encontrar el maximo
#podemos filtrar los nombres mas populares el ultimo año, variable año sea igual al maximo
nombres_mas_recientes<-babymales[babymales$Year==max(babymales$Year),] #de babymales solo quiero los que en campo year tenga el máximo. siempre cuando yo pongo entre corchetes-> [restriccion filas,restriccion columnas]. si dejo filas/columnas en blanco es que no pongo ninguna restriccion y por lo tanto quiero que aparezcan todas
nrow(nombres_mas_recientes) #podemos ver cuantas filas -> nrow
sum(nombres_mas_recientes$Frequency) #numero de niños que se han registrado
#ordenar datos en vectores
nombres_mas_recientes <- nombres_mas_recientes[,c("Name", "Frequency")] #restriccion en las columnas
nombres_mas_recientes<-nombres_mas_recientes[order(nombres_mas_recientes$Frequency, decreasing = TRUE),] #restriccion en las filas
write.csv(nombres_mas_recientes, file="male_popularnames.csv", row.names=FALSE) 
head(nombres_mas_recientes,5) #y vemos los 5 nombres mas recientes #creamos un objeto
#name.in<-readline(prompt = "que nombre quieres buscar? :") #hay que escribir nombre en la consola
name.in<-"Liam"
freq.year<-babymales[babymales$Name==toupper(name.in), c("Year","Frequency")] #con toupper para poner en mayusculas. y con esta instruccion nos muestra cuantas veces por año se ha puesto ese nombre cada año
#View(freq.year)
freq.year<-freq.year[order(freq.year$Year),] #ahora nos aseguramos que los nombres estan ordenados por el año
plot(freq.year) #creamos un scatterplot
plot.tittle<-paste("Babies named", toupper(name.in)) #para darle un titulo al scatterplot
g<-plot(freq.year, main=plot.tittle, type="s") #la s es para que salga escalonado el scatterplot
