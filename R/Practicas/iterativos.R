# PROGRAMMING WITH R

### 1. Pythagoras triplets  ###

a<- 34
b<- 12
h<- 66

# Check by calculations
a*a+b*b
h*h
# Better with a function

terna <-function (a, b, h){ #entre corchetes indicamos que va a pasar cuando yo meta terna
  if (a*a+b*b==h*h) {print('Yes, it is a pythagoras triplet')}
  else {print(' No, this is not a p.t.')}
}
# lets try with some examples
terna(a,b,h) #siempre indicando los parametros, cuando utilizamos parametros abstractos nos dara error si no les damos valor a esos parametros
terna(3,4,5)
# 
terna(12, 34, 66)
terna(40, 9, 41)


### 2.  multiple Pythagoras triplets by brute force ### fuerza bruta, recorrer y comprobar todos los posibles valores que cumplen la funcion. es muy rapido pero ejecutar es mas costoso, no es lo ideal utilizar esta estrategia
#2.1 check all triplets with legs between 1-n #(n) el numero maximo 
ternasenm_n<-function(n){
  t<-0 #contabilizar de uno en uno 
  for (a in 1:n){ #a y b valor local 
    for (b in 1:n) {
      h<-sqrt(a*a+b*b) #raiz cuadrada
      if (h==round(h)){ #si el rsultado de h es igual al redondeo de h, es decir (numero entero) lo imprimimos
        t<-t+1; #contabilizar y seguir contando
        print(c(a,b,h))}
    }
  }
  print(t) #cuando ya ha terminado de hacer la funcion, nos enseñara cuantos ha encontrado(14 en el ejemplo)
}
ternasenm_n(20)
#2.2 check all triplets with legs between n-m
ternasenm_n<-function(m, n){ #especificamos valor minimo y valor maximo
  t<-0
  for (a in m:n){
    for (b in m:n) {
      h<-sqrt(a*a+b*b)
      if (h==round(h)){ 
        t<-t+1; 
        print(c(a,b,h))}
    }
  }
  print(t) #podriamos poner cat("hay en total", t, "termas pitagoricas")
}
ternasenm_n(1, 20)
#2.3 avoiding repetitions #ahorramos tiempo de ejecucion #el segundo cateto ya no puedo emplear numeros inferiores al otro cateto para evitar repeticiones
ternasenm_n<-function(m, n){ 
t<-0
for (a in m:n){
  for (b in a:n) { 
    h<-sqrt(a*a+b*b) 
    print(c(a,b,h)) 
      if (h==round(h)){ 
             t<-t+1;
        print("ENCONTRADA",c(a,b,h))} 
    }
  }
print(t)
}
ternasenm_n(1,20)
# linea 61 si queremos ver todos los valores (la "c" es para que lo muestre todo en una linea)
#linea 64 añadir "ENCONTRADA" para que nos señale (y verlo mas claro") cuando se encuentra el cateto pitagorico entero 

#3.1 Euclides equations
## this is an example
m<- 56
n<- 34
## Euclides values are:
a<-m*m-n*n
b<-2*m*n
h<-m*m+n*n
print(c(a,b,h))

## function terna can check the values
terna(a,b,h)


#3.2 Pythagoras equations
## this is an example

k<- 87
## Pythagoras values are:
a<-k*k-1
b<-2*k
h<-k*k+1
print(c(a,b,h))
# also we can write a function for making several  triplets
ternasPyt<-function(n){
  for (k in 2:(n+1)){ #hemos tenido que poner de 2: porque con 1 nos salia un 0 y en este caso no ouede ser, el +1 no se
  a<-k*k-1
  b<-2*k
  h<-k*k+1
  print(c(a,b,h))}
  }

ternasPyt(10)

# 4. Fibonacci series and Pythagoras triplets
# First items within the Fibonacci series
fib<-c(0,1,1,2,3,5,8,13,21,34,55,89)
#  V1 - V4 store 4 Fibonacci values in a row
v1<-89; v2<-55+89; v3<-v1+v2; v4<-v3+v2;
# now we use them to compute a new triplet:
a<- v1*v4
b<-2*v2*v3
h<-v2*v2+v3*v3
# Checking the result
terna(a,b,h)


## the end.

