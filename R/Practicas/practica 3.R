#Escribir una función que calcule n ternas pitagóricas procedentes de una 4-secuencia de la serie de fibonacci.  Se valorará escribir una función adicional que calcule números de fibonacci.
fibonacci<-function(n){ 
  if(n<1){ #n no puede ser un número negativo ni igual a cero
    return("Introduce un numero mayor a 0") 
  }
  if (n < 3) { #esta condicion es para los dos primeros numeros de la serie de fibonacci (posiciones 1 y 2)
    return (c(0, 1)[1:n]) #estos dos primeros numeros siempre son 0 y 1, con [1:n] indicamos que si n=1 nos devuelva solo la primera posicion y si n=2 nos devuelva las dos primeras
  }
  if(n>2){ #esta condicion es para series de fibonacci con 3 o mas numeros
    secuenciaf<-seq(0,n-1) #creamos una secuencia que va desde la primera posicion de fibonacci hasta n-1 (esto es para que la dimension de la secuencia coincida con la de funcion de fibonacci, y no nos añada al final "n")
    for (i in 3:n) {  
      secuenciaf[i]<-secuenciaf[i-1]+secuenciaf[i-2] #a partir de la tercera posicion de la serie de fibonacci el numero se forma con la suma de los dos anteriores
    }
    return(secuenciaf)
  }
}  
fibonacci(10)
fibonacci(2)

nterna<-function(n){
  if(n<1){
    return("Introduzca valores mayor o igual a 1")
  }
  else
  cuaternaf<-c(fibonacci(n+4)) #esto es porque para calcular las ternas pitagoricas "nternas(n)" necesitamos la secuencia de fibonacci(n) más los siguientes cuatro digitos (no son 3 para evitar coger el primer digito de la secuencia de fibonacci que es 0 y asi que no nos salga un triangulo con un lado de 0cm)
  m<-matrix(nrow=n, ncol=3) #creamos una matriz vacia de 3 columnas para que nos ordene de 3 en 3 el resultado y verlo mas claro
  for (i in 1:n){ #esto es para tomar los 4 numeros consecutivos de la sucesion de Fibonacci
    v1<-cuaternaf[(i+1)] #ponemos i+1 para que no nos coja el valor 0 del primer numero de fibonacci, porque ningun triangulo tiene un lado de 0 cm 
    v2<-cuaternaf[(i+2)] #consecuentemente, aqui es i+2 
    v3<-cuaternaf[(i+3)] #aqui i+3
    v4<-cuaternaf[(i+4)] #y finalmente i+4
    a<-v1*v4 #el producto de los dos extremos seria el primer lado de la terna pitagorica
    b<-2*v2*v3 #el doble del producto de los dos centrales seria otro lado de la terna pitagorica
    h<-(v2*v2)+(v3*v3) #el ultimo lado es la suma de los cuadrados de los dos centrales
    m[i,]<-c(a,b,h) #rellenamos la matriz con los datos obtenidos
  }
  return(m) 
}
nterna(8)

