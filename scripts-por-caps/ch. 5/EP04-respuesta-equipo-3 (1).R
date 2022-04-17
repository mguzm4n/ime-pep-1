#Cargar librerias
library(TeachingDemos)
library(dplyr)
library(ggpubr)
#Cargar dataset de resultados de los juegos olimpicos que indica la raza y los
#tiempos de los atletas actuales y anteriores
data<-read.csv2("EP04-datos.csv")

#1.-
#El Comité Olímpico cree que el mejor tiempo medio de los atletas negros después 
#de ingresar al programa de entrenamiento es de 9,63 segundos. ¿Soportan los 
#datos esta afirmación?

#Definir hipotesis
#H0: mu =  9.63
#Ha: mu != 9.63

#Definir nivel de significancia y valor nulo
alfa<-0.05

#Filtrar datos de atletas negros
atletas_negros<-data%>%filter(Raza=="Negra")

#Verificar si la población sigue una distribución normal mediante el 
#test de shapiro
normalidad<-shapiro.test(atletas_negros[["Posterior"]])

#Como los valores son independientes, el tamaño de la muestra es menor a 30 y
#se corroboro mediante el test de shapiro que la población se distribuye de 
#forma cercana a la normal; se utiliza la prueba T para evaluar la hipotesis

#Calcular estadisticos de la muestra
media<-mean(atletas_negros$Posterior)
dv<-sd(atletas_negros$Posterior)

#Realiza la prueba t
prueba_1<-t.test(atletas_negros[["Posterior"]],mu=9.63,alternative = "two.sided",
                 stdev = dv,conf.level = 1-alfa)
print(prueba_1)

# Hay suficiente evidencia para aceptar la hipotesis alternativa con una 
# significancia de 0.05; por ende los datos no soportan la afirmación planteada




# 2.

# ¿Sugieren los datos que la mejor marca de los atletas blancos se reduce en 
# menos de 1,16 segundos tras el entrenamiento?


# H_0 : Tras el entrenamiento, 
# H_1 : mu != 

#Establecer vector con la diferencia de tiempo de los atletas blancos

atletas_blancos<-data %>% filter(Raza == "Blanca")
dif_blanco <- atletas_blancos$Posterior - atletas_blancos$Previo

#Verificar utilizando el test de shapiro si la distribución es normal
normalidad<-shapiro.test(dif_blanco)

#Como la distribución es normal, con tamaño menor a 30 e independiente se 
#utiliza la prueba t de student

#Realizar la prueba de t student
prueba_2<-t.test(x = dif_blanco,
                 y = NULL,
                alternative = "less",
                mu = 1.16,
                conf.level = 1-alfa)

print(prueba_2)
