library(readr)
clientes_data <- read_csv("~/Desktop/fundamentos/DATOS/LA CESTA.csv")
View(clientes_data)
mean(clientes_data$x) 
sd(clientes_data$x)

#a.Quéen un minuto cualquiera no acceda ningún cliente. 

dpois(x=0, lambda=0.78)

#b.Quéen un minuto accedan entre 2 y 5 clientes.

sum(dpois(x=2:5,lambda=0.78))

#Qué en un minuto cualquiera accedan 3 clientes. 

dpois(x=3,lambda=0.78)


#c.Quéen 5 minutos accedan más de 10 clientes.

mediaencincomin <- 0.78*5
mediaencincomin


ppois(q=10, lambda = 3.9, lower.tail = FALSE)

#Adicionalmente,  será  necesario  conocer  también  entre  que  valores  
#se  podría encontrar el número medio de clientes accediendo a la cola única, 
#con un nivel de confianza del 95%.

qpois(0.95,0.78)

#Uno de los miembros del equipo consigue datos relativos al acceso a caja de una empresa 
#competidora del sector, la cual contiene 500 registros y muestra 0,69 como valor medio y 
#desviación típica 0,96. Los miembros del equipo discuten entre la similitud de ambos comercios
#pero deberán buscar una respuesta. Analice el caso y haga una propuesta.
comp<-rnorm(500, mean = 0.69, sd = 0.96)
comp<-as.data.frame(comp)
dif_mean <- t.test(comp, clientes_data$x)
dif_mean
