clientes<-clientes_data$x #esto sirve para que x pase a llamarse clientes
clientes
summary(clientes)
#a. Que en un minuto cualquiera no acceda ningún cliente.
rpois(600,0)

#b. Que en un minuto accedan entre 2 y 5 clientes.

#c. Que en 5 minutos accedan más de 10 clientes.