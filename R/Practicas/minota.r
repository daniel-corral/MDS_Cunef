#1 calcular nota final
minota <- function(a,p,e) {
  nota <- a*.1+p*.4+e*.5
  if (e<5)
    return(min(4,nota))
  else
    return(nota)
}
minota(7,0,5) #si queremos que por ejemplo la asistencia todos tengan un 10, podemos borrar el parametro y por defecto le pone un 10


#2 calcular cuntos alumnos han suspendido a causa de no superar el examen
#primero vamos a crear un dataframe
nombres<-c("Maria","Marta","Javier","Alvaro","Beltran")
nota_calculada<-c(4.5,6,7.3,2.5,5.6)
nota_definitiva<-c(4,4,7.3,2.5,4)
notas_alumnos<-data.frame(nombres, nota_calculada, nota_definitiva)
nosuperan<-function(notas_alumnos) { 
  p<-0 #puntero, contador a cero
  lista<-c()
  for (i in 1:as.integer(length(notas_alumnos$nombres))){
    if(nota_calculada[i]!=nota_definitiva[i] | nota_definitiva[i]<5){
      p<-p+1; 
      lista<-append(lista, as.character(notas_alumnos$nombres[i]))
      }
  }
  cat("El numero de suspensos es",p)
  print(lista)
}
nosuperan(notas_alumnos)
