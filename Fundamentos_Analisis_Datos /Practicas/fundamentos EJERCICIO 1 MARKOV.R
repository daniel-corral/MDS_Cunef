#EJERCICIO 1 EJERCICIOSCMARKOV
#a)
library(markovchain)
estados<-c("A", "B", "C")
byRow<-TRUE
mt<- matrix(data=c(630/700,28/700,42/700,105/750,570/750,75/750,55/550,44/550,451/550), byrow = byRow,
             nrow = 3,dimnames = list(estados, estados))
mt
cmcuota <- new("markovchain", states = estados, byrow = byRow,
               transitionMatrix = mt, name = "cuota")
cmcuota

plot(cmcuota)

#esta es la situacion inicial
sinicial <- c(700/2000, 750/2000, 550/2000)
sinicial
#b)
marzo <- sinicial * (cmcuota^1)
marzo
#c)
mayo <- sinicial * (cmcuota ^ 3)
mayo

#d)Estado estacionario
steadyStates(cmcuota)
