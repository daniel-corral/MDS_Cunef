library(tidyverse)
library(nycflights13)
data("flights")
filter(flights, month==1, day ==1)
flights[c(flights$month==1, flights$day==1), ]
jan1<-filter(flights, month==1, day ==1)
filter(flights, month==11|month==12)
filter(flights, !(arr_delay >120 | dep_delay>120))
filter(flights, arr_delay <= 120, dep_delay<=120)

#1. 
#a) arrival delay of two or more hours
filter(flights, arr_delay>=120)
#b) flew to IAH or HOU
filter(flights, (dest=="IAH" | dest=="HOU"))
#c) operated by United, american or delta
filter(flights, carrier == 'UA' | carrier == 'AA' | carrier == 'DL')
#d) deprted in summer (july august, september)
filter(flights, month >= 7 & month <= 9)
#e) arrived more than 2 h late but didnt leave late
filter(flights, arr_delay>120, dep_delay<=0)
#f) delayed by at least 1 h but made up over 30 min in flight
filter(flights, dep_delay >= 60, dep_delay-arr_delay > 30)
#g) departed between midnight and 6am (inclusive)
filter(flights, dep_time <=600 | dep_time == 2400)

#2. 
filter(flights, !between(dep_time, 601, 2359))

#3. how many flights have a missing dep time? what other variables are missing? what might these rows represent?
filter(flights, is.na(dep_time)) #missing dep time
summary(flights) #podemos buscar el resumen de cada variable para ver cuantos NA hay
cuantosnadeptime<-sum(is.na(flights$dep_time))
cuantosnadeptime #para saber numero exacto sin tener que mirarlo

#4. 
NA ^ 0 #cualquier cosa elevada a 0 da 1
NA | TRUE #union, la union del todo (TRUE) con algo mas sigue siendo todo
FALSE & NA #la interseccion con la nada (FALSE) sigue siendo la nada

#1. the most delayed flights
arrange(flights, desc(dep_delay))
#flights that left earliest
arrange(flights, dep_delay)

#2. fastest flights
arrange(flights, (distance/air_time))

#3. traveled the longest
arrange(flights, desc(distance))
# the shortest
arrange(flights, distance)


