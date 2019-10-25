#a.  (0.25p) Cúantos alumnos hay en total y la nota media en el examen final sin considerarar los NP
library(readr)
calificaciones_ECO_2019 <- read_delim("calificaciones ECO 2019.csv", 
                                      ";", escape_double = FALSE, locale = locale(decimal_mark = ","), 
                                      trim_ws = TRUE)
#he utilizado "read_delim" para importar los datos porque he cambiado el delimitador a ";" y la marca de decimal a ","
View(calificaciones_ECO_2019)
nrow(calificaciones_ECO_2019) #Vemos el número de alumnos
cat("El número total de alumnos es:", nrow(calificaciones_ECO_2019))
media<- mean(calificaciones_ECO_2019$`Ex. JUNIO-12P`, na.rm = TRUE)*10/12 
cat("La media en el examen final sin considerar los NP es de",media)  #Muestra la media de la nota del examen final corregido sobre 10 (ya que inicialmente es sobre 12)

#b. (1p) Nombre de los que han aprobado el examen final a pesar de haber asistido menos de un 50% a las clases.
examen_noasistencia<-calificaciones_ECO_2019[,c(1,7,8)]
examen_noasistencia<-subset(examen_noasistencia, examen_noasistencia$`Asistencia -1P`<0.5&examen_noasistencia$`Ex. JUNIO-12P`>=6)
examen_noasistencia
cat("Han aprobado el examen fnal pero han asistido menos de un 50% a las clases los siguentes alumnos:" ,examen_noasistencia$`NOMBRE ALUMNO`)


#c. (1p) Completa la columna de calificacion con: Aprobado (5-6.9), Notable (7-8.9), Sobresaliente (9-10). Ten encuenta que las calificaciones así descritas deben darse sobre 10
for (i in 1:length(calificaciones_ECO_2019$`NOMBRE ALUMNO`)) {
  if(calificaciones_ECO_2019$Nota_FINAL[i]<5){
    calificaciones_ECO_2019$CALIFICACION[i]<-"Suspenso"}
  if(calificaciones_ECO_2019$Nota_FINAL[i]>=5&calificaciones_ECO_2019$Nota_FINAL<7){
    calificaciones_ECO_2019$CALIFICACION[i]<-"Aprobado"}
  if(calificaciones_ECO_2019$Nota_FINAL[i]>=7&calificaciones_ECO_2019$Nota_FINAL<9){
    calificaciones_ECO_2019$CALIFICACION[i]<-"Notable"}
  if(calificaciones_ECO_2019$Nota_FINAL[i]>=9&calificaciones_ECO_2019$Nota_FINAL<=10){
    calificaciones_ECO_2019$CALIFICACION[i]<-"Sobresaliente"}
}

#d. (0.25) Guarda la tabla modificada en el proyecto Practica2 con el nombre Calificaciones2019.csv

write.table(calificaciones_ECO_2019, file = "Calificaciones2019.csv", dec = ".", row.names = FALSE)

