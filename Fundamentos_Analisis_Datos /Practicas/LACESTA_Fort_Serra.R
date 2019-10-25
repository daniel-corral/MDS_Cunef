library(readr)
clientes_data <- read_csv("~/Desktop/fundamentos/DATOS/LA CESTA.csv")
View(clientes_data)
media<-mean(clientes_data$x) #hayamos la media de clientes por minuto
desviación<-sd(clientes_data$x) #y la desviación standard
media 
desviación
#a.Qué en un minuto cualquiera no acceda ningún cliente. 

dpois(x=0, lambda=0.78) #con dpois calculamos los resultados de la función de densidad.Lambda es igual a la media. x=0 hace referencia a que en un minuto no acceda ningun cliente

#b.Qué en un minuto accedan entre 2 y 5 clientes.

sum(dpois(x=2:5,lambda=0.78)) #Con esta funcion calculamos la suma de las funciones de densidad de que accedan 2, 3, 4 y 5 clientes en un minuto

#Qué en un minuto cualquiera accedan 3 clientes. 

dpois(x=3,lambda=0.78) 


#d.Qué en 5 minutos accedan más de 10 clientes.

media5min<- 0.78*5
media5min


ppois(q=10, lambda = 3.9, lower.tail = FALSE) # ppois calcula la función de probabilidad acumulada, calcula la probabilidad de que una variable aleatoria sea mayor o igual (como en este caso) o menor o igual a un valor.
#0.78 era la media de clientes en un minuto, por lo que la media de clientes en 5 minutos = 0.78*5, así que lambda pasa a ser= 0.78*5
#ponemos "lower.tail = FALSE" ya que queremos calcular la probabilidad de que accedan 10 o más clientes, si no lo pusieramos nos calcularia por defecto la probabilidad de que accedieran 10 o menos cluentes

#Adicionalmente,  será  necesario  conocer  también  entre  que  valores  
#se  podría encontrar el número medio de clientes accediendo a la cola única, 
#con un nivel de confianza del 95%.

n=600
nivconf=0.95
alpha=0.05
#calculamos el valor de t para alpha/2, obteniendo que es igual a 1.96393 con n-1 grados de libertad
t=qt(1-(alpha/2),n-1) 
t
#A partir del error estándar se construye el intervalo de confianza 
#El error estándar de la media es una medida del error que se comete al tomar la media calculada en una muestra como estimación de la media de la población total.
# El error estándar de la media se calcula dividiendo la desviación estándar por la raíz cuadrada del tamaño muestral

Intervalo_conf_superior=media+t*sqrt(desviación^2/n) #de esta forma calculamos el valor del intervalo de confianza superior
#que es igual a la media más el margen de error (el cual se calcula multiplicando t para alpha/2 por el error estándard)

Intervalo_conf_inferior=media-t*sqrt(desviación^2/n) #de esta forma calculamos el valor del intervalo de confianza inferior
#que es igual a la media menos el margen de error (el cual se calcula multiplicando t para alpha/2 por el error estándard)

Intervalo_conf_superior
Intervalo_conf_inferior


#Uno de los miembros del equipo consigue datos relativos al acceso a caja de una empresa 
#competidora del sector, la cual contiene 500 registros y muestra 0,69 como valor medio y 
#desviación típica 0,96. Los miembros del equipo discuten entre la similitud de ambos comercios
#pero deberán buscar una respuesta. Analice el caso y haga una propuesta.

competencia<-rnorm(500, mean = 0.69, sd = 0.96) #asignamos a la competencia una distribucion normal con media=0.69 y desviacion tipica=0.96 para obtener y obtenemos los valores del vector

competencia<-as.data.frame(competencia) #con esta funcion creamos un dataframe llamado competencia a partir de los datos conseguidos en la instruccion anterior

difmedias <- t.test(competencia, clientes_data$x) #con esta funcion aplicamos el Student's t-Test para obtener el intervalo de confianza que buscamos.

difmedias #Según los datos que se incluyen en la salida de la función, el intervalo de confianza al 95% de confianza para la 
#diferencia de las medias de ambos comercios es (-0.23875004, -0.01890341). Como el 0 no está contenido dentro de este intervalo, podemos afirmar que 
#la media de clientes por minuto no puede suponerse igual en ambos comercios.

